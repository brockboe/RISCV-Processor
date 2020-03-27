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

// top level datapath module
module datapath
(
      input logic clk,
      input logic rst,
      input control_itf::control control,        //control itf struct,
                                                 //see control_itf.sv for
                                                 //more information and contents

      output rv32i_opcode opcode,
      output logic [2:0] funct3,
      output logic [6:0] funct7,
      input control_itf::ctrl_word idex_ctrl_word,     //again, see control_itf.sv
                                                       //The new control word is injected
                                                       //in the id/ex stage, and then passed
                                                       //along the pipeline stage

      output logic [31:0] icache_address,
      output logic [31:0] icache_wdata,
      input logic [31:0] icache_rdata,

      output logic [31:0] dcache_address,
      output logic [31:0] dcache_wdata,
      input logic [31:0] dcache_rdata
);

// connectors - defined here so quartus doesn't get
// confused or complain
control_itf::instruction_decode pipereg_idex_idecode;
control_itf::instruction_decode pipereg_exmem_idecode;
control_itf::instruction_decode pipereg_memwb_idecode;
control_itf::ctrl_word pipereg_idex_ctrl_word;
control_itf::ctrl_word pipereg_exmem_ctrl_word;
control_itf::ctrl_word pipereg_memwb_ctrl_word;
logic [31:0] rs1mux_out;
logic [31:0] rs2mux_out;
logic [31:0] dcachemux_out;
logic [31:0] pipereg_ifid_icache_rdata;
logic [31:0] pc_module_out;
logic [31:0] pipereg_ifid_pc_out;
logic [31:0] pipereg_idex_pc_out;
logic [31:0] pipereg_idex_rs1_out;
logic [31:0] regfile_rs1_out;
logic [31:0] regfile_rs2_out;
logic [31:0] pipereg_idex_rs2_out;
logic [31:0] pipereg_exmem_rs2_out;
logic [31:0] alu_module_out;
logic [31:0] pipe_exmem_alu_out;
logic [31:0] pipe_memwb_alu_out;
logic [31:0] pipereg_memwb_mdr_out;
logic [31:0] pcmux_out;
logic [31:0] regfilemux_out;
logic [31:0] alumux1_out;
logic [31:0] alumux2_out;
logic br_en_out;                    //TODO: When working with the cmp module, remember
logic [31:0] pipereg_exmem_br_en_out;      // that the output is one bit, and must be extended
logic [31:0] pipereg_memwb_br_en;          // to 32 bits.
logic [31:0] cmpmux_out;


