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

// Signals between icache and arbiter
logic [255:0] i_a_rdata;
logic [31:0] i_a_address;
logic i_a_read;
logic i_a_resp;

// Signals between dcache and arbiter
logic [255:0] d_a_rdata;
logic [255:0] d_a_wdata;
logic [31:0] d_a_address;
logic d_a_read, d_a_write;
logic d_a_resp;


cache #(.s_index(3)) icache(
    .clk(clk), .rst(rst),
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

cache #(.s_index(3)) dcache(
    .clk(clk), .rst(rst),
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

// Signals between l2cache and arbiter
logic l2_read, l2_write, l2_resp;
logic [31:0] l2_address;
logic [255:0] l2_wdata, l2_rdata;
// latched signals
logic l2_read2, l2_write2, l2_resp2;
logic [31:0] l2_address2;
logic [255:0] l2_wdata2, l2_rdata2;

always_ff @( posedge clk ) begin
    // arbiter to l2
    l2_read2 <= l2_read;
    l2_write2 <= l2_write;
    l2_address2 <= l2_address;
    l2_wdata2 <= l2_wdata;

    // l2 to arbiter
    l2_rdata2 <= l2_rdata;
    l2_resp2 <= l2_resp;
end

cache_arbiter arbiter(
    .clk(clk),
    .rst(rst),

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
    .l2_read(l2_read), 
    .l2_write(l2_write),
    .l2_wdata(l2_wdata), 
    .l2_address(l2_address),
    .l2_rdata(l2_rdata2),
    .l2_resp(l2_resp2)
);

// signals between l2 cache and adapter
logic [255:0] l2_pmem_rdata, l2_pmem_wdata;
logic [31:0] l2_pmem_address;
logic l2_pmem_read, l2_pmem_write, l2_pmem_resp;

// EWB logic
logic [255:0] ewb_rdata_o, ewb_wdata_i;
logic [31:0] ewb_addr_i;
logic ewb_read_i, ewb_write_i, ewb_resp_o;

// L2 cache (cp3)
l2_cache #(.s_index(4)) l2(    
    .clk(clk), .rst(rst),
    // L1 - L2
    .l2_read(l2_read2), 
    .l2_write(l2_write2),
    .l2_wdata(l2_wdata2), 
    .l2_address(l2_address2),
    .l2_rdata(l2_rdata),
    .l2_resp(l2_resp),

    // L2 - EWB
    .pmem_rdata(ewb_rdata_o),
    .pmem_wdata(ewb_wdata_i),
    .pmem_address(ewb_addr_i),
    .pmem_read(ewb_read_i), .pmem_write(ewb_write_i),
    .pmem_resp(ewb_resp_o)
);

ewb buffer (
    .clk(clk), .rst(rst),
    // L2 - EWB
    .read_i(ewb_read_i), .write_i(ewb_write_i),
    .wdata_i(ewb_wdata_i), 
    .addr_i(ewb_addr_i),
    .rdata_o(ewb_rdata_o),
    .resp_o(ewb_resp_o),

    // L2 - pmem
    .rdata_i(l2_pmem_rdata),
    .wdata_o(l2_pmem_wdata),
    .addr_o(l2_pmem_address),
    .read_o(l2_pmem_read), .write_o(l2_pmem_write),
    .resp_i(l2_pmem_resp)
);

cacheline_adaptor adapter(
    .clk(clk),
    .reset_n(~rst),

    // Port to LLC (Lowest Level Cache)
    .line_i(l2_pmem_wdata),
    .line_o(l2_pmem_rdata),
    .address_i(l2_pmem_address),
    .read_i(l2_pmem_read),
    .write_i(l2_pmem_write),
    .resp_o(l2_pmem_resp),

    // Port to memory
    .burst_i(pmem_rdata),
    .burst_o(pmem_wdata),
    .address_o(pmem_address),
    .read_o(pmem_read),
    .write_o(pmem_write),
    .resp_i(pmem_resp)
);

endmodule
