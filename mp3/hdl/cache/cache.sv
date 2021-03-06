module cache #(
    parameter s_offset = 5,
    parameter s_index  = 3,
    parameter s_tag    = 32 - s_offset - s_index,
    parameter s_mask   = 2**s_offset,
    parameter s_line   = 8*s_mask,
    parameter num_sets = 2**s_index
)
(
    input logic clk, rst,
    // to cpu
    input logic mem_read, mem_write,
    input logic [3:0] mem_byte_enable,
    input logic [31:0] mem_wdata, mem_address,
    output logic [31:0] mem_rdata,
    output logic mem_resp,

    // to cacheline_adapter
    input logic [255:0] pmem_rdata,
    output logic [255:0] pmem_wdata,
    output logic [31:0] pmem_address,
    output logic pmem_read, pmem_write,
    input logic pmem_resp
);

// datapath <==> control
logic [1:0] cmp, dirty, valid;
logic lru;
logic sel, data_in_sel;
logic [31:0] write_en0, write_en1;
logic load_lru, load_dirty, load_valid;
logic [1:0] load_tag;
logic lru_in;
logic [1:0] dirty_in, valid_in;

// control <==> bus adapter
logic [31:0] mem_byte_enable256;
logic [255:0] mem_wdata256, data_out;

assign pmem_wdata = data_out;

cache_control control
(
    .clk,
    .rst,

    // datapath
    .cmp, .dirty, .valid,
    .lru,
    .sel, .data_in_sel,
    .write_en0, .write_en1,
    .load_lru, .load_dirty, .load_valid,
    .load_tag,
    .lru_in,
    .dirty_in, .valid_in,

    // cpu & bus_adapter
    .mem_read, .mem_write,
    .mem_byte_enable256,
    .resp(mem_resp),

    // cacheline adaptor
    .cacheline_resp(pmem_resp),
    .cacheline_write(pmem_write),
    .cacheline_read(pmem_read)
);

cache_datapath datapath
(
    .clk(clk), .rst,
    .read(mem_read),
    .write_en0,
    .write_en1,
    .sel,
    .data_in_sel,
    .load_lru,
    .load_dirty,
    .load_valid,
    .load_tag,
    .lru_in,
    .dirty_in,
    .valid_in,
    .addr(mem_address),
    .addr_out(pmem_address),
    .data_out,
    .cmp,
    .dirty,
    .valid,
    .lru,
    .mem_wdata256,
    .line_in(pmem_rdata)
);

bus_adapter bus_adapter
(
    .mem_wdata256,
    .mem_rdata256(data_out),
    .mem_wdata(mem_wdata),
    .mem_rdata(mem_rdata),
    .mem_byte_enable(mem_byte_enable),
    .mem_byte_enable256,
    .address(mem_address)
);

endmodule : cache
