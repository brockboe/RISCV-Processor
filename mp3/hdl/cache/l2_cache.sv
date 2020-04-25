module l2_cache #(parameter s_index = 3) (    
    input logic clk, rst,
    // L1 - L2
    input logic l2_read, l2_write,
    input logic [255:0] l2_wdata, 
    input logic [31:0] l2_address,
    output logic [255:0] l2_rdata,
    output logic l2_resp,

    // L2 - pmem
    input logic [255:0] pmem_rdata,
    output logic [255:0] pmem_wdata,
    output logic [31:0] pmem_address,
    output logic pmem_read, pmem_write,
    input logic pmem_resp
);


// datapath <==> control
logic [7:0] cmp, dirty, valid;
logic [2:0] lru;
logic [2:0] sel;
logic data_in_sel;
logic [7:0] write_en;
logic load_lru, load_dirty, load_valid;
logic [7:0] load_tag;
logic [2:0] mru;
logic [7:0] dirty_in, valid_in;

// control <==> bus adapter
logic [255:0] data_out;

assign pmem_wdata = data_out;
assign l2_rdata = data_out;

l2_control control
(
    .clk,
    .rst,

    // datapath
    .cmp, .dirty, .valid,
    .lru,
    .sel, .data_in_sel,
    .write_en,
    .load_lru, .load_dirty, .load_valid,
    .load_tag,
    .mru,
    .dirty_in, .valid_in,

    // cpu & bus_adapter
    .mem_read(l2_read), .mem_write(l2_write),
    .resp(l2_resp),

    // cacheline adaptor
    .cacheline_resp(pmem_resp),
    .cacheline_write(pmem_write),
    .cacheline_read(pmem_read)
);

l2_datapath #(.s_index(s_index)) datapath
(
    .clk(clk), .rst,
    .read(l2_read),
    .write_en,
    .sel,
    .data_in_sel,
    .load_lru,
    .load_dirty,
    .load_valid,
    .load_tag,
    .mru,
    .dirty_in,
    .valid_in,
    .addr(l2_address),
    .addr_out(pmem_address),
    .data_out,
    .cmp,
    .dirty,
    .valid,
    .lru,
    .mem_wdata256(l2_wdata),
    .line_in(pmem_rdata)
);

endmodule
