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
logic pipe_rst_ifid, pipe_rst_idex, pipe_rst_exmem, pipe_rst_memwb;
logic pipe_load_ifid, pipe_load_idex, pipe_load_exmem, pipe_load_memwb;
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
logic pause_pipeline;               // logic specifying if we need to halt the pipeline
logic [31:0] mem_rdata;       //parsed memory input, for non-word-aligned stores
logic [31:0] mem_wdata;       //parsed memory output, for non-word-aligned writes
logic [3:0] mem_mbe;           //parsed memory byte enable, for non-word aligned writes
logic mem_forward_pause_pipeline;   // pause pipeline if we have to fowarward data from the mem stage
logic [31:0] mem_rdata_temp;   // temporary storage of mem_rdata, see mem stage below

logic icache_resp_2, dcache_resp_2;     // 1 if cache has responded to the current inst, 0 if not.
forwarding_itf::instruction_input fitf;

//multiplier signals
logic [63:0] multiplier_out;
logic multiplier_done;
logic run_multiplier;

//divider signals
logic [31:0] quotient_out;
logic [31:0] remainder_out;
logic divider_done;
logic run_divider;

logic [31:0] aluresmux_out;

//Branch predictor Signals
rv32i_word target, pc_in, bpmux_out;
logic btb_hit;
logic prediction;
logic taken, pipereg_idex_taken, pipereg_ifid_taken;
logic correct, pipereg_exmem_correct;
logic flush, pipereg_idex_flush, pipereg_exmem_flush;
logic not_correct,is_taken, is_jal, is_jalr;
assign not_correct = ~correct && pipereg_idex_idecode.opcode == op_br;
assign is_taken = pipereg_idex_taken;
assign is_jal = pipereg_idex_idecode.opcode == op_jal;
assign is_jalr = pipereg_idex_idecode.opcode == op_jalr;
assign is_br = pipereg_idex_idecode.opcode == op_br;



