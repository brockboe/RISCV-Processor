import control_itf::*;
import cmpmux::*;
import alumux::*;
import rv32i_types::*;

// execute controller
//
// calculates the state of cmpmux_sel, cmpop

module execute_controller
(
      input control_itf::instruction_decode idecode,
      output cmpmux::cmpmux_sel_t cmpmux_sel,
      output alumux::alumux1_sel_t alumux1_sel,
      output alumux::alumux2_sel_t alumux2_sel,
      output rv32i_types::alu_ops aluop,
      output rv32i_types::branch_funct3_t cmpop
);

function void set_defaults();
      cmpmux_sel = cmpmux::rs2_out;
      alumux1_sel = alumux::rs1_out;
      alumux2_sel = alumux::rs2_out;
      aluop = rv32i_types::alu_ops ' (idecode.funct3);
      cmpop = rv32i_types::blt;
endfunction

always_comb begin

      set_defaults();

      if (idecode.opcode == op_lui) begin
            //do nothing

      end else if (idecode.opcode == op_auipc) begin
            alumux1_sel = alumux::pc_out;
            alumux2_sel = alumux::u_imm;
            aluop = alu_add;
      end else if (idecode.opcode == op_jal) begin
            alumux1_sel = alumux::pc_out;
            alumux2_sel = alumux::j_imm;
            aluop = alu_add;
      end else if (idecode.opcode == op_jalr) begin
            alumux1_sel = alumux::rs1_out;
            alumux2_sel = alumux::i_imm;
            aluop = alu_add;
      end else if (idecode.opcode == op_br) begin
            alumux1_sel = alumux::pc_out;
            alumux2_sel = alumux::b_imm;
            aluop = alu_add;
      end else if (idecode.opcode == op_load) begin
            //do nothing
            alumux1_sel = alumux::rs1_out;
            alumux2_sel = alumux::i_imm;
            aluop = alu_add;
      end else if (idecode.opcode == op_store) begin
            //do nothing
            set_defaults();
      end else if (idecode.opcode == op_imm) begin
            alumux1_sel = alumux::rs1_out;
            alumux2_sel = alumux::i_imm;
            aluop = rv32i_types::alu_ops ' (idecode.funct3);

            if((rv32i_types::alu_ops ' (idecode.funct3)) == rv32i_types::slt) begin
                  cmpop = rv32i_types::blt;
                  cmpmux_sel = cmpmux::i_imm;
            end else if ((rv32i_types::alu_ops ' (idecode.funct3)) == rv32i_types::sltu) begin
                  cmpop = rv32i_types::bltu;
                  cmpmux_sel = cmpmux::i_imm;
            end else if ((rv32i_types::alu_ops ' (idecode.funct3)) == rv32i_types::sr) begin
                  alumux1_sel = alumux::rs1_out;
                  alumux2_sel = alumux::i_imm;

                  if (idecode.funct7 == 7'b0100000)
                        aluop = rv32i_types::alu_sra;
                  else
                        aluop = rv32i_types::alu_srl;

            end else begin
                  alumux1_sel = alumux::rs1_out;
                  alumux2_sel = alumux::i_imm;
                  aluop = alu_ops ' (idecode.funct3);
            end
      end else if (idecode.opcode == op_reg) begin
            alumux1_sel = alumux::rs1_out;
            alumux2_sel = alumux::rs2_out;
            cmpmux_sel = cmpmux::rs2_out;
            aluop = rv32i_types::alu_ops ' (idecode.funct3);

            if((idecode.funct3 == rv32i_types::add) && (idecode.funct7 == 7'b0000000))
                  aluop = rv32i_types::alu_add;
            else if((idecode.funct3 == rv32i_types::add) && (idecode.funct7 == 7'b0100000))
                  aluop = rv32i_types::alu_sub;
            else if((idecode.funct3 == rv32i_types::sll))
                  aluop = rv32i_types::alu_sll;
            else if((idecode.funct3 == rv32i_types::slt))
                  cmpop = rv32i_types::blt;
            else if((idecode.funct3 == rv32i_types::sltu))
                  cmpop = rv32i_types::bltu;
            else if((idecode.funct3 == rv32i_types::axor))
                  aluop = rv32i_types::alu_xor;
            else if((idecode.funct3 == rv32i_types::sr) && (idecode.funct7 == 7'b0000000))
                  aluop = rv32i_types::alu_srl;
            else if((idecode.funct3 == rv32i_types::sr) && (idecode.funct7 == 7'b0100000))
                  aluop = rv32i_types::alu_sra;
            else
                  aluop = rv32i_types::alu_ops ' (idecode.funct3);
      end else begin    //opcode = op_csr
            //don't have to worry about csr
            set_defaults();
      end

end

endmodule
