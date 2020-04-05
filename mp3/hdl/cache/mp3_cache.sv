module mp3_cache (
    input logic clk,
    input logic rst,

    // datapath
    input logic icache_read,
    input logic [31:0] icache_address,
    output logic [31:0] icache_rdata,
    output logic icache_resp,

    input logic dcache_read, dcache_write,
    input logic [3:0] dcache_mbe,
    input logic [31:0] dcache_address,
    input logic [31:0] dcache_wdata,
    output logic [31:0] dcache_rdata,
    output logic dcache_resp,

    // pmem
    input logic pmem_resp,
    input logic [63:0] pmem_rdata,
    output logic pmem_read,
    output logic pmem_write,
    output logic [31:0] pmem_address,
    output logic [63:0] pmem_wdata
);

cache icache(
    .clk, .rst,
    // to cpu
    .mem_read(icache_read), .mem_write(1'b0),
    .mem_byte_enable(4'b1111),
    .mem_wdata(), 
    .mem_address(icache_address),
    .mem_rdata(icache_rdata),
    .mem_resp(icache_resp),

    // to cacheline_adapter
    .pmem_rdata(i_a_rdata),
    .pmem_wdata(),
    .pmem_address(i_a_address),
    .pmem_read(i_a_read), .pmem_write(),
    .pmem_resp(i_a_resp)
);

// Signals between icache and arbiter
logic [255:0] i_a_rdata;
logic [31:0] i_a_address;
logic i_a_read;
logic i_a_resp;

cache dcache(
    .clk, .rst,
    // to cpu
    .mem_read(dcache_read), .mem_write(dcache_write),
    .mem_byte_enable(dcache_mbe),
    .mem_wdata(dcache_wdata), 
    .mem_address(dcache_address),
    .mem_rdata(dcache_rdata),
    .mem_resp(dcache_resp),

    // to cacheline_adapter
    .pmem_rdata(d_a_rdata),
    .pmem_wdata(d_a_wdata),
    .pmem_address(d_a_address),
    .pmem_read(d_a_read), .pmem_write(d_a_write),
    .pmem_resp(d_a_resp)
);

// Signals between dcache and arbiter
logic [255:0] d_a_rdata;
logic [255:0] d_a_wdata;
logic [31:0] d_a_address;
logic d_a_read, d_a_write;
logic d_a_resp;

cache_arbiter arbiter(
    .clk,
    .rst,
    
    // dcache interface
    .dcache_read(d_a_read),
    .dcache_write(d_a_write),
    .dcache_address(d_a_address),
    .dcache_wdata(d_a_wdata),
    .dcache_rdata(d_a_rdata),
    .dcache_resp(d_a_resp),

    // icache interface
    .icache_read(i_a_read),
    .icache_address(i_a_address),
    .icache_rdata(i_a_rdata),
    .icache_resp(i_a_resp),

    // L2 cache interface
    .l2_read, 
    .l2_write,
    .l2_address,
    .l2_wdata,
    .l2_rdata,
    .l2_resp
);

logic l2_read, l2_write, l2_resp;
logic [31:0] l2_address;
logic [255:0] l2_wdata, l2_rdata;

// L2 cache (cp3)

cacheline_adapter adapter(
    .clk(clk),
    .reset_n(~rst),

    // Port to LLC (Lowest Level Cache)
    .line_i(l2_wdata),
    .line_o(l2_rdata),
    .address_i(l2_address),
    .read_i(l2_read),
    .write_i(l2_write),
    .resp_o(l2_resp),

    // Port to memory
    .burst_i(pmem_rdata),
    .burst_o(pmem_wdata),
    .address_o(pmem_address),
    .read_o(pmem_read),
    .write_o(pmem_write),
    .resp_i(pmem_resp)
);

endmodule
