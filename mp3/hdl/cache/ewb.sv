module ewb (
    input logic clk, rst,
    // L2 - EWB
    input logic read_i, write_i,
    input logic [255:0] wdata_i, 
    input logic [31:0] addr_i,
    output logic [255:0] rdata_o,
    output logic resp_o,

    // L2 - pmem
    input logic [255:0] rdata_i,
    output logic [255:0] wdata_o,
    output logic [31:0] addr_o,
    output logic read_o, write_o,
    input logic resp_i
);

enum int {idle, wait_count, read, write} state, next_state;

logic [255:0] data;
logic [31:0] addr;
logic valid, match;
logic [2:0] counter;

int eviction_write_counter;

assign match = (addr_i == addr) && valid;

always_ff @(posedge clk) begin
    state <= rst ? idle : next_state;
end

always_ff @(posedge clk) begin
    if (rst) eviction_write_counter <= 0;
	 else if (state == idle && write_i) eviction_write_counter <= eviction_write_counter + 1;
end

always_ff @(posedge clk) begin
    if (rst) begin
        valid <= 1'b0;
    end else if (state == idle && write_i) begin
        addr <= addr_i;
        data <= wdata_i;
    end
end

always_ff @(posedge clk) begin
    counter <= (state == wait_count) ? (counter - '1) : 3'd7;
end

always_comb begin
    next_state = state;
    read_o = 1'b0;
    write_o = 1'b0;
    rdata_o = data;
    wdata_o = data;
    addr_o = addr;
    resp_o = 1'b0;

    case(state)
        idle: begin
            if (read_i) begin
                if (match) begin // EWB hit
                    next_state = idle;

                    rdata_o = data;
                    resp_o = 1'b1;
                end else begin  // EWB miss
                    next_state = idle;

                    rdata_o = rdata_i;
                    read_o = read_i;
                    addr_o = addr_i;
                    resp_o = resp_i;
                end
            end else if (write_i) begin
                next_state = wait_count;

                resp_o = 1'b1;
            end
        end

        wait_count: begin
            if (read_i) next_state = read;
            else if (counter == 0 || write_i) next_state = write;
            else next_state = wait_count;
        end

        read: begin
            next_state = resp_i ? write : read;

            rdata_o = rdata_i;
            read_o = read_i;
            addr_o = addr_i;
            resp_o = resp_i;
        end

        write: begin
            next_state = resp_i ? idle : write;

            wdata_o = data;
            addr_o = addr;
            write_o = 1'b1;

            rdata_o = data;
            resp_o = read_i && match;
        end

        default: next_state = idle;
    endcase
end

endmodule
