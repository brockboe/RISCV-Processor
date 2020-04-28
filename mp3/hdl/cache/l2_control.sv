module l2_control (
    input logic clk,
    input logic rst,

    // datapath
    input logic [7:0] cmp, dirty, valid,
    input logic [2:0] lru,
    output logic [2:0] sel, 
    output logic data_in_sel,
    output logic [7:0] write_en,
    output logic load_lru, load_dirty, load_valid,
    output logic [7:0] load_tag,
    output logic [2:0] mru,
    output logic [7:0] dirty_in, valid_in,
    input logic [31:0] addr,
    output logic [31:0] prefetch_addr,
    output logic addr_sel,

    // cpu & bus_adapter
    input logic mem_read, mem_write,
    output logic resp,

    // cacheline adaptor
    input logic cacheline_resp,
    output logic cacheline_write,
    output logic cacheline_read
);

// helper functions
// encoder
function logic [2:0] enc (logic [7:0] data);
    logic [2:0] out;
    case(data)
        8'h01: out = 3'b000;
        8'h02: out = 3'b001;
        8'h04: out = 3'b010;
        8'h08: out = 3'b011;
        8'h10: out = 3'b100;
        8'h20: out = 3'b101;
        8'h40: out = 3'b110;
        8'h80: out = 3'b111;
        default: out = 3'bxxx;
    endcase
    return out;
endfunction

// decoder
function logic [7:0] dec (logic [2:0] data);
    return (8'h01 << data);
endfunction

enum int unsigned {
    /* List of states */
    idle, read_check, write_check,
    write_back, meta_update, read_mem,
    read_end, write_end,
    wait0, wait1, wait2, prefetch_prep,
    prefetch_check, prefetch_wb, prefetch_update, prefetch_read
} state, next_state;

logic [2:0] prev_lru;

// cache hit/miss counters
int hit_count, hit_count_next;
int miss_count, miss_count_next;
int prefetch_hit_count, prefetch_hit_count_next;
int prefetch_miss_count, prefetch_miss_count_next;


always_ff @(posedge clk)
begin
    /* Assignment of next state on clock edge */
    state <= rst? idle : next_state;

    /* update prev_lru */
    if (load_lru) prev_lru <= lru;

    /* update prefetch addr */
    if (state == idle && mem_read) prefetch_addr <= (addr + (1 << 5));
	 
	 hit_count <= rst ? 0 : hit_count_next;
	 miss_count <= rst ? 0 : miss_count_next;
    prefetch_hit_count <= rst ? 0 : prefetch_hit_count_next;
    prefetch_miss_count <= rst ? 0 : prefetch_miss_count_next;
end

always_comb begin // next state logic
    hit_count_next = hit_count;
	miss_count_next = miss_count;
    prefetch_hit_count_next = prefetch_hit_count;
    prefetch_miss_count_next = prefetch_miss_count;
	case(state)
        idle: begin
            if (mem_read & mem_write) begin
                next_state = idle; // no flush support
            end
            else if (mem_read | mem_write) begin
                if ((valid & cmp) == '0) begin // cache miss
                    if(dirty[lru] & valid[lru]) next_state = write_back;
                    else next_state = read_mem;
						miss_count_next = miss_count + 1;
                end else begin
					    next_state = mem_read ? prefetch_prep : wait1; // if read, go to prefetch
                        // next_state = idle;
						hit_count_next = hit_count + 1;
				end
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

        read_end: next_state = prefetch_prep;
        write_end: next_state = wait1;

        prefetch_prep: next_state = prefetch_check;

        prefetch_check: begin
            if ((valid & cmp) == '0) begin // cache miss
                if(dirty[lru] & valid[lru]) next_state = prefetch_wb;
                else next_state = prefetch_read;
                prefetch_miss_count_next = prefetch_miss_count + 1;
            end else begin
				next_state = idle; // next line is already in cache
                prefetch_hit_count_next = prefetch_hit_count + 1;
            end
        end

        prefetch_wb: next_state = cacheline_resp ? prefetch_update : prefetch_wb;

        prefetch_update: next_state = prefetch_read;

        prefetch_read: next_state = cacheline_resp ? idle : prefetch_read;

        default: next_state = idle;
    endcase
end

always_comb begin // state actions
    // set defaults
    sel = enc(cmp & valid); // encoder
    data_in_sel = 1'b0;
    addr_sel = 1'b0;
    write_en = '0;
    load_tag = '0;
    load_lru = 1'b0;
    load_dirty = 1'b0;
    load_valid = 1'b0;
    resp = 1'b0;
    mru = enc(cmp & valid);
    valid_in = valid;
    dirty_in = dirty;
	cacheline_read = 1'b0;
	cacheline_write = 1'b0;

    case(state)
    idle: begin
        if (mem_read & mem_write) begin
            // do nothing
        end else if (mem_read) begin
            if ((cmp & valid) != '0) begin // read hit
            resp = 1'b1;
            load_lru = 1'b1;
            end else if (!(dirty[lru] & valid[lru])) begin // read miss (no write_back)
                mru = lru;
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
            if ((cmp & valid) != '0) begin // write hit
                resp = 1'b1;
                load_lru = 1'b1;
                write_en = cmp & valid;
                dirty_in[enc(cmp & valid)] = 1'b1;
                load_dirty = 1'b1;
                
            end else if (!(dirty[lru] & valid[lru])) begin // write miss (no write_back)
                mru = lru;
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
        mru = lru;
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

    prefetch_prep: begin
        addr_sel = 1'b1;
    end

    prefetch_check: begin
        if ((cmp & valid) == '0) begin // read miss
            if (!(dirty[lru] & valid[lru])) begin // read miss (no write_back)
                mru = lru;
                load_lru = 1'b1;
                // new data is clean and valid
                dirty_in[lru] = 1'b0;
                load_dirty = 1'b1;
                valid_in[lru] = 1'b1;
                load_valid = 1'b1;

                // tag update
                load_tag[lru] = 1'b1;
            end
            addr_sel = 1'b1;
        end else addr_sel = 1'b0;
    end

    prefetch_wb: begin
        addr_sel = 1'b1;
        sel = lru;
        cacheline_write = 1'b1;
    end

    prefetch_update: begin
        addr_sel =  1'b1;
        mru = lru;
        load_lru = 1'b1;
        // new data is valid
        dirty_in[lru] = 1'b0;
        load_dirty = 1'b1;
        valid_in[lru] = 1'b1;
        load_valid = 1'b1;

        // tag update
        load_tag[lru] = 1'b1;
    end

    prefetch_read: begin
        addr_sel = cacheline_resp ? 1'b0 : 1'b1;
        data_in_sel = 1'b1;
        write_en[prev_lru] = 1'b1;
        cacheline_read = 1'b1;
    end

    default: ;

    endcase
    
end

endmodule
