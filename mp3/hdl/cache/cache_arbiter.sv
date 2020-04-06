module cache_arbiter (
    input logic clk,
    input logic rst,

    // dcache interface
    input logic dcache_read, dcache_write,
    input logic [31:0] dcache_address,
    input logic [255:0] dcache_wdata,
    output logic [255:0] dcache_rdata,
    output logic dcache_resp,

    // icache interface
    input logic icache_read,
    input logic [31:0] icache_address,
    output logic [255:0] icache_rdata,
    output logic icache_resp,

    // L2 cache interface
    output logic l2_read, l2_write,
    output logic [31:0] l2_address,
    output logic [255:0] l2_wdata,
    input logic [255:0] l2_rdata,
    input logic l2_resp
);

enum int unsigned {
    /* List of states */
    idle, inst, data
} state, next_state;

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
    state <= rst? idle : next_state;
end

always_comb begin : Next_state_logic
    // default:
    next_state = state;
    case(state)
        idle: begin
            if (icache_read) next_state = inst; // prioritize instruction cache
            else if (dcache_read | dcache_write) next_state = data;
        end

        inst: begin
            if (~icache_read & (dcache_read | dcache_write)) next_state = data;
            else if (~(icache_read | dcache_read | dcache_write)) next_state = idle;
        end

        data: begin
            if (~(dcache_read | dcache_write) & icache_read) next_state = inst;
            else if (~(icache_read | dcache_read | dcache_write)) next_state = idle;
        end

        default: next_state = idle;
    endcase
end

always_comb begin : MUX
    if (state == inst) begin
        l2_read = icache_read;
        l2_write = 1'b0;
        l2_address = icache_address;
        icache_resp = l2_resp;
        dcache_resp = 1'b0;
    end else if (state == data) begin
        l2_read = dcache_read;
        l2_write = dcache_write;
        l2_address = dcache_address;
        icache_resp = 1'b0;
        dcache_resp = l2_resp;
    end else begin
      l2_read = 1'b0;
      l2_write = 1'b0;
      l2_address = dcache_address;
      icache_resp = 1'b0;
      dcache_resp = 1'b0;
    end
    l2_wdata = dcache_wdata;
    icache_rdata = l2_rdata;
    dcache_rdata = l2_rdata;
end

endmodule
