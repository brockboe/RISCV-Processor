import rv32i_types::*;

module btb #(
    parameter width = 32,
    parameter idx_width = 6,
    parameter n_sets = 2 ** idx_width,
    parameter tag_width = width - idx_width
)
(
    input clk,
    input [width-1:0] r_pc,
    input [width-1:0] w_pc,
    input load,
    input read,
    input rv32i_word target_in,
    output rv32i_word target_out,
    output btb_hit
);
logic [width-1:idx_width] w_tag, r_tag;
logic [idx_width-1:0] w_idx, r_idx;
logic [tag_width-1:0] tag_out;
logic valid_out;

assign w_tag = w_pc[width-1:idx_width];
assign r_tag = r_pc[width-1:idx_width];
assign w_idx = w_pc[idx_width-1:0];
assign r_idx = r_pc[idx_width-1:0];


btb_col #(tag_width) tags (
    .clk(clk),
    .load(load),
    .read(read),
    .r_idx(r_idx),
    .w_idx(w_idx),
    .in(w_tag),
    .out(tag_out)
);

btb_col #(32) targets (
    .clk(clk),
    .load(load),
    .read(read),
    .r_idx(r_idx),
    .w_idx(w_idx),
    .in(target_in),
    .out(target_out)
);

btb_col #(1) is_valid (
    .clk(clk),
    .load(load),
    .read(read),
    .r_idx(r_idx),
    .w_idx(w_idx),
    .in(1'b1),
    .out(valid_out)
);

assign btb_hit = tag_out == r_tag && valid_out;

endmodule : btb
