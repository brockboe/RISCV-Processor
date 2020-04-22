`include "./mult_precomputed.sv"
import rv32i_types::*;

module multiplier_unsigned (
      input logic clk,
      input logic rst,
      input logic [31:0] a,
      input logic [31:0] b,
      input logic start,
      output logic [63:0] product,
      output logic done
);


logic [7:0][3:0] A ;
logic [7:0][3:0] B;

// pseudo-reduction layers
logic [14:0][63:0] rl1;
logic [14:0][63:0] rl2;

logic [31:0] counter;

always_ff @ (posedge clk) begin

      if(rst) counter <= 32'd0;
      else if(start & (counter > 32'd4)) counter <= 32'd0;
      else if(start) counter <= counter + 32'd1;
      else counter <= 32'd0;

      A <= {a[31:28], a[27:24], a[23:20], a[19:16], a[15:12], a[11:8], a[7:4], a[3:0]};
      B <= {b[31:28], b[27:24], b[23:20], b[19:16], b[15:12], b[11:8], b[7:4], b[3:0]};

      rl1[0]  <= mult(A[0], B[0]);
      rl1[1]  <= mult(A[0], B[1]) + mult(A[1], B[0]);
      rl1[2]  <= mult(A[0], B[2]) + mult(A[1], B[1]) + mult(A[2], B[0]);
      rl1[3]  <= mult(A[0], B[3]) + mult(A[1], B[2]) + mult(A[2], B[1]) + mult(A[3], B[0]);
      rl1[4]  <= mult(A[0], B[4]) + mult(A[1], B[3]) + mult(A[2], B[2]) + mult(A[3], B[1]);
      rl1[5]  <= mult(A[0], B[5]) + mult(A[1], B[4]) + mult(A[2], B[3]) + mult(A[3], B[2]);
      rl1[6]  <= mult(A[0], B[6]) + mult(A[1], B[5]) + mult(A[2], B[4]) + mult(A[3], B[3]);
      rl1[7]  <= mult(A[0], B[7]) + mult(A[1], B[6]) + mult(A[2], B[5]) + mult(A[3], B[4]);
      rl1[8]  <= mult(A[1], B[7]) + mult(A[2], B[6]) + mult(A[3], B[5]) + mult(A[4], B[4]);
      rl1[9]  <= mult(A[2], B[7]) + mult(A[3], B[6]) + mult(A[4], B[5]) + mult(A[5], B[4]);
      rl1[10] <= mult(A[3], B[7]) + mult(A[4], B[6]) + mult(A[5], B[5]) + mult(A[6], B[4]);
      rl1[11] <= mult(A[4], B[7]) + mult(A[5], B[6]) + mult(A[6], B[5]) + mult(A[7], B[4]);
      rl1[12] <= mult(A[5], B[7]) + mult(A[6], B[6]) + mult(A[7], B[5]);
      rl1[13] <= mult(A[6], B[7]) + mult(A[7], B[6]);
      rl1[14] <= mult(A[7], B[7]);

      rl2[0] <= rl1[0];
      rl2[1] <= rl1[1];
      rl2[2] <= rl1[2];
      rl2[3] <= rl1[3];
      rl2[4] <= rl1[4] + mult(A[4], B[0]);
      rl2[5] <= rl1[5] + mult(A[4], B[1]) + mult(A[5], B[0]);
      rl2[6] <= rl1[6] + mult(A[4], B[2]) + mult(A[5], B[1]) + mult(A[6], B[0]);
      rl2[7] <= rl1[7] + mult(A[4], B[3]) + mult(A[5], B[2]) + mult(A[6], B[1]) + mult(A[7], B[0]);
      rl2[8] <= rl1[8] + mult(A[5], B[3]) + mult(A[6], B[2]) + mult(A[7], B[1]);
      rl2[9] <= rl1[9] + mult(A[6], B[3]) + mult(A[7], B[2]);
      rl2[10] <= rl1[10] + mult(A[7], B[3]);
      rl2[11] <= rl1[11];
      rl2[12] <= rl1[12];
      rl2[13] <= rl1[13];
      rl2[14] <= rl1[14];

      product <= (rl2[0] << 0) + (rl2[1] << 4) + (rl2[2] << 8) + (rl2[3] << 12) + (rl2[4] << 16) + (rl2[5] << 20) + (rl2[6] << 24) + (rl2[7] << 28) + (rl2[8] << 32) + (rl2[9] << 36) + (rl2[10] << 40) + (rl2[11] << 44) + (rl2[12] << 48) + (rl2[13] << 52) + (rl2[14] << 56);
      done <= (counter == 32'd4);
end
endmodule

module multiplier (
      input logic clk,
      input logic rst,
      input logic [31:0] a,
      input logic [31:0] b,
      input logic start,
      input muldiv_funct3_t sign,
      output logic [63:0] product,
      output logic done
);

logic neg_result;

logic [31:0] A;
logic [31:0] B;
logic [63:0] P;

always_comb begin
      unique case(sign)
      mul: begin
            neg_result = a[31] ^ b[31];
            A = a[31] ? (~a) + 1 : a;
            B = b[31] ? (~b) + 1 : b;
            product = neg_result ? (~P) + 1 : P;
      end

      mulh: begin
            neg_result = a[31] ^ b[31];
            A = a[31] ? (~a) + 1 : a;
            B = b[31] ? (~b) + 1 : b;
            product = neg_result ? (~P) + 1 : P;
      end

      mulhsu: begin
            neg_result = a[31];
            A = a[31] ? (~a) + 1 : a;
            B = b;
            product = neg_result ? (~P) + 1 : P;
      end

      mulhu: begin
            neg_result = 1'b0;
            A = a;
            B = b;
            product = P;
      end

      default: begin
            neg_result = a[31] ^ b[31];
            A = a[31] ? (~a) + 1 : a;
            B = b[31] ? (~b) + 1 : b;
            product = neg_result ? (~P) + 1 : P;
      end

      endcase
end

multiplier_unsigned multiu
(
      .clk(clk),
      .rst(rst),
      .a(A),
      .b(B),
      .start(start),
      .product(P),
      .done(done)
);

endmodule
