module l2_control (
    input logic clk,
    input logic rst,

    // datapath
    input logic [1:0] cmp, dirty, valid,
    input logic lru,
    output logic sel, data_in_sel,
    output logic [1:0] write_en,
    output logic load_lru, load_dirty, load_valid,
    output logic [1:0] load_tag,
    output logic lru_in,
    output logic [1:0] dirty_in, valid_in,

    // cpu & bus_adapter
    input logic mem_read, mem_write,
    output logic resp,

    // cacheline adaptor
    input logic cacheline_resp,
    output logic cacheline_write,
    output logic cacheline_read
);

enum int unsigned {
    /* List of states */
    idle, read_check, write_check,
    write_back, meta_update, read_mem,
    read_end, write_end,
    wait0, wait1, wait2
} state, next_state;

logic prev_lru;

always_ff @(posedge clk)
begin
    /* Assignment of next state on clock edge */
    state <= rst? idle : next_state;

    /* update prev_lru */
    if (load_lru) prev_lru <= lru;
end

always_comb begin // next state logic
    case(state)
        idle: begin
            if (mem_read & mem_write) begin
                next_state = idle; // no flush support
            end
            else if (mem_read | mem_write) begin
                if ((valid & cmp) == 2'b00) begin // read miss
                    if(dirty[lru] & valid[lru]) next_state = write_back;
                    else next_state = read_mem;
                end else next_state = idle;
            end
            else next_state = idle;
        end

        write_back: begin
            if (cacheline_resp) next_state = meta_update;
            else next_state = write_back;
        end

        meta_update: next_state = read_mem;

        read_mem: begin
            if (!cacheline_resp) next_state = read_mem;
            else next_state = mem_write ? write_end : read_end;
        end

        read_end, write_end: next_state = wait0;
        wait0: next_state = wait1;
        // wait1: next_state = wait2;

        default: next_state = idle;
    endcase
end

always_comb begin // state actions
    // set defaults
    sel = cmp[1] & valid[1]; // encoder
    data_in_sel = 1'b0;
    write_en = 2'b00;
    load_tag = 2'b00;
    load_lru = 1'b0;
    load_dirty = 1'b0;
    load_valid = 1'b0;
    resp = 1'b0;
    lru_in = lru;
    valid_in = valid;
    dirty_in = dirty;
	cacheline_read = 1'b0;
	cacheline_write = 1'b0;

    case(state)
    idle: begin
        if (mem_read & mem_write) begin
            // do nothing
        end else if (mem_read) begin
            if ((cmp & valid) != 2'b00) begin // read hit
            resp = 1'b1;
            lru_in = cmp[0] & valid[0];
            load_lru = 1'b1;
            end else if (!(dirty[lru] & valid[lru])) begin // read miss (no write_back)
                lru_in = ~lru;
                load_lru = 1'b1;
                // new data is clean and valid
                dirty_in[lru] = 1'b0;
                load_dirty = 1'b1;
                valid_in[lru] = 1'b1;
                load_valid = 1'b1;

                // tag update
                load_tag[lru] = 1'b1;
            end
        end else if (mem_write) begin
            if ((cmp & valid) != 2'b00) begin // write hit
                resp = 1'b1;
                lru_in = cmp[0] & valid[0];
                load_lru = 1'b1;
                write_en = cmp & valid;
                dirty_in[(cmp[1] & valid[1])] = 1'b1;
                load_dirty = 1'b1;
                
            end else if (!(dirty[lru] & valid[lru])) begin // write miss (no write_back)
                lru_in = ~lru;
                load_lru = 1'b1;
                // new data is dirty and valid
                dirty_in[lru] = 1'b1;
                load_dirty = 1'b1;
                valid_in[lru] = 1'b1;
                load_valid = 1'b1;

                // tag update
                load_tag[lru] = 1'b1;
            end            
        end
    end

    write_back: begin
        sel = lru;
        cacheline_write = 1'b1;
    end

    meta_update: begin
        lru_in = ~lru;
        load_lru = 1'b1;
        // new data is valid
        dirty_in[lru] = mem_write;
        load_dirty = 1'b1;
        valid_in[lru] = 1'b1;
        load_valid = 1'b1;

        // tag update
        load_tag[lru] = 1'b1;
    end

    read_mem: begin
        data_in_sel = 1'b1;
        write_en[prev_lru] = 1'b1;
        cacheline_read = 1'b1;
    end

    read_end: begin
        resp = 1'b1;
    end

    write_end: begin
        resp = 1'b1;
        write_en = cmp & valid;
    end

    default: ;

    endcase
    
end

endmodule
