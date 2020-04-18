`ifndef FORWARDING_FUNCT
`define FORWARDING_FUNCT

// forwarding.sv
//
// contains functions to encapsulate
// forwarding functionality. Determines what the
// forwarding muxes should output and when to
// pause the datapath to prevent hazards.
//
// see MP3 design doc for more information

import rv32i_types::*;
import control_itf::*;
import rs1mux::*;
import rs2mux::*;

// rs1 hazards
function rs1mux::rs1mux_sel_t rs1_forward (forwarding_itf::instruction_input itf);

      logic rd_exmem_match;
      logic rd_memwb_match;
      rv32i_types::rv32i_opcode op_exmem;
      rv32i_types::rv32i_opcode op_memwb;

      logic slti;
      logic sltui;
      logic slt;
      logic sltu;

      rd_exmem_match = (itf.exmem_inst_decode.rd == itf.idex_inst_decode.rs1);
      rd_memwb_match = (itf.memwb_inst_decode.rd == itf.idex_inst_decode.rs1);
      op_exmem = itf.exmem_inst_decode.opcode;
      op_memwb = itf.memwb_inst_decode.opcode;

      slti = (op_exmem == rv32i_types::op_imm) & (itf.exmem_inst_decode.funct3 == rv32i_types::slt);
      sltui = (op_exmem == rv32i_types::op_imm) & (itf.exmem_inst_decode.funct3 == rv32i_types::sltu);
      slt = (op_exmem == rv32i_types::op_reg) & (itf.exmem_inst_decode.funct3 == rv32i_types::slt);
      sltu = (op_exmem == rv32i_types::op_reg) & (itf.exmem_inst_decode.funct3 == rv32i_types::sltu);


      //special case for x0
      if(itf.idex_inst_decode.rs1 == 4'd0)
            return rs1mux::rs1_out;


      // mem => ex hazards
      if ((op_exmem == rv32i_types::op_lui) & rd_exmem_match)
            return rs1mux::exmem_u_imm;
      if ((op_exmem == rv32i_types::op_auipc) & rd_exmem_match)
            return rs1mux::exmem_alu_out;
      if ((op_exmem == rv32i_types::op_load) & rd_exmem_match)
            return rs1mux::mem_rdata;
      if (slti & rd_exmem_match)
            return rs1mux::exmem_br_en;
      if (sltui & rd_exmem_match)
            return rs1mux::exmem_br_en;
      if ((op_exmem == rv32i_types::op_imm) & rd_exmem_match)
            return rs1mux::exmem_alu_out;
      if (slt & rd_exmem_match)
            return rs1mux::exmem_br_en;
      if (sltu & rd_exmem_match)
            return rs1mux::exmem_br_en;
      if ((op_exmem == rv32i_types::op_reg) & rd_exmem_match)
            return rs1mux::exmem_alu_out;


      // wb => ex hazards
      if (rd_memwb_match & (
            (itf.memwb_inst_decode.opcode == rv32i_types::op_lui) |
            (itf.memwb_inst_decode.opcode == rv32i_types::op_auipc) |
            (itf.memwb_inst_decode.opcode == rv32i_types::op_load) |
            (itf.memwb_inst_decode.opcode == rv32i_types::op_imm) |
            (itf.memwb_inst_decode.opcode == rv32i_types::op_reg)
            ))
            return rs1mux::regfilemux_out;


      // return default value
      return rs1mux::rs1_out;

endfunction


// rs2 hazards
function rs2mux::rs2mux_sel_t rs2_forward (forwarding_itf::instruction_input itf);

      logic rd_exmem_match;
      logic rd_memwb_match;
      rv32i_types::rv32i_opcode op_exmem;
      rv32i_types::rv32i_opcode op_memwb;

      logic slti;
      logic sltui;
      logic slt;
      logic sltu;

      rd_exmem_match = (itf.exmem_inst_decode.rd == itf.idex_inst_decode.rs2);
      rd_memwb_match = (itf.memwb_inst_decode.rd == itf.idex_inst_decode.rs2);
      op_exmem = itf.exmem_inst_decode.opcode;
      op_memwb = itf.memwb_inst_decode.opcode;

      slti = (op_exmem == rv32i_types::op_imm) & (itf.exmem_inst_decode.funct3 == rv32i_types::slt);
      sltui = (op_exmem == rv32i_types::op_imm) & (itf.exmem_inst_decode.funct3 == rv32i_types::sltu);
      slt = (op_exmem == rv32i_types::op_reg) & (itf.exmem_inst_decode.funct3 == rv32i_types::slt);
      sltu = (op_exmem == rv32i_types::op_reg) & (itf.exmem_inst_decode.funct3 == rv32i_types::sltu);


      // special case for x0
      if(itf.idex_inst_decode.rs2 == 5'd0)
            return rs2mux::rs2_out;


      // mem => ex hazards
      if ((op_exmem == rv32i_types::op_lui) & rd_exmem_match)
            return rs2mux::exmem_u_imm;
      if ((op_exmem == rv32i_types::op_auipc) & rd_exmem_match)
            return rs2mux::exmem_alu_out;
      if ((op_exmem == rv32i_types::op_load) & rd_exmem_match)
            return rs2mux::mem_rdata;
      if (slti & rd_exmem_match)
            return rs2mux::exmem_br_en;
      if (sltui & rd_exmem_match)
            return rs2mux::exmem_br_en;
      if ((op_exmem == rv32i_types::op_imm) & rd_exmem_match)
            return rs2mux::exmem_alu_out;
      if (slt & rd_exmem_match)
            return rs2mux::exmem_br_en;
      if (sltu & rd_exmem_match)
            return rs2mux::exmem_br_en;
      if ((op_exmem == rv32i_types::op_reg) & rd_exmem_match)
            return rs2mux::exmem_alu_out;


      // wb => ex hazards
      if (rd_memwb_match & (
            (itf.memwb_inst_decode.opcode == rv32i_types::op_lui) |
            (itf.memwb_inst_decode.opcode == rv32i_types::op_auipc) |
            (itf.memwb_inst_decode.opcode == rv32i_types::op_load) |
            (itf.memwb_inst_decode.opcode == rv32i_types::op_imm) |
            (itf.memwb_inst_decode.opcode == rv32i_types::op_reg)
            ))
            return rs2mux::regfilemux_out;


      // return default value
      return rs2mux::rs2_out;

endfunction


function dcachemux::dcachemux_sel_t dcache_forward (forwarding_itf::instruction_input itf);

      logic rd_match;
      rd_match = (itf.memwb_inst_decode.rd == itf.exmem_inst_decode.rs2);

      if (rd_match & (
            (itf.memwb_inst_decode.opcode == rv32i_types::op_lui) |
            (itf.memwb_inst_decode.opcode == rv32i_types::op_auipc) |
            (itf.memwb_inst_decode.opcode == rv32i_types::op_load) |
            (itf.memwb_inst_decode.opcode == rv32i_types::op_imm) |
            (itf.memwb_inst_decode.opcode == rv32i_types::op_reg)
            ))
            return dcachemux::regfilemux_out;

      return dcachemux::rs2_out;

endfunction
`endif
