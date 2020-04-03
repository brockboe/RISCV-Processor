module cache_datapath #(
    parameter s_offset = 5,
    parameter s_index  = 3,
    parameter s_tag    = 32 - s_offset - s_index,
    parameter s_mask   = 2**s_offset,
    parameter s_line   = 8*s_mask,
    parameter num_sets = 2**s_index
)
(
    input logic clk, rst,
    input logic read,
    input logic [31:0] write_en0, write_en1,
    input logic sel, data_in_sel, index_sel,
    input logic load_lru, load_dirty, load_valid,
    input logic [1:0] load_tag,
    input logic lru_in,
    input logic [1:0] dirty_in, valid_in,
    input logic [31:0] addr,
    input logic [2:0] flush_index,
    output logic [31:0] addr_out,
    output logic [255:0] data_out,
    output logic [1:0] cmp, dirty, valid,
    output logic lru,

    input logic [255:0] mem_wdata256, line_in
);

logic [2:0] index, index_in;
logic [23:0] tag;

logic [255:0] dataout0, dataout1, data_in;
logic [23:0] tagout0, tagout1, tagmuxout;

assign index = addr[7:5];
assign tag = addr[31:8];
assign addr_out = {tagmuxout, index_in, {5{1'b0}}};

data_array data0(.clk(clk), .rst(), .read(1'b1), .write_en(write_en0), .rindex(index_in), .windex(index_in), .datain(data_in), .dataout(dataout0));
data_array data1(.clk(clk), .rst(), .read(1'b1), .write_en(write_en1), .rindex(index_in), .windex(index_in), .datain(data_in), .dataout(dataout1));

array #(.width(24)) tag0(.clk(clk), .rst(), .read(1'b1), .load(load_tag[0]), .rindex(index_in), .windex(index_in), .datain(tag), .dataout(tagout0));
array #(.width(24)) tag1(.clk(clk), .rst(), .read(1'b1), .load(load_tag[1]), .rindex(index_in), .windex(index_in), .datain(tag), .dataout(tagout1));

array d0(.clk(clk), .rst(), .read(1'b1), .load(load_dirty), .rindex(index_in), .datain(dirty_in[0]), .windex(index_in), .dataout(dirty[0]));
array d1(.clk(clk), .rst(), .read(1'b1), .load(load_dirty), .rindex(index_in), .datain(dirty_in[1]), .windex(index_in), .dataout(dirty[1]));

array v0(.clk(clk), .rst(rst), .read(1'b1), .load(load_valid), .rindex(index_in), .datain(valid_in[0]), .windex(index_in), .dataout(valid[0]));
array v1(.clk(clk), .rst(rst), .read(1'b1), .load(load_valid), .rindex(index_in), .datain(valid_in[1]), .windex(index_in), .dataout(valid[1]));

array LRU(.clk(clk), .rst(rst), .read(1'b1), .load(load_lru), .rindex(index_in), .windex(index_in), .datain(lru_in), .dataout(lru));

always_comb begin
    // MUXes
    case(sel)
        1'b0: begin
            data_out = dataout0;
            tagmuxout = tagout0;
        end
        1'b1: begin
            data_out = dataout1;
            tagmuxout = tagout1;
        end
    endcase

    case(data_in_sel)
        1'b0: data_in = mem_wdata256;
        1'b1: data_in = line_in;
    endcase

    case(index_sel)
        1'b0: index_in = index;
        1'b1: index_in = flush_index;
    endcase

    // Comparator
    cmp[0] = (tag == tagout0);
    cmp[1] = (tag == tagout1);
end

endmodule : cache_datapath