// memory forwarding / hazard detection solution.
//
// comparisons are performed between ifid / idex
// because the pause pipeline signal must be set
// high while the load instruction reaches the
// mem stage. Performing the comparisons between the
// idex / exmem stages would set the signal high
// a clock cycle late.
always_ff @ (posedge clk) begin

      if(rst) begin
            mem_forward_pause_pipeline <= 1'b0;
      end else begin
            if ((mem_forward_pause_pipeline == 1'b1) &
                ~((dcache_read | dcache_write) & (~dcache_resp)) &
                ~(icache_read & (~icache_resp)))
                  mem_forward_pause_pipeline <= 1'b0;
            else if ((pipereg_idex_idecode.opcode == rv32i_types::op_load) &
                     (pipereg_ifid_idecode.rs1 != 5'd0) &
                     (pipereg_ifid_idecode.rs1 == pipereg_idex_idecode.rd))
                  mem_forward_pause_pipeline <= 1'b1;
            else if ((pipereg_idex_idecode.opcode == rv32i_types::op_load) &
                     (pipereg_ifid_idecode.rs2 == pipereg_idex_idecode.rd) &
                     (pipereg_ifid_idecode.rs2 != 5'd0) &
                     ((pipereg_ifid_idecode.opcode == rv32i_types::op_br) |
                      (pipereg_ifid_idecode.opcode == rv32i_types::op_store) |
                      (pipereg_ifid_idecode.opcode == rv32i_types::op_reg)))
                  mem_forward_pause_pipeline <= 1'b1;
            else
                  mem_forward_pause_pipeline <= mem_forward_pause_pipeline;
      end
end

always_comb begin

      run_divider = (pipereg_idex_idecode.opcode == rv32i_types::op_reg)
                    & (pipereg_idex_idecode.funct7 == 7'b0000001)
                    & ((pipereg_idex_idecode.funct3 == div) |
                      (pipereg_idex_idecode.funct3 == divu) |
                      (pipereg_idex_idecode.funct3 == rem) |
                      (pipereg_idex_idecode.funct3 == remu));

      run_multiplier = (pipereg_idex_idecode.opcode == rv32i_types::op_reg)
                       & (pipereg_idex_idecode.funct7 == 7'b0000001)
                       & ((pipereg_idex_idecode.funct3 == mul) |
                          (pipereg_idex_idecode.funct3 == mulh) |
                          (pipereg_idex_idecode.funct3 == mulhsu) |
                          (pipereg_idex_idecode.funct3 == mulhu));

      // assign forwarding itf signals
      fitf.idex_inst_decode =  pipereg_idex_idecode;
      fitf.exmem_inst_decode = pipereg_exmem_idecode;
      fitf.memwb_inst_decode = pipereg_memwb_idecode;


      // calcualte if we need to pause (if we're waiting on data from memory)
      if (icache_read & (~icache_resp)) pause_pipeline = 1'b1; // waiting on icache
      else if ((dcache_read | dcache_write) & (~dcache_resp))  pause_pipeline = 1'b1; // waiting on dcache
      else if (mem_forward_pause_pipeline) pause_pipeline = 1'b1;  //pause for memory forwarding
      else if (run_divider & ~divider_done) pause_pipeline = 1'b1; // pause to wait for division unit
      else if (run_multiplier & ~multiplier_done) pause_pipeline = 1'b1; // pause to wait for multiplication unit
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
assign pipe_rst_ifid = rst;
assign pipe_load_ifid = ~pause_pipeline && ~(pipereg_idex_idecode.opcode == op_jalr)&& ~(pipereg_exmem_idecode.opcode == op_jalr);
// holds instruction data for current instruction
register #(.width(192))
pipe_ifid_idecode (
      .clk(clk),
      .rst(pipe_rst_ifid),
      .load(pipe_load_ifid),
      .in(decode(icache_rdata)),
      .out(pipereg_ifid_idecode)
);
// holds PC value for current instruction
register #(.width(32))
pipe_ifid_pc (
      .clk(clk),
      .rst(pipe_rst_ifid),
      .load(pipe_load_ifid),
      .in(pc_module_out),
      .out(pipereg_ifid_pc_out)
);
//taken 
register #(.width(1))
pipe_ifid_taken (
      .clk(clk),
      .rst(pipe_rst_ifid),
      .load(pipe_load_ifid),
      .in(taken),
      .out(pipereg_ifid_taken)
);


// ID / EX Registers
assign pipe_rst_idex = rst;
assign pipe_load_idex = ~pause_pipeline && ~(pipereg_idex_idecode.opcode == op_jalr) && ~(pipereg_exmem_idecode.opcode == op_jalr);
// holds the decoded instruction
register #(.width(192))
pipe_idex_idecode (
      .clk(clk),
      .rst(pipe_rst_idex),
      .load(pipe_load_idex),
      .in(pipereg_ifid_idecode),
      .out(pipereg_idex_idecode)
);
// control word
ctrl_word_register
pipe_idex_ctrl_word (
      .clk(clk),
      .rst(pipe_rst_idex),
      .load(pipe_load_idex),
      .in(idex_ctrl_word),
      .out(pipereg_idex_ctrl_word)
);
// PC
register #(.width(32))
pipe_idex_pc (
      .clk(clk),
      .rst(pipe_rst_idex),
      .load(pipe_load_idex),
      .in(pipereg_ifid_pc_out),
      .out(pipereg_idex_pc_out)
);
// rs1 out
register #(.width(32))
pipe_idex_rs1_out (
      .clk(clk),
      .rst(pipe_rst_idex),
      .load(pipe_load_idex),
      .in(regfile_rs1_out),
      .out(pipereg_idex_rs1_out)
);
// rs2 out
register #(.width(32))
pipe_idex_rs2_out (
      .clk(clk),
      .rst(pipe_rst_idex),
      .load(pipe_load_idex),
      .in(regfile_rs2_out),
      .out(pipereg_idex_rs2_out)
);
//taken 
register #(.width(1))
pipe_idex_taken (
      .clk(clk),
      .rst(pipe_rst_idex),
      .load(pipe_load_idex),
      .in(pipereg_ifid_taken),
      .out(pipereg_idex_taken)
);

assign flush = (~correct && ~pipereg_idex_flush) ||
      (~pipereg_exmem_correct && ~pipereg_exmem_flush) ||
      ((pipereg_idex_idecode.opcode == op_jal || pipereg_idex_idecode.opcode == op_jalr) && ~pipereg_idex_flush) ||
      ((pipereg_exmem_idecode.opcode == op_jal || pipereg_exmem_idecode.opcode == op_jalr) && ~pipereg_exmem_flush);

register #(.width(1))
pipe_idex_flush (
      .clk(clk),
      .rst(pipe_rst_idex),
      .load(pipe_load_idex),
      .in(flush),
      .out(pipereg_idex_flush)
);


// EX/MEM Registers
assign pipe_rst_exmem = rst;
assign pipe_load_exmem = ~pause_pipeline && ~(pipereg_idex_idecode.opcode == op_jalr) && ~(pipereg_exmem_idecode.opcode == op_jalr);
//rs2 out
register #(.width(32))
pipe_exmem_rs2_out (
      .clk(clk),
      .rst(pipe_rst_exmem),
      .load(pipe_load_exmem),
      .in(rs2mux_out),
      .out(pipereg_exmem_rs2_out)
);
// alu output
register #(.width(32))
pipe_exmem_alu (
      .clk(clk),
      .rst(pipe_rst_exmem),
      .load(pipe_load_exmem),
      .in(aluresmux_out),
      .out(pipe_exmem_alu_out)
);
// instruction data
register #(.width(192))
pipe_exmem_decode (
      .clk(clk),
      .rst(pipe_rst_exmem),
      .load(pipe_load_exmem),
      .in(pipereg_idex_idecode),
      .out(pipereg_exmem_idecode)
);
// branch enable
register #(.width(32))
pipe_exmem_br_en (
      .clk(clk),
      .rst(pipe_rst_exmem),
      .load(pipe_load_exmem),
      .in({31'd0, br_en_out}),
      .out(pipereg_exmem_br_en_out)
);
// control word
ctrl_word_register
pipe_exmem_ctrl_word(
      .clk(clk),
      .rst(pipe_rst_exmem),
      .load(pipe_load_exmem),
      .in(pipereg_idex_ctrl_word),
      .out(pipereg_exmem_ctrl_word)
);

// PC
register #(.width(32))
pipe_exmem_pc (
      .clk(clk),
      .rst(pipe_rst_exmem),
      .load(pipe_load_exmem),
      .in(pipereg_idex_pc_out),
      .out(pipereg_exmem_pc_out)
);

//Correct branch prediction
register #(.width(1))
pipe_exmem_correct (
      .clk(clk),
      .rst(pipe_rst_exmem),
      .load(pipe_load_exmem),
      .in(correct),
      .out(pipereg_exmem_correct)
);
register #(.width(1))
pipe_exmem_flush (
      .clk(clk),
      .rst(pipe_rst_exmem),
      .load(pipe_load_exmem),
      .in(pipereg_idex_flush),
      .out(pipereg_exmem_flush)
);



// MEM / WB Registers
assign pipe_load_memwb = ~pause_pipeline && ~(pipereg_idex_idecode.opcode == op_jalr) && ~(pipereg_exmem_idecode.opcode == op_jalr);
// alu output
register #(.width(32))
pipe_memwb_alu (
      .clk(clk),
      .rst(rst),
      .load(pipe_load_memwb),
      .in(pipe_exmem_alu_out),
      .out(pipe_memwb_alu_out)
);
// instruction data
register #(.width(192))
pipe_memwb_idecode (
      .clk(clk),
      .rst(rst),
      .load(pipe_load_memwb),
      .in(pipereg_exmem_idecode),
      .out(pipereg_memwb_idecode)
);
// memory data register out
register #(.width(32))
pipe_memwb_mdr_out (
      .clk(clk),
      .rst(rst),
      .load(pipe_load_memwb),
      .in(mem_rdata),
      .out(pipereg_memwb_mdr_out)
);
// control word
ctrl_word_register
pipe_memwb_ctrl_word (
      .clk(clk),
      .rst(rst),
      .load(pipe_load_memwb),
      .in(pipereg_exmem_ctrl_word),
      .out(pipereg_memwb_ctrl_word)
);
// branch enable
register #(.width(32))
pipe_memwb_br_en (
      .clk(clk),
      .rst(rst),
      .load(pipe_load_memwb),
      .in(pipereg_exmem_br_en_out),
      .out(pipereg_memwb_br_en)
);

// PC
register #(.width(32))
pipe_memwb_pc (
      .clk(clk),
      .rst(rst),
      .load(pipe_load_memwb),
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
      .load(~pause_pipeline),          //don't always load the pc
      .in(pc_in),                      //modified with branch prediction
      .out(pc_module_out)
);

// ID - decode
regfile regfile(
      .clk(clk),
      .rst(rst),
      .load(pipereg_memwb_ctrl_word.load_regfile & pipe_load_memwb),
      .in((pipereg_memwb_idecode.rd == 5'd0) ? 32'd0 : regfilemux_out),
      .src_a(pipereg_ifid_idecode.rs1),
      .src_b(pipereg_ifid_idecode.rs2),
      .dest(pipereg_memwb_idecode.rd),
      .reg_a(regfile_rs1_out),
      .reg_b(regfile_rs2_out)
);

assign opcode = rv32i_opcode'(pipereg_ifid_idecode.opcode);
assign funct3 = pipereg_ifid_idecode.funct3;
assign funct7 = pipereg_ifid_idecode.funct7;

btb btb(
    .clk(clk),
    .r_pc(pc_module_out), //changed from pipereg_ifid_pc_out to pc_module_out so we get pc from IF
    .w_pc(pipereg_idex_pc_out),
    .load(is_br && ~pause_pipeline),
    .read(~pause_pipeline),
    .target_in(alu_module_out),
    .target_out(target),
    .btb_hit(btb_hit)
);

assign correct = (pipereg_idex_taken == br_en_out && is_br && ~pipereg_idex_flush);
bht local_bht(
    .clk(clk),
    .read(~pause_pipeline),
    .load(~pause_pipeline),
    .r_idx(pipereg_ifid_pc_out[9:0]),
    .w_idx(pipereg_idex_pc_out[9:0]),
    .taken(pipereg_idex_taken),
    .correct(correct),
    .prediction(taken)
);
assign prediction = btb_hit && taken && ~(br_en_out && pipereg_idex_idecode.opcode == op_br && ~pipereg_idex_flush);

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

multiplier multiplier (
      .clk(clk),
      .a(rs1mux_out),
      .b(rs2mux_out),
      .start(run_multiplier),
      .sign(muldiv_funct3_t ' (pipereg_idex_idecode.funct3)),
      .product(multiplier_out),
      .done(multiplier_done)
);

divider divider (
      .clk(clk),
      .rst(rst),
      .sign(muldiv_funct3_t ' (pipereg_idex_idecode.funct3)),
      .start(run_divider),
      .numerator(rs1mux_out),
      .denominator(rs2mux_out),
      .quotient(quotient_out),
      .remainder(remainder_out),
      .done(divider_done)
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
//
// muxes cannot be organized by stages because
// we're using blocking assignments, and many muxes
// rely on the output of muxes before it, and these
// assignments don't align with the pipeline stages.

muldiv_funct3_t idex_funct3;
rv32i_opcode idex_opcode;
logic [6:0] idex_funct7;
assign idex_funct3 = muldiv_funct3_t ' (pipereg_idex_idecode.funct3);
assign idex_opcode = pipereg_idex_idecode.opcode;
assign idex_funct7 = pipereg_idex_idecode.funct7;


always_comb begin : MUXES
      // Set defaults
      pcmux_out = 32'bx;
      alumux1_out = 32'bx;
      alumux2_out = 32'bx;
      regfilemux_out = 32'bx;
      cmpmux_out = 32'bx;
      dcachemux_out = 32'bx;
      bpmux_out = 32'bx;

      //Branch predictor
      
      unique case ({not_correct, is_taken})
            2'b00: bpmux_out = pc_module_out + 32'd4; //not taken correct
            2'b01: bpmux_out = pc_module_out + 32'd4; //taken correct
            2'b10: bpmux_out = alu_module_out; //not taken incorrect
            2'b11: bpmux_out = pipereg_idex_pc_out + 32'd4; //taken incorrect
            default: bpmux_out = pc_module_out + 32'd4;
      endcase

      //Modified with branch prediction
      unique case ({is_jalr, is_jal})
            2'b00: pcmux_out = bpmux_out;
            2'b01: pcmux_out = alu_module_out;
            2'b10: pcmux_out = {alu_module_out[31:2], 2'b0};
            2'b11: pcmux_out = bpmux_out; //Shouldnt be here
            default: pcmux_out = bpmux_out;
      endcase

      //Branch predictor
      unique case (prediction)
            1'b0: pc_in = pcmux_out;
            1'b1: pc_in = target;
            default: pc_in = pcmux_out;
      endcase

      // regfile mux
      unique case (pipereg_memwb_ctrl_word.regfilemux_sel)
            regfilemux::alu_out: regfilemux_out = pipe_memwb_alu_out;
            regfilemux::br_en: regfilemux_out = pipereg_memwb_br_en;
            regfilemux::u_imm: regfilemux_out = pipereg_memwb_idecode.u_imm;
            regfilemux::MDRreg_out: regfilemux_out = pipereg_memwb_mdr_out;
            regfilemux::pc_plus4: regfilemux_out = pipereg_memwb_pc_out + 4;
            //default: `BAD_MUX_SEL;
      endcase

      // forwarding mux for the mem stage
      unique case (dcachemux_forwarding_sel)
            dcachemux::rs2_out: dcachemux_out = mem_wdata;
            dcachemux::regfilemux_out: dcachemux_out = regfilemux_out;
            default: dcachemux_out = mem_wdata;
      endcase
      //dcachemux_out = mem_wdata;

      // rs1 forwarding mux
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

      // rs2 forwarding mux
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

      // alumux 1 select
      unique case (pipereg_idex_ctrl_word.alumux1_sel)
            alumux::rs1_out: alumux1_out = rs1mux_out;
            alumux::pc_out: alumux1_out = pipereg_idex_pc_out;
            //default: `BAD_MUX_SEL;
      endcase

      // alu mux 2
      unique case (pipereg_idex_ctrl_word.alumux2_sel)
            alumux::rs2_out: alumux2_out = rs2mux_out;
            alumux::i_imm: alumux2_out = pipereg_idex_idecode.i_imm;
            alumux::u_imm: alumux2_out = pipereg_idex_idecode.u_imm;
            alumux::b_imm: alumux2_out = pipereg_idex_idecode.b_imm;
            alumux::s_imm: alumux2_out = pipereg_idex_idecode.s_imm;
            alumux::j_imm: alumux2_out = pipereg_idex_idecode.j_imm;
            //default: `BAD_MUX_SEL;
      endcase

      // compare mux
      unique case (pipereg_idex_ctrl_word.cmpmux_sel)
            cmpmux::rs2_out: cmpmux_out = rs2mux_out;
            cmpmux::i_imm: cmpmux_out = pipereg_idex_idecode.i_imm;
            //default: `BAD_MUX_SEL;
      endcase

      // alu result mux output
      unique case ({idex_opcode, idex_funct3, idex_funct7})
            {op_reg, mul, 7'b0000001}: aluresmux_out = multiplier_out[31:0];
            {op_reg, mulh, 7'b0000001}: aluresmux_out = multiplier_out[63:32];
            {op_reg, mulhsu, 7'b0000001}: aluresmux_out = multiplier_out[63:32];
            {op_reg, mulhu, 7'b0000001}: aluresmux_out = multiplier_out[63:32];
            {op_reg, div, 7'b0000001}: aluresmux_out = quotient_out;
            {op_reg, divu, 7'b0000001}: aluresmux_out = quotient_out;
            {op_reg, rem, 7'b0000001}: aluresmux_out = remainder_out;
            {op_reg, remu, 7'b0000001}: aluresmux_out = remainder_out;
            default: aluresmux_out = alu_module_out;
      endcase

end

//****************************************************


endmodule: datapath
