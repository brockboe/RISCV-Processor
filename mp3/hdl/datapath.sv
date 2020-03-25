`define BAD_MUX_SEL $fatal("%0t %s %0d: Illegal mux select", $time, `__FILE__, `__LINE__)

import rv32i_types::*;
import control_itf::*;

import rv32i_types::*;
import pcmux::*;
import marmux::*;
import cmpmux::*;
import alumux::*;
import regfilemux::*;
import rs1mux::*;
import rs2mux::*;
import dcachemux::*;

module datapath
(
      input logic clk,
      input logic rst,
      input control control,        //control itf struct,
                                    //see control_itf.sv for
                                    //more information and contents

      input ctrl_word idex_ctrl_word,     //again, see control_itf.sv

      output logic icache_address,
      output logic icache_wdata,
      input logic icache_rdata,

      output logic dcache_address,
      output logic dcache_wdata,
      input logic dcache_rdata
);

// function to decode instruction
function instruction_decode decode;
      input logic [31:0] idata;
      output decode;

      decode.funct3 = idata[14:12];
      decode.funct7 = idata[31:25];
      decode.opcode = idata[6:0];
      decode.i_imm = {{21{idata[31]}}, idata[30:20]};
      decode.s_imm = {{21{idata[31]}}, idata[30:25], idata[11:7]};
      decode.b_imm = {{20{idata[31]}}, idata[7], idata[30:25], idata[11:8], 1'b0};
      decode.u_imm = {idata[31:12], 12'h000};
      decode.j_imm = {{12{idata[31]}}, idata[19:12], idata[20], idata[30:21], 1'b0};
      decode.rs1 = idata[19:15];
      decode.rs2 = idata[24:20];
      decode.rd = idata[11:7];
endfunction

//********************************** Pipeline Registers

// IF / ID Registers
// holds instruction data for current instruction
register #(.width(32))
pipe_ifid_icache_rdata (
      .clk(clk),
      .rst(rst | control.pipe_rst_ifid),
      .load(control.pipe_load_ifid),
      .in(icache_rdata),
      .out(pipereg_ifid_icache_rdata)
);
// holds PC value for current instruction
register #(.width(32))
pipe_ifid_pc (
      .clk(clk),
      .rst(rst | control.pipe_rst_ifid),
      .load(control.pipe_load_ifid),
      .in(pc_out),
      .out(pipereg_ifid_pc_out)
);



// ID / EX Registers
// holds the decoded instruction
register #(.width(192))
pipe_idex_idecode (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex),
      .load(control.pipe_load_idex),
      .in(decode(pipereg_ifid_icache_rdata)),
      .out(pipereg_idex_idecode)
);
// control word
register #(.width(20))
pipe_idex_ctrl_word (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex),
      .load(control.pipe_load_idex),
      .in(idex_ctrl_word),
      .out(pipereg_idex_ctrl_word)
);
// PC
register #(.width(32))
pipe_idex_pc (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex),
      .load(control.pipe_load_idex),
      .in(pipereg_ifid_pc_out),
      .out(pipereg_idex_pc_out)
);
// rs1 out
register #(.width(32))
pipe_idex_rs1_out (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex),
      .load(control.pipe_load_idex),
      .in(rs1_out),
      .out(pipereg_idex_rs1_out)
);
// rs2 out
register #(.width(32))
pipe_idex_rs2_out (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex),
      .load(control.pipe_load_idex),
      .in(rs2_out),
      .out(pipereg_idex_rs2_out)
);


// EX/MEM Registers
//rs2 out
register #(.width(32))
pipe_exmem_rs2_out (
      .clk(clk),
      .rst(rst | control.pipe_rst_exmem),
      .load(control.pipe_load_exmem),
      .in(pipereg_idex_rs2_out),
      .out(pipereg_exmem_rs2_out)
);
// alu output
register #(.width(32))
pipe_exmem_alu (
      .clk(clk),
      .rst(rst | control.pipe_rst_exmem),
      .load(control.pipe_load_exmem),
      .in(alu_out),
      .out(pipe_exmem_alu_out)
);
// instruction data
register #(.width(192))
pipe_exmem_decode (
      .clk(clk),
      .rst(rst | control.pipe_rst_exmem),
      .load(control.pipe_load_exmem),
      .in(pipereg_idex_idecode),
      .out(pipereg_exmem_idecode)
);
// branch enable
register #(.width(32))
pipe_exmem_br_en (
      .clk(clk),
      .rst(rst | control.pipe_rst_exmem),
      .load(control.pipe_load_exmem),
      .in(br_en_out),
      .out(pipereg_exmem_br_en_out)
);
// control word
register #(.width(20))
pipe_exmem_ctrl_word(
      .clk(clk),
      .rst(rst | control.pipe_rst_exmem),
      .load(control.pipe_load_exmem),
      .in(pipereg_idex_ctrl_word),
      .out(pipereg_exmem_ctrl_word)
);



// MEM / WB Registers
// alu output
register #(.width(32))
pipe_memwb_alu_out (
      .clk(clk),
      .rst(rst | control.pipe_rst_memwb),
      .load(control.pipe_load_memwb),
      .in(pipe_exmem_alu_out),
      .out(pipe_memwb_alu_out),
);
// instruction data
register #(.width(192))
pipe_memwb_idecode (
      .clk(clk),
      .rst(rst | control.pipe_rst_memwb),
      .load(control.pipe_load_memwb),
      .in(pipereg_exmem_idecode),
      .out(pipereg_memwb_idecode)
);
// memory data register out
register #(.width(32))
pipe_memwb_mdr_out (
      .clk(clk),
      .rst(rst | control.pipe_rst_memwb),
      .load(control.pipe_load_memwb),
      .in(dcache_rdata),
      .out(pipereg_memwb_mdr_out)
);
// control word
register #(.width(32))
pipe_memwb_ctrl_word (
      .clk(clk),
      .rst(rst | control.pipe_rst_memwb),
      .load(control.pipe_load_memwb),
      .in(pipereg_exmem_ctrl_word),
      .out(pipereg_memwb_ctrl_word)
);
// branch enable
register #(.width(32))
pipe_memwb_br_en (
      .clk(clk),
      .rst(rst | control.pipe_rst_memwb),
      .load(control.pipe_load_memwb),
      .in(pipereg_exmem_br_en_out),
      .out(pipereg_memwb_br_en)
);

//*****************************************************






//********************************** Pipeline Stage Modules

// IF - instruction fetch
pc_register #(.width(32))
pc (
      .clk(clk),
      .rst(rst),
      .load(control.load_pc),
      .in(pcmux_out),
      .out(pc_out)
);


// DE - decode
regfile regfile(
      .clk(clk),
      .rst(rst),
      .load(control.load_regfile),
      .in(regfilemux_out),
      .src_a(pipereg_idex_idecode.rs1),
      .src_b(pipereg_idex_idecode.rs2),
      .dest(pipereg_idex_idecode.rd),
      .reg_a(rs1_out),
      .reg_b(rs2_out)
);


// EX - execute
alu alu (
      .aluop(pipereg_idex_idecode.funct3),
      .a(alumux1_out),
      .b(alumux2_out),
      .f(alu_out)
);


// MEM - Memory
// none


// WB - Writeback
// none

//**********************************************************



//********************************** Mux Declarations
// mux typdef declarations all found
// in rv32i_mux_types.sv, including rs1mux,
// rs2mux, dcachemux

always_comb begin : MUXES
      // IF - Instruction fetch
      unique case (control.pcmux_sel)
            pcmux::pc_plus4: pcmux_out = pc_out + 4;
            pcmux::alu_out: pcmux_out = pipe_exmem_alu_out;
            default: `BAD_MUX_SEL;
      endcase

      // ID - Instruction Decode
      // none


      // EX - Execute
      // TODO: Complete forwarding
      unique case (control.rs1mux_sel)
            rs1mux::rs1_out: rs1mux_out = pipereg_idex_rs1_out;
            default: `BAD_MUX_SEL;
      endcase

      // TODO: Complete forwarding
      unique case (control.rs2mux_sel)
            rs2mux::rs2_out: rs2mux_out = pipereg_idex_rs2_out;
      endcase

      unique case (control.alumux1_sel)
            alumux::rs1_out: alumux1_out = rs1mux_out;
            alumux::pc_out: alumux1_out = pipereg_idex_pc_out;
            default: `BAD_MUX_SEL;
      endcase

      unique case (control.alumux2_sel)
            alumux::rs2_out: alumux2_out = rs2mux_out;
            alumux::i_imm: alumux2_out = pipereg_idex_idecode.i_imm;
            alumux::u_imm: alumux2_out = pipereg_idex_idecode.u_imm;
            alumux::b_imm: alumux2_out = pipereg_idex_idecode.b_imm;
            alumux::s_imm: alumux2_out = pipereg_idex_idecode.s_imm;
            alumux::j_imm: alumux2_out = pipereg_idex_idecode.j_imm;
            default: `BAD_MUX_SEL;
      endcase

      unique case (control.cmpmux_sel)
            cmpmux::rs2_out: cmpmux_out = pipereg_idex_rs2_out;
            cmpmux::i_imm: cmpmux_out = pipereg_idex_idecode.i_imm;
            default: `BAD_MUX_SEL;
      endcase

      // TODO: Implement dcache read / write logic
      // MEM - Memory
      unique case (control.dcachemux_sel)
            dcachemux::rs2_out: dcachemux_out = pipereg_exmem_rs2_out;
            default: `BAD_MUX_SEL;
      endcase

      // WB - Writeback
      unique case (control.regfilemux_sel)
            regfilemux::alu_out: regfilemux_out = pipe_memwb_alu_out;
            regfilemux::br_en: regfilemux_out = pipereg_memwb_br_en
            regfilemux::u_imm: regfilemux_out = pipereg_memwb_idecode.u_imm;
            regfilemux::MDRreg_out: regfilemux_out = pipereg_memwb_mdr_out;
            default: `BAD_MUX_SEL;
      endcase

end

//****************************************************


endmodule: datapath
