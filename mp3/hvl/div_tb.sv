module div_tb;
`timescale 1ns/10ps


logic clk;
logic rst;

logic start;
logic [31:0] numerator;
logic [31:0] denominator;
logic [31:0] quotient;
logic [31:0] remainder;
logic sign;
logic done;

default clocking tb_clk @(negedge clk); endclocking;

divider d (.*);

initial begin
      rst = 1'b1;
      clk = 1'b1;
      sign = 1'b0;
      ##5;
      rst = 1'b0;

      for(int i = 0; i < 100; i++) begin
            for(int j = 0; j < 100; j++) begin
                  test(i, j);
                  @(done);
                  if (quotient != i / j)
                        $error("Quotient Error! %d / $d != %d", i, j, quotient);
                  if (remainder != i % j)
                        $error("Remainder Error! %d R %d != %d", i, j, remainder);
            end
      end

      for(int i = -50; i < 50; i++) begin
            if (i == 0) continue;
            for(int j = -50; j < 50; j++) begin
            if (j == 0) continue;
                  test_signed(i, j);
                  @(done);
                  if ($signed(quotient) != $signed(i) / $signed(j))
                        $error("Quotient Error! %d / %d != %d", i, j, $signed(quotient));
                  if ($signed(remainder) != $signed(i) % $signed(j))
                        $error("Remainder Error! %d R %d != %d", i, j, $signed(remainder));
            end
      end

      $finish;
end

always begin
      #5;
      clk = ~clk;
end

task test(logic [31:0] n, logic [31:0] d);
      numerator = n;
      denominator = d;
      start = 1'b1;
      ##10;
      start = 1'b0;
endtask

task test_signed(logic [31:0] n, logic [31:0] d);
      numerator = n;
      denominator = d;
      start = 1'b1;
      sign = 1'b1;
      ##10;
      start = 1'b0;
endtask

endmodule
