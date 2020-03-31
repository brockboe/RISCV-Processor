module mp3_tb;
`timescale 1ns/10ps

/********************* Do not touch for proper compilation *******************/
// Instantiate Interfaces
tb_itf itf();
rvfi_itf rvfi(itf.clk, itf.rst);

// Instantiate Testbench
source_tb tb(
    .magic_mem_itf(itf),
    .mem_itf(itf),
    .sm_itf(itf),
    .tb_itf(itf),
    .rvfi(rvfi)
);
/****************************** End do not touch *****************************/

/************************ Signals necessary for monitor **********************/

assign itf.inst_read = 1'b1;

// This section not required until CP3

assign rvfi.commit = 1'b1;                                        // Set high when a valid instruction is modifying regfile or PC

logic halt0, halt1;
// assign halt0 = (dut.d.pc_module_out == dut.d.pcmux_out + 12);
assign halt0 = (dut.d.pipereg_exmem_pc_out == dut.d.pcmux_out);
always_ff @( posedge itf.clk ) begin // Wait one cycle for the last instruction to finish write back.
      halt1 <= halt0;
end
assign rvfi.halt = halt1;      // Set high when you detect an infinite loop

initial rvfi.order = 0;
always @(posedge itf.clk iff rvfi.commit) rvfi.order <= rvfi.order + 1; // Modify for OoO
/**************************** End RVFIMON signals ****************************/

/********************* Assign Shadow Memory Signals Here *********************/
// This section not required until CP2
/*********************** End Shadow Memory Assignments ***********************/

// Set this to the proper value
assign itf.registers = dut.d.regfile.data;

initial begin
      itf.path_mb.put("memory.lst");
      itf.rst = 1'b1;
      repeat (5) @(posedge itf.clk);
      itf.rst = 1'b0;
end

/*********************** Instantiate your design here ************************/
mp3 dut(
      .clk(itf.clk),
      .rst(itf.rst),

      .icache_address(itf.inst_addr),
      .icache_wdata(),
      .icache_rdata(itf.inst_rdata),
      .icache_read(),
      .icache_write(),

      .dcache_address(itf.data_addr),
      .dcache_wdata(itf.data_wdata),
      .dcache_rdata(itf.data_rdata),
      .dcache_read(itf.data_read),
      .dcache_write(itf.data_write),
      .dcache_mbe(itf.data_mbe)
);

logic [31:0] pc_val;
assign pc_val = itf.inst_addr;

/***************************** End Instantiation *****************************/

endmodule
