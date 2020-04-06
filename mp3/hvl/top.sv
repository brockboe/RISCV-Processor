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

// assign itf.inst_read = 1'b1;

// This section not required until CP3

assign rvfi.commit = 1'b1;                                        // Set high when a valid instruction is modifying regfile or PC

logic halt0, halt1;
// assign halt0 = (dut.d.pc_module_out == dut.d.pcmux_out + 12);
assign halt0 = (dut.d.pipereg_exmem_pc_out == dut.d.pcmux_out) & (~dut.d.pause_pipeline);
always_ff @( posedge itf.clk ) begin // Wait one cycle for the last instruction to finish write back.
      halt1 <= halt0;
end
assign rvfi.halt = halt1;      // Set high when you detect an infinite loop

initial rvfi.order = 0;
always @(posedge itf.clk iff rvfi.commit) rvfi.order <= rvfi.order + 1; // Modify for OoO
/**************************** End RVFIMON signals ****************************/

/********************* Assign Shadow Memory Signals Here *********************/
// This section not required until CP2

// icache signals
assign itf.inst_read = dut.icache_read;
assign itf.inst_addr = dut.icache_address;
assign itf.inst_resp = dut.icache_resp;
assign itf.inst_rdata = dut.icache_rdata;

// dcache signals
assign itf.data_read = dut.dcache_read;
assign itf.data_write = dut.dcache_write;
assign itf.data_mbe = dut.dcache_mbe;
assign itf.data_addr = dut.dcache_address;
assign itf.data_wdata = dut.dcache_wdata;
assign itf.data_resp = dut.dcache_resp;
assign itf.data_rdata = dut.dcache_rdata;

/*********************** End Shadow Memory Assignments ***********************/

// Set this to the proper value
assign itf.registers = dut.d.regfile.data;

initial begin
      itf.rst = 1'b1;
      repeat (5) @(posedge itf.clk);
      itf.rst = 1'b0;
end

/*********************** Instantiate your design here ************************/
mp3 dut(
      .clk(itf.clk),
      .rst(itf.rst),

      .burst_o(itf.mem_wdata),
      .burst_i(itf.mem_rdata),
      .address_o(itf.mem_addr),
      .read_o(itf.mem_read),
      .write_o(itf.mem_write),
      .resp_i(itf.mem_resp)
);

logic [31:0] pc_val;
assign pc_val = itf.inst_addr;

/***************************** End Instantiation *****************************/


endmodule
