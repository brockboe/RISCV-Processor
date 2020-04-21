module mul_tb;
`timescale 1ns/10ps

logic clk;
logic rst;

logic [31:0] a;
logic [31:0] b;
logic [63:0] product;
logic sign;

multiplier mult( .* );

default clocking tb_clk @(negedge clk); endclocking;

initial begin
      clk = 1'b0;
      sign = 1'b1;


      for(int i = -500; i < 500; i++) begin
            for(int j = -500; j < 500; j++) begin
                  a = (32) ' (i);
                  b = (32) ' (j);
                  ##1;
                  if ($signed(product) != $signed(i) * $signed(j))
                        $fatal("Product mismatch! %d x %d != %d", $signed(a), $signed(b), $signed(product));
            end
      end


      $finish;
end

always begin
      #5;
      clk = ~clk;
end

endmodule
