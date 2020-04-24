module btb_col #(
    parameter width = 32,
    parameter idx_width = 6,
    parameter n_entry = 2 ** idx_width
)
(
    input clk,
    input load,
    input read,
    input [idx_width-1:0] r_idx,
    input [idx_width-1:0] w_idx,
    input [width-1:0] in,
    output [width-1:0] out
);
logic [width-1:0] data [n_entry-1:0] = '{default:'0};

assign out = (read)?(load && r_idx == w_idx)?in:data[r_idx]:{width{1'bx}};

always_ff @(posedge clk)
begin
    if (load)
        data[w_idx] <= in;
end

endmodule : btb_col