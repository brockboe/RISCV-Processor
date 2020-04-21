// shift_sub-subtract divider

module divider_unsigned
(
      input logic clk,
      input logic rst,
      // signals are self-explainatory
      input logic start,
      input logic [31:0] numerator,
      input logic [31:0] denominator,
      output logic [31:0] quotient,
      output logic [31:0] remainder,
      output logic done
);

enum int unsigned {
      // list of states
      idle              = 0,
      shift_sub         = 1,
      d                 = 2
} state, next_state;

logic [31:0] counter, next_counter;
logic [31:0] Q;
logic [31:0] R;

// next state condition
always_ff @(posedge clk) begin
      if(rst) begin
            state <= idle;
            quotient <= 0;
            remainder <= 0;
      end
      else state <= next_state;
      counter <= next_counter;
      quotient <= Q;
      remainder <= R;
end

// next state logic
always_comb begin
      unique case (state)
            idle: begin
                  if(start) next_state <= shift_sub;
                  else next_state <= idle;
            end

            shift_sub: begin
                  if(counter == -32'd1) next_state <= d;
                  else next_state <= shift_sub;
            end

            d : begin
                  next_state <= idle;
            end

      endcase
end

// state output logic
always_comb begin
      unique case (state)
            idle: begin
                  Q <= 32'b0;
                  R <= 32'b0;
                  next_counter <= 32'd31;
                  done <= 1'b0;
            end

            shift_sub: begin
                  if (denominator <= remainder) begin
                        Q[31:0] = {quotient[30:0], 1'b1};
                        if (counter < 32'd32)
                              R[31:0] = {remainder - denominator, numerator[counter]};
                        else
                              R[31:0] = remainder - denominator;
                  end else begin
                        Q = {quotient[30:0], 1'b0};
                        if (counter < 32'd32)
                              R[31:0] = {remainder[30:0], numerator[counter]};
                        else
                              R[31:0] = remainder[31:0];
                  end

                  next_counter <= counter - 32'd1;
                  done <= 1'b0;
            end

            d: begin
                  done <= 1'b1;
            end
      endcase
end

endmodule







module divider (
      input logic clk,
      input logic rst,
      // signals are self-explainatory
      input logic sign,
      input logic start,
      input logic [31:0] numerator,
      input logic [31:0] denominator,
      output logic [31:0] quotient,
      output logic [31:0] remainder,
      output logic done
);

logic [31:0] N, D, Q, R;

divider_unsigned d
(
      .clk(clk),
      .rst(rst),
      .start(start),
      .numerator(N),
      .denominator(D),
      .quotient(Q),
      .remainder(R),
      .done(done)
);

logic net_q;
assign neg_q = numerator[31] ^ denominator[31];
assign neg_r = numerator[31];

always_comb begin
      if(~sign) begin
            N = numerator;
            D = denominator;
            quotient = Q;
            remainder = R;
      end else begin
            N = numerator[31] ? (~numerator) + 32'd1 : numerator;
            D = denominator[31] ? (~denominator) + 32'd1 : denominator;
            quotient = neg_q ? (~Q) + 32'd1 : Q;
            remainder = neg_r ? (~R) + 32'd1 : R;
      end

end

endmodule
