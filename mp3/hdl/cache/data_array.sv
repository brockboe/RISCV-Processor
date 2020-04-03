
module data_array #(
    parameter s_offset = 5,
    parameter s_index = 3
)
(
    clk,
    rst,
    write_en,
    rindex,
    windex,
    datain,
    dataout
);

localparam s_mask   = 2**s_offset;
localparam s_line   = 8*s_mask;
localparam num_sets = 2**s_index;

input clk;
input rst;
input [s_mask-1:0] write_en;
input [s_index-1:0] rindex;
input [s_index-1:0] windex;
input [s_line-1:0] datain;
output logic [s_line-1:0] dataout;

logic [s_line-1:0] data [num_sets-1:0] /* synthesis ramstyle = "logic" */;
logic [s_line-1:0] _dataout;
assign dataout = _dataout;

always_ff @(posedge clk)
begin
    if (rst) begin
        for (int i = 0; i < num_sets; ++i)
            data[i] <= '0;
    end
    else begin
        for (int i = 0; i < s_mask; i++)
        begin
            data[windex][8*i +: 8] <= write_en[i] ? datain[8*i +: 8] :
                                                    data[windex][8*i +: 8];
        end
    end
end

always_comb begin
    for (int i = 0; i < s_mask; i++)
        _dataout[8*i +: 8] = (write_en[i] & (rindex == windex)) ?
                                      datain[8*i +: 8] : data[rindex][8*i +: 8];
end

endmodule : data_array

