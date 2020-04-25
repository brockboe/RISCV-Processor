module l2_datapath #(
    parameter s_offset = 5,
    parameter s_index  = 3
)
(
    input logic clk, rst,
    input logic read,
    input logic [7:0] write_en,
    input logic [2:0] sel, 
    input logic data_in_sel,
    input logic load_lru, load_dirty, load_valid,
    input logic [7:0] load_tag,
    input logic [2:0] mru,
    input logic [7:0] dirty_in, valid_in,
    input logic [31:0] addr,
    output logic [31:0] addr_out,
    output logic [255:0] data_out,
    output logic [7:0] cmp, dirty, valid,
    output logic [2:0] lru,

    input logic [255:0] mem_wdata256, line_in
);

localparam s_tag    = 32 - s_offset - s_index;
localparam s_mask   = 2**s_offset;
localparam s_line   = 8*s_mask;
localparam num_sets = 2**s_index;

logic [s_index-1:0] index, index_in;
logic [s_tag-1:0] tag;

logic [s_line-1:0] data_in;
logic [s_line-1:0] dataout [8];
logic [s_tag-1:0] tagmuxout;
logic [s_tag-1:0] tagout [8];

assign index = addr[s_index+s_offset-1:s_offset];
assign tag = addr[31:s_index+s_offset];
assign addr_out = {tagmuxout, index_in, {s_offset{1'b0}}};

// Using array for data to simplify logic.

array #(.s_index(s_index), .width(s_line)) data0(.clk(clk), .rst(), .load(write_en[0]), .rindex(index_in), .windex(index_in), .datain(data_in), .dataout(dataout[0]));
array #(.s_index(s_index), .width(s_line)) data1(.clk(clk), .rst(), .load(write_en[1]), .rindex(index_in), .windex(index_in), .datain(data_in), .dataout(dataout[1]));
array #(.s_index(s_index), .width(s_line)) data2(.clk(clk), .rst(), .load(write_en[2]), .rindex(index_in), .windex(index_in), .datain(data_in), .dataout(dataout[2]));
array #(.s_index(s_index), .width(s_line)) data3(.clk(clk), .rst(), .load(write_en[3]), .rindex(index_in), .windex(index_in), .datain(data_in), .dataout(dataout[3]));
array #(.s_index(s_index), .width(s_line)) data4(.clk(clk), .rst(), .load(write_en[4]), .rindex(index_in), .windex(index_in), .datain(data_in), .dataout(dataout[4]));
array #(.s_index(s_index), .width(s_line)) data5(.clk(clk), .rst(), .load(write_en[5]), .rindex(index_in), .windex(index_in), .datain(data_in), .dataout(dataout[5]));
array #(.s_index(s_index), .width(s_line)) data6(.clk(clk), .rst(), .load(write_en[6]), .rindex(index_in), .windex(index_in), .datain(data_in), .dataout(dataout[6]));
array #(.s_index(s_index), .width(s_line)) data7(.clk(clk), .rst(), .load(write_en[7]), .rindex(index_in), .windex(index_in), .datain(data_in), .dataout(dataout[7]));

array #(.s_index(s_index), .width(s_tag)) tag0(.clk(clk), .rst(), .load(load_tag[0]), .rindex(index_in), .windex(index_in), .datain(tag), .dataout(tagout[0]));
array #(.s_index(s_index), .width(s_tag)) tag1(.clk(clk), .rst(), .load(load_tag[1]), .rindex(index_in), .windex(index_in), .datain(tag), .dataout(tagout[1]));
array #(.s_index(s_index), .width(s_tag)) tag2(.clk(clk), .rst(), .load(load_tag[2]), .rindex(index_in), .windex(index_in), .datain(tag), .dataout(tagout[2]));
array #(.s_index(s_index), .width(s_tag)) tag3(.clk(clk), .rst(), .load(load_tag[3]), .rindex(index_in), .windex(index_in), .datain(tag), .dataout(tagout[3]));
array #(.s_index(s_index), .width(s_tag)) tag4(.clk(clk), .rst(), .load(load_tag[4]), .rindex(index_in), .windex(index_in), .datain(tag), .dataout(tagout[4]));
array #(.s_index(s_index), .width(s_tag)) tag5(.clk(clk), .rst(), .load(load_tag[5]), .rindex(index_in), .windex(index_in), .datain(tag), .dataout(tagout[5]));
array #(.s_index(s_index), .width(s_tag)) tag6(.clk(clk), .rst(), .load(load_tag[6]), .rindex(index_in), .windex(index_in), .datain(tag), .dataout(tagout[6]));
array #(.s_index(s_index), .width(s_tag)) tag7(.clk(clk), .rst(), .load(load_tag[7]), .rindex(index_in), .windex(index_in), .datain(tag), .dataout(tagout[7]));

array #(.s_index(s_index)) d0(.clk(clk), .rst(), .load(load_dirty), .rindex(index_in), .datain(dirty_in[0]), .windex(index_in), .dataout(dirty[0]));
array #(.s_index(s_index)) d1(.clk(clk), .rst(), .load(load_dirty), .rindex(index_in), .datain(dirty_in[1]), .windex(index_in), .dataout(dirty[1]));
array #(.s_index(s_index)) d2(.clk(clk), .rst(), .load(load_dirty), .rindex(index_in), .datain(dirty_in[2]), .windex(index_in), .dataout(dirty[2]));
array #(.s_index(s_index)) d3(.clk(clk), .rst(), .load(load_dirty), .rindex(index_in), .datain(dirty_in[3]), .windex(index_in), .dataout(dirty[3]));
array #(.s_index(s_index)) d4(.clk(clk), .rst(), .load(load_dirty), .rindex(index_in), .datain(dirty_in[4]), .windex(index_in), .dataout(dirty[4]));
array #(.s_index(s_index)) d5(.clk(clk), .rst(), .load(load_dirty), .rindex(index_in), .datain(dirty_in[5]), .windex(index_in), .dataout(dirty[5]));
array #(.s_index(s_index)) d6(.clk(clk), .rst(), .load(load_dirty), .rindex(index_in), .datain(dirty_in[6]), .windex(index_in), .dataout(dirty[6]));
array #(.s_index(s_index)) d7(.clk(clk), .rst(), .load(load_dirty), .rindex(index_in), .datain(dirty_in[7]), .windex(index_in), .dataout(dirty[7]));

array #(.s_index(s_index)) v0(.clk(clk), .rst(rst), .load(load_valid), .rindex(index_in), .datain(valid_in[0]), .windex(index_in), .dataout(valid[0]));
array #(.s_index(s_index)) v1(.clk(clk), .rst(rst), .load(load_valid), .rindex(index_in), .datain(valid_in[1]), .windex(index_in), .dataout(valid[1]));
array #(.s_index(s_index)) v2(.clk(clk), .rst(rst), .load(load_valid), .rindex(index_in), .datain(valid_in[2]), .windex(index_in), .dataout(valid[2]));
array #(.s_index(s_index)) v3(.clk(clk), .rst(rst), .load(load_valid), .rindex(index_in), .datain(valid_in[3]), .windex(index_in), .dataout(valid[3]));
array #(.s_index(s_index)) v4(.clk(clk), .rst(rst), .load(load_valid), .rindex(index_in), .datain(valid_in[4]), .windex(index_in), .dataout(valid[4]));
array #(.s_index(s_index)) v5(.clk(clk), .rst(rst), .load(load_valid), .rindex(index_in), .datain(valid_in[5]), .windex(index_in), .dataout(valid[5]));
array #(.s_index(s_index)) v6(.clk(clk), .rst(rst), .load(load_valid), .rindex(index_in), .datain(valid_in[6]), .windex(index_in), .dataout(valid[6]));
array #(.s_index(s_index)) v7(.clk(clk), .rst(rst), .load(load_valid), .rindex(index_in), .datain(valid_in[7]), .windex(index_in), .dataout(valid[7]));

pLRU_tree #(.s_index(s_index)) pLRU(.clk(clk), .rst(rst), .load(load_lru), .index(index_in), .last_access(mru), .plru(lru));
always_comb begin
    // MUXes
    data_out = dataout[sel];
    tagmuxout = tagout[sel];

    case(data_in_sel)
        1'b0: data_in = mem_wdata256;
        1'b1: data_in = line_in;
    endcase

    index_in = index;

    // Comparator
    for (int i = 0; i < 8; i++) begin
        cmp[i] = (tag == tagout[i]);
    end
end

endmodule
