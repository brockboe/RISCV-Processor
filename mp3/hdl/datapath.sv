`define BAD_MUX_SEL $fatal("%0t %s %0d: Illegal mux select", $time, `__FILE__, `__LINE__)
`include "./forwarding/forwarding.sv"


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

      input control_itf::control control,

      output rv32i_opcode opcode,
      output logic [2:0] funct3,
      output logic [6:0] funct7,
      input control_itf::ctrl_word idex_ctrl_word,     //see control_itf.sv
                                                       //The new control word is injected
                                                       //in the id/ex stage, and then passed
                                                       //along the pipeline stage
      //icache signals
      output logic icache_read,
      output logic [31:0] icache_address,
      output logic [31:0] icache_wdata,
      input logic [31:0] icache_rdata,
      input logic icache_resp,

      //dcache signals
      output logic dcache_read,
      output logic dcache_write,
      output logic [3:0] dcache_mbe,
      output logic [31:0] dcache_address,
      output logic [31:0] dcache_wdata,
      input logic [31:0] dcache_rdata,
      input logic dcache_resp
);

// connectors - defined here proactively so quartus doesn't get
// confused or complain
control_itf::instruction_decode pipereg_ifid_idecode;
control_itf::instruction_decode pipereg_idex_idecode;
control_itf::instruction_decode pipereg_exmem_idecode;
control_itf::instruction_decode pipereg_memwb_idecode;
control_itf::ctrl_word pipereg_idex_ctrl_word;
control_itf::ctrl_word pipereg_exmem_ctrl_word;
control_itf::ctrl_word pipereg_memwb_ctrl_word;
logic [31:0] rs1mux_out;
logic [31:0] rs2mux_out;
logic [31:0] dcachemux_out;
logic [31:0] pc_module_out;
logic [31:0] pipereg_ifid_pc_out;
logic [31:0] pipereg_idex_pc_out;
logic [31:0] pipereg_exmem_pc_out;
logic [31:0] pipereg_memwb_pc_out;
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
logic br_en_out;                           //TODO: When working with the cmp module, remember
logic [31:0] pipereg_exmem_br_en_out;      // that the output is one bit, and must be extended
logic [31:0] pipereg_memwb_br_en;          // to 32 bits.
logic [31:0] cmpmux_out;
logic branch_go;                    // specifies whether we need to branch
logic pause_pipeline;               // logic specifying if we need to halt the pipeline
logic [31:0] mem_rdata;       //parsed memory input, for non-word-aligned stores
logic [31:0] mem_wdata;       //parsed memory output, for non-word-aligned writes
logic [3:0] mem_mbe;           //parsed memory byte enable, for non-word aligned writes
logic mem_forward_pause_pipeline;   // pause pipeline if we have to fowarward data from the mem stage
logic [31:0] mem_rdata_temp;   // temporary storage of mem_rdata, see mem stage below

logic icache_resp_2, dcache_resp_2;     // 1 if cache has responded to the current inst, 0 if not.
forwarding_itf::instruction_input fitf;


