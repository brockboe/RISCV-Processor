module pLRU_tb ();
`timescale 1ns/10ps

logic clk, rst;
logic load;
logic [2:0] index;
logic [2:0] last_access;
logic [2:0] plru;

logic [6:0] l;

logic [31:0] rand_val;
// clk gen
always #5 clk = clk === 1'b0;
assign index = '0;
assign l = dut.l;

initial begin
    rst = 1'b1;
    repeat (5) @(posedge clk);
    rst = 0;
end

always_ff @(posedge clk) rand_val <= $urandom;

always_ff @(negedge clk) begin
    last_access <= rand_val[2:0];
    load <= rand_val[3];
    $display("L6:L0 are %7b, lru is %d, accessing %d", l, plru, last_access);
end

pLRU_tree dut(.*);

endmodule
