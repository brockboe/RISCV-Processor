
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

// Instantiate the datapath
datapath datapath (
      .clk(clk),
      .rst(rst),
      .control(),             //TODO: FILL ME IN!
      .idex_ctrl_word(),      //TODO: FILL ME IN!

      .icache_address(icache_address),
      .icache_wdata(icache_wdata),
      .icache_rdata(icache_rdata),

      .dcache_address(dcache_address),
      .dcache_wdata(dcache_wdata),
      .dcache_rdata(dcache_rdata)
);

endmodule
