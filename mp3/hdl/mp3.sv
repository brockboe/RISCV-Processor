
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

// Top level module
module mp3
(
      input logic clk,
      input logic rst,

      // physical memory signals
      output logic [63:0] burst_o,
      input logic [63:0] burst_i,
      output logic [31:0] address_o,
      output logic read_o,
      output logic write_o,
      input logic resp_i
);

rv32i_opcode opcode;
logic [2:0] funct3;
logic [6:0] funct7;
ctrl_word ctrl;

// cache connectors - specified here so quartus
// doesn't complain or get confused
logic icache_resp;
logic dcache_resp;

logic [31:0] icache_address;
logic [31:0] icache_rdata;
logic icache_read;

logic [31:0] dcache_address;
logic [31:0] dcache_wdata;
logic [3:0] dcache_mbe;
logic [31:0] dcache_rdata;
logic dcache_read;
logic dcache_write;

//TODO: When updating forwarding, change the control signals
control_itf::control c_temp;

// Instantiate the datapath
datapath d (
      .clk(clk),
      .rst(rst),
      .opcode(opcode),
      .funct3(funct3),
      .funct7(funct7),
      .idex_ctrl_word(ctrl),        //TODO: FILL ME IN!

      .icache_read(icache_read),
      .icache_address(icache_address),
      .icache_rdata(icache_rdata),
      .icache_resp(icache_resp),

      .dcache_read(dcache_read),
      .dcache_write(dcache_write),
      .dcache_mbe(dcache_mbe),
      .dcache_address(dcache_address),
      .dcache_wdata(dcache_wdata),
      .dcache_rdata(dcache_rdata),
      .dcache_resp(dcache_resp)
);

// generates control signals to propagate
// down the pipeline
control_rom ctrl_rom (
      .opcode(opcode),
      .funct3(funct3),
      .funct7(funct7),
      .idex_ctrl_word(ctrl)
);

// memory subsystem
mp3_cache cache (
      .clk(clk),
      .rst(rst),

      .icache_read(icache_read),
      .icache_address(icache_address),
      .icache_rdata(icache_rdata),
      .icache_resp(icache_resp),

      .dcache_read(dcache_read),
      .dcache_write(dcache_write),
      .dcache_mbe(dcache_mbe),
      .dcache_address(dcache_address),
      .dcache_wdata(dcache_wdata),
      .dcache_rdata(dcache_rdata),
      .dcache_resp(dcache_resp),

      .pmem_resp(resp_i),
      .pmem_rdata(burst_i),
      .pmem_read(read_o),
      .pmem_write(write_o),
      .pmem_address(address_o),
      .pmem_wdata(burst_o)
);

endmodule
