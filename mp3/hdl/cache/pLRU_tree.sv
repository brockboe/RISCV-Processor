module pLRU_tree #(parameter s_index = 3)
/**
Example: (8-way pLRU tree)

Level0 (root)           L0
Level1              L1      L2
Level2 (leaf)     L3  L4  L5  L6

access way 5 (3'b101)
L0 will always be updated (new value in this case is 1)
load_left = 0 (L1 is not updated)
load_right = 1 (L2 is updated to 0)

Because L1 is not updated, L3 and L4 will also mantain their original value
Because L2 is updated, one of L5 and L6 will be updated (in this case L5 will update to 1)
*/
(
    input logic clk, rst,
    input logic load,
    input logic [s_index-1:0]index,
    input logic [2:0] last_access,
    output logic [2:0] plru
);
/*******************************/
/* Update Block                */
/*******************************/
logic l1, l2, l3, l4, l5, l6; // load signals
logic [6:0] l;
logic [1:0] lv1;
logic [3:0] lv2;
logic bit0, bit1, bit2;

assign bit0 = ~l[0];
assign lv1 = ~l[2:1];
assign lv2 = ~l[6:3];

assign bit1 = lv1[bit0];
assign bit2 = lv2[{bit0, bit1}];
assign plru = {bit0, bit1, bit2};

// Level 0 (root)
tree_node #(.s_index(s_index)) L0(.clk, .rst, .load(load), .data_in(last_access[2]), .index, .data_out(l[0]), .load_left(l1), .load_right(l2));

// level 1
tree_node #(.s_index(s_index)) L1(.clk, .rst, .load(l1), .data_in(last_access[1]), .index, .data_out(l[1]), .load_left(l3), .load_right(l4));
tree_node #(.s_index(s_index)) L2(.clk, .rst, .load(l2), .data_in(last_access[1]), .index, .data_out(l[2]), .load_left(l5), .load_right(l6));

// level 2 (leaf)
tree_node #(.s_index(s_index)) L3(.clk, .rst, .load(l3), .data_in(last_access[0]), .index, .data_out(l[3]), .load_left(), .load_right());
tree_node #(.s_index(s_index)) L4(.clk, .rst, .load(l4), .data_in(last_access[0]), .index, .data_out(l[4]), .load_left(), .load_right());
tree_node #(.s_index(s_index)) L5(.clk, .rst, .load(l5), .data_in(last_access[0]), .index, .data_out(l[5]), .load_left(), .load_right());
tree_node #(.s_index(s_index)) L6(.clk, .rst, .load(l6), .data_in(last_access[0]), .index, .data_out(l[6]), .load_left(), .load_right());

endmodule

module tree_node #(parameter s_index = 3) 
(
    input logic clk, rst,
    input logic load,
    input logic data_in,
    input logic [s_index-1:0] index,
    output logic data_out,
    output logic load_left, load_right
);

localparam num_sets = 2**s_index;
logic [num_sets-1:0] data;

always_ff @( posedge clk ) begin
    if (rst) data <= '0;
    else if (load) data[index] <= data_in;
end

assign load_left = load & (~data_in);
assign load_right = load & data_in;
assign data_out = data[index];

endmodule
