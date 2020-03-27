
// Top level MP3 module
// Go ZBA!!!

// import different libraries, just to be safe!
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


module mp3
(
      input logic clk,
      input logic rst,

      // icache signals
      output logic [31:0] icache_address, //data and address come from datapath
      output logic [31:0] icache_wdata,
      input logic [31:0] icache_rdata,
      output logic icache_read,           //read and write come from control module
      output logic icache_write,

      //dcache signals
      output logic [31:0] dcache_address, //data and address come from datapath
      output logic [31:0] dcache_wdata,
      input logic [31:0] dcache_rdata,
      output logic dcache_read,           //read and write come from control module
      output logic dcache_write
);

rv32i_opcode opcode;
logic [2:0] funct3;
logic [6:0] funct7;
ctrl_word ctrl;
control fwd_ctrl;

assign fwd_ctrl.pipe_load_ifid  = 1'b1;
assign fwd_ctrl.pipe_load_idex  = 1'b1;
assign fwd_ctrl.pipe_load_exmem = 1'b1;
assign fwd_ctrl.pipe_load_memwb = 1'b1;

assign fwd_ctrl.pipe_rst_ifid  = 1'b0;
assign fwd_ctrl.pipe_rst_idex  = 1'b0;
assign fwd_ctrl.pipe_rst_exmem = 1'b0;
assign fwd_ctrl.pipe_rst_memwb = 1'b0;

assign icache_write = 1'b0; // (unless we need to handle self-modifying code)

// Instantiate the datapath
datapath d (
      .clk(clk),
      .rst(rst),
      .opcode(opcode),
      .funct3(funct3),
      .funct7(funct7),
      .control(fwd_ctrl),
      .idex_ctrl_word(ctrl),      //TODO: FILL ME IN!

      .icache_read(icache_read),
      .icache_address(icache_address),
      .icache_wdata(icache_wdata),
      .icache_rdata(icache_rdata),

      .dcache_read(dcache_read),
      .dcache_write(dcache_write),
      .dcache_address(dcache_address),
      .dcache_wdata(dcache_wdata),
      .dcache_rdata(dcache_rdata)
);

control_rom ctrl_rom (
      .opcode(opcode),
      .funct3(funct3),
      .funct7(funct7),
      .idex_ctrl_word(ctrl)
);

endmodule