// function to decode instruction
// only used in pipe_idex_idecode pipeline
// register to convert the instruction into something
// useful
function control_itf::instruction_decode decode (logic [31:0] idata);
      control_itf::instruction_decode d;

      d.funct3 = idata[14:12];
      d.funct7 = idata[31:25];
      d.opcode = rv32i_types::rv32i_opcode ' (idata[6:0]);
      d.i_imm = {{21{idata[31]}}, idata[30:20]};
      d.s_imm = {{21{idata[31]}}, idata[30:25], idata[11:7]};
      d.b_imm = {{20{idata[31]}}, idata[7], idata[30:25], idata[11:8], 1'b0};
      d.u_imm = {idata[31:12], 12'h000};
      d.j_imm = {{12{idata[31]}}, idata[19:12], idata[20], idata[30:21], 1'b0};
      d.rs1 = idata[19:15];
      d.rs2 = idata[24:20];
      d.rd = idata[11:7];

      return d;
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
      .in(pc_module_out),
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
ctrl_word_register
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
      .in(regfile_rs1_out),
      .out(pipereg_idex_rs1_out)
);
// rs2 out
register #(.width(32))
pipe_idex_rs2_out (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex),
      .load(control.pipe_load_idex),
      .in(regfile_rs2_out),
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
      .in(alu_module_out),
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
      .in({31'd0, br_en_out}),
      .out(pipereg_exmem_br_en_out)
);
// control word
ctrl_word_register
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
pipe_memwb_alu (
      .clk(clk),
      .rst(rst | control.pipe_rst_memwb),
      .load(control.pipe_load_memwb),
      .in(pipe_exmem_alu_out),
      .out(pipe_memwb_alu_out)
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
ctrl_word_register
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


// compute alu and cmp signals
// see execute controller for
// implementation
cmpmux::cmpmux_sel_t cmpmux_sel;
alumux::alumux1_sel_t alumux1_sel;
alumux::alumux2_sel_t alumux2_sel;
rv32i_types::alu_ops aluop;
rv32i_types::branch_funct3_t cmpop;

execute_controller execute_controller (
      .idecode(pipereg_idex_idecode),
      .cmpmux_sel(cmpmux_sel),
      .alumux1_sel(alumux1_sel),
      .alumux2_sel(alumux2_sel),
      .aluop(aluop),
      .cmpop(cmpop)
);




// IF - instruction fetch
pc_register #(.width(32))
pc (
      .clk(clk),
      .rst(rst),
      .load(1'b1),                  //always load the pc
      .in(pcmux_out),
      .out(pc_module_out)
);


// DE - decode
regfile regfile(
      .clk(clk),
      .rst(rst),
      .load(pipereg_memwb_ctrl_word.load_regfile),
      .in(regfilemux_out),
      .src_a(pipereg_idex_idecode.rs1),
      .src_b(pipereg_idex_idecode.rs2),
      .dest(pipereg_idex_idecode.rd),
      .reg_a(regfile_rs1_out),
      .reg_b(regfile_rs2_out)
);

assign opcode = rv32i_opcode'(pipereg_idex_idecode.opcode);
assign funct3 = pipereg_idex_idecode.funct3;
assign funct7 = pipereg_idex_idecode.funct7;

// EX - execute
alu alu (
      .aluop(aluop),
      .a(alumux1_out),
      .b(alumux2_out),
      .f(alu_module_out)
);

cmp_module cmp (
      .op(cmpop),
      .a(rs1mux_out),
      .b(cmpmux_out),
      .result(br_en_out)
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
      // Set defaults
      pcmux_out = 32'bx;
      alumux1_out = 32'bx;
      alumux2_out = 32'bx;
      regfilemux_out = 32'bx;
      cmpmux_out = 32'bx;
      dcachemux_out = 32'bx;

      // IF - Instruction fetch
      unique case (pipereg_memwb_br_en[0])
            1'b0: pcmux_out = pc_module_out + 32'd4;
            1'b1: pcmux_out = {pipe_exmem_alu_out[31:2], 2'd0};
            default: `BAD_MUX_SEL;
      endcase

      // ID - Instruction Decode
      // none


      // EX - Execute
      // TODO: Complete forwarding
      //unique case (control.rs1mux_sel)
      //      rs1mux::rs1_out: rs1mux_out = pipereg_idex_rs1_out;
      //      default: `BAD_MUX_SEL;
      //endcase
      rs1mux_out = pipereg_idex_rs1_out;

      // TODO: Complete forwarding
      //unique case (control.rs2mux_sel)
      //      rs2mux::rs2_out: rs2mux_out = pipereg_idex_rs2_out;
      //      default: `BAD_MUX_SEL;
      //endcase
      rs2mux_out = pipereg_idex_rs2_out;

      unique case (alumux1_sel)
            alumux::rs1_out: alumux1_out = rs1mux_out;
            alumux::pc_out: alumux1_out = pipereg_idex_pc_out;
            default: `BAD_MUX_SEL;
      endcase

      unique case (alumux2_sel)
            alumux::rs2_out: alumux2_out = rs2mux_out;
            alumux::i_imm: alumux2_out = pipereg_idex_idecode.i_imm;
            alumux::u_imm: alumux2_out = pipereg_idex_idecode.u_imm;
            alumux::b_imm: alumux2_out = pipereg_idex_idecode.b_imm;
            alumux::s_imm: alumux2_out = pipereg_idex_idecode.s_imm;
            alumux::j_imm: alumux2_out = pipereg_idex_idecode.j_imm;
            default: `BAD_MUX_SEL;
      endcase

      unique case (cmpmux_sel)
            cmpmux::rs2_out: cmpmux_out = pipereg_idex_rs2_out;
            cmpmux::i_imm: cmpmux_out = pipereg_idex_idecode.i_imm;
            default: `BAD_MUX_SEL;
      endcase

      // TODO: Implement dcache read / write logic
      // MEM - Memory
      //unique case (control.dcachemux_sel)
      //      dcachemux::rs2_out: dcachemux_out = pipereg_exmem_rs2_out;
      //      default: `BAD_MUX_SEL;
      //endcase
      dcachemux_out = pipereg_exmem_rs2_out;

      // WB - Writeback
      unique case (pipereg_memwb_ctrl_word.regfilemux_sel)
            regfilemux::alu_out: regfilemux_out = pipe_memwb_alu_out;
            regfilemux::br_en: regfilemux_out = pipereg_memwb_br_en;
            regfilemux::u_imm: regfilemux_out = pipereg_memwb_idecode.u_imm;
            regfilemux::MDRreg_out: regfilemux_out = pipereg_memwb_mdr_out;
            default: `BAD_MUX_SEL;
      endcase

end

//****************************************************


endmodule: datapath
