`include "./mult_precomputed.sv"

module multiplier_unsigned (
      input logic [31:0] a,
      input logic [31:0] b,
      output logic [63:0] product
);

logic [7:0][3:0] A ;
assign A = {a[31:28], a[27:24], a[23:20], a[19:16], a[15:12], a[11:8], a[7:4], a[3:0]};
logic [7:0][3:0] B;
assign B = {b[31:28], b[27:24], b[23:20], b[19:16], b[15:12], b[11:8], b[7:4], b[3:0]};

// pseudo-reduction layers
logic [14:0][63:0] rl;

always_comb begin

      rl[0]  = mult(A[0], B[0]);
      rl[1]  = mult(A[0], B[1]) + mult(A[1], B[0]);
      rl[2]  = mult(A[0], B[2]) + mult(A[1], B[1]) + mult(A[2], B[0]);
      rl[3]  = mult(A[0], B[3]) + mult(A[1], B[2]) + mult(A[2], B[1]) + mult(A[3], B[0]);
      rl[4]  = mult(A[0], B[4]) + mult(A[1], B[3]) + mult(A[2], B[2]) + mult(A[3], B[1]) + mult(A[4], B[0]);
      rl[5]  = mult(A[0], B[5]) + mult(A[1], B[4]) + mult(A[2], B[3]) + mult(A[3], B[2]) + mult(A[4], B[1]) + mult(A[5], B[0]);
      rl[6]  = mult(A[0], B[6]) + mult(A[1], B[5]) + mult(A[2], B[4]) + mult(A[3], B[3]) + mult(A[4], B[2]) + mult(A[5], B[1]) + mult(A[6], B[0]);
      rl[7]  = mult(A[0], B[7]) + mult(A[1], B[6]) + mult(A[2], B[5]) + mult(A[3], B[4]) + mult(A[4], B[3]) + mult(A[5], B[2]) + mult(A[6], B[1]) + mult(A[7], B[0]);
      rl[8]  = mult(A[1], B[7]) + mult(A[2], B[6]) + mult(A[3], B[5]) + mult(A[4], B[4]) + mult(A[5], B[3]) + mult(A[6], B[2]) + mult(A[7], B[1]);
      rl[9]  = mult(A[2], B[7]) + mult(A[3], B[6]) + mult(A[4], B[5]) + mult(A[5], B[4]) + mult(A[6], B[3]) + mult(A[7], B[2]);
      rl[10] = mult(A[3], B[7]) + mult(A[4], B[6]) + mult(A[5], B[5]) + mult(A[6], B[4]) + mult(A[7], B[3]);
      rl[11] = mult(A[4], B[7]) + mult(A[5], B[6]) + mult(A[6], B[5]) + mult(A[7], B[4]);
      rl[12] = mult(A[5], B[7]) + mult(A[6], B[6]) + mult(A[7], B[5]);
      rl[13] = mult(A[6], B[7]) + mult(A[7], B[6]);
      rl[14] = mult(A[7], B[7]);

end

assign product = (rl[0] << 0) + (rl[1] << 4) + (rl[2] << 8) + (rl[3] << 12) + (rl[4] << 16) + (rl[5] << 20) + (rl[6] << 24) + (rl[7] << 28) + (rl[8] << 32) + (rl[9] << 36) + (rl[10] << 40) + (rl[11] << 44) + (rl[12] << 48) + (rl[13] << 52) + (rl[14] << 56);

endmodule

module multiplier (
      input logic [31:0] a,
      input logic [31:0] b,
      input logic sign,
      output logic [63:0] product
);

logic neg_r;
assign neg_r = a[31] ^ b[31];

logic [31:0] A;
logic [31:0] B;
logic [63:0] P;

always_comb begin
      if(~sign) begin
            A = a;
            B = b;
            product = P;
      end else begin
            A = a[31] ? (~a) + 32'd1 : a;
            B = b[31] ? (~b) + 32'd1 : b;
            product = neg_r ? (~P) + 64'd1 : P;
      end
end

multiplier_unsigned multiu
(
      .a(A),
      .b(B),
      .product(P)
);

endmodule