// memory forwarding / hazard detection solution
always_comb begin

      if ((pipereg_exmem_idecode.opcode == rv32i_types::op_load) &
               (pipereg_exmem_idecode.rs1 != 5'd0) &
               (pipereg_idex_idecode.rs1 == pipereg_exmem_idecode.rd))
            mem_forward_pause_pipeline = 1'b1;
      else if ((pipereg_exmem_idecode.opcode == rv32i_types::op_load) &
               (pipereg_idex_idecode.rs2 == pipereg_exmem_idecode.rd) &
               (pipereg_idex_idecode.rs2 != 5'd0) &
               ((pipereg_idex_idecode.opcode == rv32i_types::op_br) |
                (pipereg_idex_idecode.opcode == rv32i_types::op_store) |
                (pipereg_idex_idecode.opcode == rv32i_types::op_reg)))
            mem_forward_pause_pipeline = 1'b1;
      else
            mem_forward_pause_pipeline = 1'b0;

end

logic [1:0] mem_forward_timer;

always_ff @ (posedge clk or posedge rst) begin
      if(rst)
            mem_forward_timer <= 4'd0;

      else begin
            mem_forward_timer[0] <= mem_forward_pause_pipeline;
            mem_forward_timer[1] <= mem_forward_pause_pipeline;
      end
end

always_comb begin

      // assign forwarding itf signals
      fitf.idex_inst_decode =  pipereg_idex_idecode;
      fitf.exmem_inst_decode = pipereg_exmem_idecode;
      fitf.memwb_inst_decode = pipereg_memwb_idecode;

      // calculate whether or not we need to branch
      branch_go = pipereg_exmem_br_en_out[0] &
                  ((pipereg_exmem_idecode.opcode == op_br) |
                  (pipereg_exmem_idecode.opcode == op_jal) |
                  (pipereg_exmem_idecode.opcode == op_jalr));

      // calcualte if we need to pause (if we're waiting on data from memory)
      if (icache_read & (~icache_resp)) pause_pipeline = 1'b1; // waiting on icache
      else if ((dcache_read | dcache_write) & (~dcache_resp))  pause_pipeline = 1'b1; // waiting on dcache
      else if (mem_forward_pause_pipeline & (~mem_forward_timer[0])) pause_pipeline = 1'b1;  //pause for memory forwarding
      else pause_pipeline = 1'b0;

end

always_ff @( posedge clk ) begin
      if (pause_pipeline) begin
            if (icache_resp) begin
                  icache_resp_2 <= 1'b1;
            end
            if (dcache_resp) begin
                  dcache_resp_2 <= 1'b1;
            end
            // else keep current value
      end
      else begin
            icache_resp_2 <= 1'b0;
            dcache_resp_2 <= 1'b0;
      end
end

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
register #(.width(192))
pipe_ifid_idecode (
      .clk(clk),
      .rst(rst | control.pipe_rst_ifid | branch_go),
      .load(control.pipe_load_ifid & (~pause_pipeline)),
      .in(decode(icache_rdata)),
      .out(pipereg_ifid_idecode)
);
// holds PC value for current instruction
register #(.width(32))
pipe_ifid_pc (
      .clk(clk),
      .rst(rst | control.pipe_rst_ifid | branch_go),
      .load(control.pipe_load_ifid & (~pause_pipeline)),
      .in(pc_module_out),
      .out(pipereg_ifid_pc_out)
);



// ID / EX Registers
// holds the decoded instruction
register #(.width(192))
pipe_idex_idecode (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex | branch_go),
      .load(control.pipe_load_idex & (~pause_pipeline)),
      .in(pipereg_ifid_idecode),
      .out(pipereg_idex_idecode)
);
// control word
ctrl_word_register
pipe_idex_ctrl_word (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex | branch_go),
      .load(control.pipe_load_idex & (~pause_pipeline)),
      .in(idex_ctrl_word),
      .out(pipereg_idex_ctrl_word)
);
// PC
register #(.width(32))
pipe_idex_pc (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex | branch_go),
      .load(control.pipe_load_idex & (~pause_pipeline)),
      .in(pipereg_ifid_pc_out),
      .out(pipereg_idex_pc_out)
);
// rs1 out
register #(.width(32))
pipe_idex_rs1_out (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex | branch_go),
      .load(control.pipe_load_idex & (~pause_pipeline)),
      .in(regfile_rs1_out),
      .out(pipereg_idex_rs1_out)
);
// rs2 out
register #(.width(32))
pipe_idex_rs2_out (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex | branch_go),
      .load(control.pipe_load_idex & (~pause_pipeline)),
      .in(regfile_rs2_out),
      .out(pipereg_idex_rs2_out)
);


