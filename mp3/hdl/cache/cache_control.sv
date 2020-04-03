module cache_control (
    input logic clk,
    input logic rst,

    // datapath
    input logic [1:0] cmp, dirty, valid,
    input logic lru,
    output logic sel, data_in_sel,
    output logic [31:0] write_en0, write_en1,
    output logic load_lru, load_dirty, load_valid,
    output logic [1:0] load_tag,
    output logic lru_in,
    output logic [1:0] dirty_in, valid_in,
    output logic [2:0] flush_index,
    output logic index_sel,

    // cpu & bus_adapter
    input logic mem_read, mem_write,
    input logic [31:0] mem_byte_enable256,
    output logic resp,

    // cacheline adaptor
    input logic cacheline_resp,
    output logic cacheline_write,
    output logic cacheline_read
);

logic [3:0] flush_counter, counter_next;

enum int unsigned {
    /* List of states */
    idle, read_check, write_check,
    write_back, meta_update, read_mem,
    read_end, write_end,
    flush0, flush1, flush_check, flush2
} state, next_state;

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
    state <= rst? idle : next_state;
    flush_counter <= counter_next;
end

always_comb begin // next state logic
    case(state)
        idle: begin
            if (mem_read & mem_write) begin
                next_state = flush_check;
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

        flush_check: begin
            next_state = (valid[flush_counter[3]] & dirty[flush_counter[3]]) ? flush0 : flush1;
        end

        flush0: begin
            next_state = cacheline_resp ? flush1 : flush0;
        end

        flush1: begin
            next_state = (flush_counter == 4'hF) ? idle : flush2;
        end

        flush2: begin
            next_state = flush_check;
        end

        default: next_state = idle;
    endcase
end

always_comb begin // state actions
    // set defaults
    sel = cmp[1] & valid[1];
    data_in_sel = 1'b0;
    write_en0 = 0;
    write_en1 = 0;
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
    counter_next = flush_counter;
    index_sel = mem_write & mem_read;
    flush_index = flush_counter[2:0];

    case(state)
    idle: begin
        counter_next = 4'h0;
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
                write_en0 = mem_byte_enable256 & {32{cmp[0] & valid[0]}};
                write_en1 = mem_byte_enable256 & {32{cmp[1] & valid[1]}};
                dirty_in[(cmp[1] & valid[1])] = 1'b1;
                load_dirty = 1'b1;
                
            end else if (!(dirty[lru] & valid[lru])) begin // write miss (no write_back)
                lru_in = ~lru;
                load_lru = 1'b1;
                // new data is clean and valid
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
        if (lru) write_en0 = {32{1'b1}};
        else write_en1 = {32{1'b1}};
        cacheline_read = 1'b1;
    end

    read_end: begin
        resp = 1'b1;
    end

    write_end: begin
        resp = 1'b1;
        if (cmp[0] & valid[0]) write_en0 = mem_byte_enable256;
        else write_en1 = mem_byte_enable256;
    end
	 
	 flush_check: begin
    end

    flush0: begin
        sel = flush_counter[3];
        cacheline_write = 1'b1;
    end

    flush1: begin
        dirty_in[flush_counter[3]] = 1'b0;
        load_dirty = 1'b1;
        counter_next = flush_counter + 4'h1;
        resp = (flush_counter == 4'hF)? 1'b1 : 1'b0;
    end

    default: ;

    endcase
    
end

endmodule : cache_control
