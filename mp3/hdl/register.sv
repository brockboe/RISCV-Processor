import control_itf::*;

module register #(parameter width = 32)
(
    input clk,
    input rst,
    input load,
    input [width-1:0] in,
    output logic [width-1:0] out
);

logic [width-1:0] data = 1'b0;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        data <= '0;
    end
    else if (load)
    begin
        data <= in;
    end
    else
    begin
        data <= data;
    end
end

always_comb
begin
    out = data;
end

endmodule : register

module ctrl_word_register
(
    input clk,
    input rst,
    input load,
    input ctrl_word in,
    output ctrl_word out
);

ctrl_word data = 1'b0;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        data <= ctrl_word'(0);
    end
    else if (load)
    begin
        data <= in;
    end
    else
    begin
        data <= data;
    end
end

always_comb
begin
    out = data;
end

endmodule