// EX/MEM Registers
//rs2 out
register #(.width(32))
pipe_exmem_rs2_out (
      .clk(clk),
      .rst(rst | control.pipe_rst_exmem | (branch_go & ~pause_pipeline)),
      .load(control.pipe_load_exmem & (~pause_pipeline)),
      .in(rs2mux_out),
      .out(pipereg_exmem_rs2_out)
);
// alu output
register #(.width(32))
pipe_exmem_alu (
      .clk(clk),
      .rst(rst | control.pipe_rst_exmem | (branch_go & ~pause_pipeline)),
      .load(control.pipe_load_exmem & (~pause_pipeline)),
      .in(alu_module_out),
      .out(pipe_exmem_alu_out)
);
// instruction data
register #(.width(192))
pipe_exmem_decode (
      .clk(clk),
      .rst(rst | control.pipe_rst_exmem | (branch_go & ~pause_pipeline)),
      .load(control.pipe_load_exmem & (~pause_pipeline)),
      .in(pipereg_idex_idecode),
      .out(pipereg_exmem_idecode)
);
// branch enable
register #(.width(32))
pipe_exmem_br_en (
      .clk(clk),
      .rst(rst | control.pipe_rst_exmem | (branch_go & ~pause_pipeline)),
      .load(control.pipe_load_exmem & (~pause_pipeline)),
      .in({31'd0, br_en_out}),
      .out(pipereg_exmem_br_en_out)
);
// control word
ctrl_word_register
pipe_exmem_ctrl_word(
      .clk(clk),
      .rst(rst | control.pipe_rst_exmem | (branch_go & ~pause_pipeline)),
      .load(control.pipe_load_exmem & (~pause_pipeline)),
      .in(pipereg_idex_ctrl_word),
      .out(pipereg_exmem_ctrl_word)
);

// PC
register #(.width(32))
pipe_exmem_pc (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex | (branch_go & ~pause_pipeline)),
      .load(control.pipe_load_idex & (~pause_pipeline)),
      .in(pipereg_idex_pc_out),
      .out(pipereg_exmem_pc_out)
);



// MEM / WB Registers
// alu output
register #(.width(32))
pipe_memwb_alu (
      .clk(clk),
      .rst(rst | control.pipe_rst_memwb),
      .load(control.pipe_load_memwb & (~pause_pipeline)),
      .in(pipe_exmem_alu_out),
      .out(pipe_memwb_alu_out)
);
// instruction data
register #(.width(192))
pipe_memwb_idecode (
      .clk(clk),
      .rst(rst | control.pipe_rst_memwb),
      .load(control.pipe_load_memwb & (~pause_pipeline)),
      .in(pipereg_exmem_idecode),
      .out(pipereg_memwb_idecode)
);
// memory data register out
register #(.width(32))
pipe_memwb_mdr_out (
      .clk(clk),
      .rst(rst | control.pipe_rst_memwb),
      .load(control.pipe_load_memwb & (~pause_pipeline)),
      .in(mem_rdata),
      .out(pipereg_memwb_mdr_out)
);
// control word
ctrl_word_register
pipe_memwb_ctrl_word (
      .clk(clk),
      .rst(rst | control.pipe_rst_memwb),
      .load(control.pipe_load_memwb & (~pause_pipeline)),
      .in(pipereg_exmem_ctrl_word),
      .out(pipereg_memwb_ctrl_word)
);
// branch enable
register #(.width(32))
pipe_memwb_br_en (
      .clk(clk),
      .rst(rst | control.pipe_rst_memwb),
      .load(control.pipe_load_memwb & (~pause_pipeline)),
      .in(pipereg_exmem_br_en_out),
      .out(pipereg_memwb_br_en)
);

// PC
register #(.width(32))
pipe_memwb_pc (
      .clk(clk),
      .rst(rst | control.pipe_rst_idex),
      .load(control.pipe_load_idex & (~pause_pipeline)),
      .in(pipereg_exmem_pc_out),
      .out(pipereg_memwb_pc_out)
);

//*****************************************************




//********************************** Pipeline Stage Modules

assign icache_read = ~icache_resp_2; // (CP1)
assign icache_address = pc_module_out;

// IF - instruction fetch
pc_register #(.width(32))
pc (
      .clk(clk),
      .rst(rst),
      .load(~pause_pipeline),                  //don't always load the pc
      .in(pcmux_out),
      .out(pc_module_out)
);

// DE - decode
regfile regfile(
      .clk(clk),
      .rst(rst),
      .load(pipereg_memwb_ctrl_word.load_regfile),
      .in(regfilemux_out),
      .src_a(pipereg_ifid_idecode.rs1),
      .src_b(pipereg_ifid_idecode.rs2),
      .dest(pipereg_memwb_idecode.rd),
      .reg_a(regfile_rs1_out),
      .reg_b(regfile_rs2_out)
);

assign opcode = rv32i_opcode'(pipereg_ifid_idecode.opcode);
assign funct3 = pipereg_ifid_idecode.funct3;
assign funct7 = pipereg_ifid_idecode.funct7;

// EX - execute
alu alu (
      .aluop(pipereg_idex_ctrl_word.aluop),
      .a(alumux1_out),
      .b(alumux2_out),
      .f(alu_module_out)
);

cmp_module cmp (
      .op(rv32i_types::branch_funct3_t ' (pipereg_idex_ctrl_word.cmpop)),
      .a(rs1mux_out),
      .b(cmpmux_out),
      .result(br_en_out)
);


// MEM - Memory
assign dcache_read = pipereg_exmem_ctrl_word.dcache_read & (~dcache_resp_2);
assign dcache_write = pipereg_exmem_ctrl_word.dcache_write & (~dcache_resp_2);
assign dcache_wdata = dcachemux_out;
assign dcache_address = {pipe_exmem_alu_out[31:2], 2'd0};
assign dcache_mbe = mem_mbe;

register #(.width(32))
mem_rdata_temp_storage (
      .clk(clk),
      .rst(rst),
      .load(1'b1),
      .in(mem_rdata),
      .out(mem_rdata_temp)
);

// WB - Writeback
// none

//**********************************************************






//********************************** Non-word aligned read / writes

// functions to parse direct input from the data cache
function logic [31:0] parse_lb (logic [31:0] rdata);
      logic [31:0] parse;
      unique case(pipe_exmem_alu_out[1:0])
            2'b00: parse = {{24{rdata[7]}}, rdata[7:0]};
            2'b01: parse = {{24{rdata[15]}}, rdata[15:8]};
            2'b10: parse = {{24{rdata[23]}}, rdata[23:16]};
            2'b11: parse = {{24{rdata[31]}}, rdata[31:24]};
            default: parse = 32'd0;
      endcase
      return parse;
endfunction

function logic [31:0] parse_lbu (logic [31:0] rdata);
      logic [31:0] parse;
      unique case(pipe_exmem_alu_out[1:0])
            2'b00: parse = {24'd0, rdata[7:0]};
            2'b01: parse = {24'd0, rdata[15:8]};
            2'b10: parse = {24'd0, rdata[23:16]};
            2'b11: parse = {24'd0, rdata[31:24]};
            default: parse = 32'd0;
      endcase
      return parse;
