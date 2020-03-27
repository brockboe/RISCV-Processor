import rv32i_types::*;
import pcmux::*;
import marmux::*;
import cmpmux::*;
import alumux::*;
import regfilemux::*;
import rs1mux::*;
import rs2mux::*;
import dcachemux::*;
import control_itf::*;

module control_rom(
    input rv32i_opcode opcode,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    output ctrl_word idex_ctrl_word
);

/**
//contains control data information
//length = 20
typedef struct packed
{
      logic alumux1_sel;
      logic [2:0] alumux2_sel;
      logic cmpmux_sel;
      logic [2:0] aluop;
      logic [2:0] cmpop;
      logic dcache_read;
      logic dcache_write;
      logic mask1;
      logic mask2;
      logic [3:0] regfilemux_sel;
      logic load_regfile;
} ctrl_word;
*/

always_comb begin
    // Default values
    idex_ctrl_word = 'x;
    idex_ctrl_word.mask1 = 1'b1;
    idex_ctrl_word.mask2 = 1'b0;

    case(opcode)
        op_lui   : begin
            idex_ctrl_word.dcache_read = 1'b0;
            idex_ctrl_word.dcache_write = 1'b0;
            idex_ctrl_word.regfilemux_sel = regfilemux::u_imm;
            idex_ctrl_word.load_regfile = 1'b1;
        end

        op_auipc : begin
            idex_ctrl_word.alumux1_sel = alumux::pc_out;
            idex_ctrl_word.alumux2_sel = alumux::u_imm;
            idex_ctrl_word.aluop = alu_add;
            idex_ctrl_word.dcache_read = 1'b0;
            idex_ctrl_word.dcache_write = 1'b0;
            idex_ctrl_word.regfilemux_sel = regfilemux::alu_out;
            idex_ctrl_word.load_regfile = 1'b1;
        end

        op_jal   : begin
            idex_ctrl_word.alumux1_sel = alumux::pc_out;
            idex_ctrl_word.alumux2_sel = alumux::j_imm;
            idex_ctrl_word.aluop = alu_add;
            idex_ctrl_word.dcache_read = 1'b0;
            idex_ctrl_word.dcache_write = 1'b0;
            idex_ctrl_word.regfilemux_sel = regfilemux::pc_plus4;
            idex_ctrl_word.load_regfile = 1'b1;
            idex_ctrl_word.mask1 = 1'b1;
            idex_ctrl_word.mask2 = 1'b1;
        end

        op_jalr  : begin
            idex_ctrl_word.alumux1_sel = alumux::rs1_out;
            idex_ctrl_word.alumux2_sel = alumux::i_imm;
            idex_ctrl_word.aluop = alu_add;
            idex_ctrl_word.dcache_read = 1'b0;
            idex_ctrl_word.dcache_write = 1'b0;
            idex_ctrl_word.regfilemux_sel = regfilemux::pc_plus4;
            idex_ctrl_word.load_regfile = 1'b1;
            idex_ctrl_word.mask1 = 1'b0;
            idex_ctrl_word.mask2 = 1'b1;
        end

        op_br    : begin
            idex_ctrl_word.alumux1_sel = alumux::pc_out;
            idex_ctrl_word.alumux2_sel = alumux::b_imm;
            idex_ctrl_word.cmpmux_sel = cmpmux::rs2_out;
            idex_ctrl_word.aluop = alu_add;
            idex_ctrl_word.cmpop = branch_funct3_t'(funct3);
            idex_ctrl_word.dcache_read = 1'b0;
            idex_ctrl_word.dcache_write = 1'b0;
            // idex_ctrl_word.regfilemux_sel = regfilemux::alu_out;
            idex_ctrl_word.load_regfile = 1'b0;
            idex_ctrl_word.mask1 = 1'b1;
            idex_ctrl_word.mask2 = 1'b1;
        end

        op_load  : begin
            idex_ctrl_word.alumux1_sel = alumux::rs1_out;
            idex_ctrl_word.alumux2_sel = alumux::i_imm;
            // idex_ctrl_word.cmpmux_sel = cmpmux::rs2_out;
            idex_ctrl_word.aluop = alu_add;
            // idex_ctrl_word.cmpop = funct3;
            idex_ctrl_word.dcache_read = 1'b1;
            idex_ctrl_word.dcache_write = 1'b0;
            idex_ctrl_word.regfilemux_sel = regfilemux::MDRreg_out;
            idex_ctrl_word.load_regfile = 1'b1;
        end

        op_store : begin
            idex_ctrl_word.alumux1_sel = alumux::rs1_out;
            idex_ctrl_word.alumux2_sel = alumux::s_imm;
            // idex_ctrl_word.cmpmux_sel = cmpmux::rs2_out;
            idex_ctrl_word.aluop = alu_add;
            // idex_ctrl_word.cmpop = funct3;
            idex_ctrl_word.dcache_read = 1'b0;
            idex_ctrl_word.dcache_write = 1'b1;
            // idex_ctrl_word.regfilemux_sel = regfilemux::MDRreg_out;
            idex_ctrl_word.load_regfile = 1'b0;
        end

        op_imm   : begin
            idex_ctrl_word.alumux1_sel = alumux::rs1_out;
            idex_ctrl_word.alumux2_sel = alumux::i_imm;
            idex_ctrl_word.cmpmux_sel = cmpmux::i_imm;
            idex_ctrl_word.dcache_read = 1'b0;
            idex_ctrl_word.dcache_write = 1'b0;
            idex_ctrl_word.regfilemux_sel = regfilemux::alu_out;
            idex_ctrl_word.load_regfile = 1'b1;

            idex_ctrl_word.aluop = alu_ops'(funct3);
            idex_ctrl_word.cmpop = branch_funct3_t'(funct3);

            case(alu_ops'(funct3))
                slt: begin
                    idex_ctrl_word.cmpop = blt;
                    idex_ctrl_word.regfilemux_sel = regfilemux::br_en;
                end
                sltu: begin
                    idex_ctrl_word.cmpop = bltu;
                    idex_ctrl_word.regfilemux_sel = regfilemux::br_en;
                end
                sr: idex_ctrl_word.aluop = (funct7 == 7'b0100000) ? alu_sra : alu_srl;
                default: idex_ctrl_word.aluop = alu_ops'(funct3);
            endcase

        end

        op_reg   : begin
            idex_ctrl_word.alumux1_sel = alumux::rs1_out;
            idex_ctrl_word.alumux2_sel = alumux::rs2_out;
            idex_ctrl_word.cmpmux_sel = cmpmux::rs2_out;
            idex_ctrl_word.dcache_read = 1'b0;
            idex_ctrl_word.dcache_write = 1'b0;
            idex_ctrl_word.regfilemux_sel = regfilemux::alu_out;
            idex_ctrl_word.load_regfile = 1'b1;
            
            idex_ctrl_word.aluop = alu_ops'(funct3);
            idex_ctrl_word.cmpop = branch_funct3_t'(funct3);

            case(alu_ops'(funct3))
                slt: begin
                    idex_ctrl_word.cmpop = blt;
                    idex_ctrl_word.regfilemux_sel = regfilemux::br_en;
                end
                sltu: begin
                    idex_ctrl_word.cmpop = bltu;
                    idex_ctrl_word.regfilemux_sel = regfilemux::br_en;
                end
                sr: idex_ctrl_word.aluop = (funct7 == 7'b0100000) ? alu_sra : alu_srl;
                default: idex_ctrl_word.aluop = alu_ops'(funct3);
            endcase
        end
        // op_csr   :
        default: ;
    endcase

end

endmodule
