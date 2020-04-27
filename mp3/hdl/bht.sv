
module bht #(
    parameter width = 10,
    parameter n_sets = 2 ** width
)
(
    input logic clk,
    input logic read,
    input logic load,
    input logic [width-1:0] r_idx,
    input logic [width-1:0] w_idx,
    input logic taken,
    input logic correct, //whether or not taken input var was correct
    output logic prediction
);
// 2-bit saturating counters
logic [1:0] data [n_sets-1:0] = '{default: 2'b00};
logic [1:0] _data;

always_comb begin
    prediction =  0;
    if (load && r_idx == w_idx) begin
        prediction = correct;
    end
    else if (read)
        unique case(data[r_idx])
            2'b00: prediction = 0;
            2'b01: prediction = 0;
            2'b10: prediction = 1;
            2'b11: prediction = 1;
            default: prediction = 0;
        endcase
        
end

always_comb begin
    _data =  2'b00;
    if (load) begin
        case({correct,taken})
            2'b00:
                case(data[w_idx])
                    2'b00: _data = 2'b01;
                    2'b01: _data = 2'b10;
                    2'b10: _data = 2'b11;
                    2'b11: _data = 2'b11; 
                endcase
            2'b01:
                case(data[w_idx])
                    2'b00: _data = 2'b00;
                    2'b01: _data = 2'b00;
                    2'b10: _data = 2'b01;
                    2'b11: _data = 2'b10; 
                endcase
            2'b10:
                case(data[w_idx])
                    2'b00: _data = 2'b00;
                    2'b01: _data = 2'b00;
                    2'b10: _data = 2'b01;
                    2'b11: _data = 2'b10; 
                endcase
            2'b11:
                case(data[w_idx])
                    2'b00: _data = 2'b01;
                    2'b01: _data = 2'b10;
                    2'b10: _data = 2'b11;
                    2'b11: _data = 2'b11; 
                endcase   
        endcase
    end
        
end

always_ff @(posedge clk)
begin
    if(load)
        data[w_idx] <= _data;
end

endmodule : bht