endfunction

function logic [31:0] parse_lh (logic [31:0] rdata);
      logic [31:0] parse;
      unique case(pipe_exmem_alu_out[1:0])
            2'b00: parse = {{16{rdata[15]}}, rdata[15:0]};
            2'b01: parse = {{16{rdata[23]}}, rdata[23:8]};
            2'b10: parse = {{16{rdata[31]}}, rdata[31:16]};
            2'b11: parse = 32'hBAADBAAD; // don't care about this case
            default: parse = 32'd0;
      endcase
      return parse;
endfunction

function logic [31:0] parse_lhu (logic [31:0] rdata);
      logic [31:0] parse;
      unique case(pipe_exmem_alu_out[1:0])
            2'b00: parse = {16'd0, rdata[15:0]};
            2'b01: parse = {16'd0, rdata[23:8]};
            2'b10: parse = {16'd0, rdata[31:16]};
            2'b11: parse = 32'hBAADBAAD; // don't care about this case
            default: parse = 32'd0;
      endcase
      return parse;
endfunction


always_comb begin : NWA_read_write

      unique case(pipereg_exmem_idecode.funct3)
            rv32i_types::lb: mem_rdata = parse_lb(dcache_rdata);
            rv32i_types::lbu: mem_rdata = parse_lbu(dcache_rdata);
            rv32i_types::lh: mem_rdata = parse_lh(dcache_rdata);
            rv32i_types::lhu: mem_rdata = parse_lhu(dcache_rdata);
            default: mem_rdata = dcache_rdata;
      endcase

      unique case(pipereg_exmem_idecode.funct3)
            rv32i_types::sb: begin
                  mem_wdata = (pipereg_exmem_rs2_out << {pipe_exmem_alu_out[1:0], 3'd0});
                  mem_mbe = (4'b0001 << {pipe_exmem_alu_out[1:0]});
            end
            rv32i_types::sh: begin
                  mem_wdata = (pipereg_exmem_rs2_out << {pipe_exmem_alu_out[1:0], 3'd0});
                  mem_mbe = (4'b0011 << {pipe_exmem_alu_out[1:0]});
            end
            default: begin
                  mem_wdata = pipereg_exmem_rs2_out;
                  mem_mbe = 4'b1111;
            end
      endcase

end


//**********************************************************







//********************************** Hazard Detection / Forwarding


rs1mux::rs1mux_sel_t rs1mux_forwarding_sel;
rs2mux::rs2mux_sel_t rs2mux_forwarding_sel;
dcachemux::dcachemux_sel_t dcachemux_forwarding_sel;

always_comb begin
	rs1mux_forwarding_sel = rs1_forward(fitf);
	rs2mux_forwarding_sel = rs2_forward(fitf);
	dcachemux_forwarding_sel = dcache_forward(fitf);
end

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
      unique case (branch_go)
            1'b0: pcmux_out = pc_module_out + 32'd4;
            1'b1: pcmux_out = {pipe_exmem_alu_out[31:2], 2'd0};
            default: pcmux_out = pc_module_out + 32'd4;
      endcase

      // ID - Instruction Decode
      // none


      // EX - Execute

      // TODO: Implement dcache read / write logic
      // MEM - Memory
      unique case (dcachemux_forwarding_sel)
            dcachemux::rs2_out: dcachemux_out = mem_wdata;
            dcachemux::regfilemux_out: dcachemux_out = regfilemux_out;
            default: dcachemux_out = mem_wdata;
      endcase
      //dcachemux_out = mem_wdata;

      // WB - Writeback
      unique case (pipereg_memwb_ctrl_word.regfilemux_sel)
            regfilemux::alu_out: regfilemux_out = pipe_memwb_alu_out;
            regfilemux::br_en: regfilemux_out = pipereg_memwb_br_en;
            regfilemux::u_imm: regfilemux_out = pipereg_memwb_idecode.u_imm;
            regfilemux::MDRreg_out: regfilemux_out = pipereg_memwb_mdr_out;
            regfilemux::pc_plus4: regfilemux_out = pipereg_memwb_pc_out + 4;
            //default: `BAD_MUX_SEL;
      endcase


      // TODO: Complete forwarding
      unique case (rs1mux_forwarding_sel)
            rs1mux::rs1_out: rs1mux_out = pipereg_idex_rs1_out;
            rs1mux::exmem_alu_out: rs1mux_out = pipe_exmem_alu_out;
            rs1mux::exmem_br_en: rs1mux_out = pipereg_exmem_br_en_out;
            rs1mux::regfilemux_out: rs1mux_out = regfilemux_out;
            rs1mux::mem_rdata: rs1mux_out = mem_rdata_temp;
            rs1mux::exmem_u_imm: rs1mux_out = pipereg_exmem_idecode.u_imm;
            default: rs1mux_out = pipereg_idex_rs1_out;
      endcase
      //rs1mux_out = pipereg_idex_rs1_out;

      // TODO: Complete forwarding
      unique case (rs2mux_forwarding_sel)
            rs2mux::rs2_out: rs2mux_out = pipereg_idex_rs2_out;
            rs2mux::exmem_alu_out: rs2mux_out = pipe_exmem_alu_out;
            rs2mux::exmem_br_en: rs2mux_out = pipereg_exmem_br_en_out;
            rs2mux::regfilemux_out: rs2mux_out = regfilemux_out;
            rs2mux::mem_rdata: rs2mux_out = mem_rdata_temp;
            rs2mux::exmem_u_imm: rs2mux_out = pipereg_exmem_idecode.u_imm;
            default: rs2mux_out = pipereg_idex_rs2_out;
      endcase
      //rs2mux_out = pipereg_idex_rs2_out;

      unique case (pipereg_idex_ctrl_word.alumux1_sel)
            alumux::rs1_out: alumux1_out = rs1mux_out;
            alumux::pc_out: alumux1_out = pipereg_idex_pc_out;
            //default: `BAD_MUX_SEL;
      endcase

      unique case (pipereg_idex_ctrl_word.alumux2_sel)
            alumux::rs2_out: alumux2_out = rs2mux_out;
            alumux::i_imm: alumux2_out = pipereg_idex_idecode.i_imm;
            alumux::u_imm: alumux2_out = pipereg_idex_idecode.u_imm;
            alumux::b_imm: alumux2_out = pipereg_idex_idecode.b_imm;
            alumux::s_imm: alumux2_out = pipereg_idex_idecode.s_imm;
            alumux::j_imm: alumux2_out = pipereg_idex_idecode.j_imm;
            //default: `BAD_MUX_SEL;
      endcase

      unique case (pipereg_idex_ctrl_word.cmpmux_sel)
            cmpmux::rs2_out: cmpmux_out = rs2mux_out;
            cmpmux::i_imm: cmpmux_out = pipereg_idex_idecode.i_imm;
            //default: `BAD_MUX_SEL;
      endcase

end

//****************************************************


endmodule: datapath
