import dcachemux::*;
import rv32i_types::*;

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

assign rvfi.halt = (rvfi.pc_wdata == rvfi.pc_rdata) && rvfi.commit;      // Set high when you detect an infinite loop
initial rvfi.order = 0;
always @(posedge itf.clk iff rvfi.commit) rvfi.order <= rvfi.order + 1; // Modify for OoO

logic [31:0] memwb_pc_wdata;
logic [31:0] memwb_mem_addr;
logic [3:0] memwb_mem_wmask, memwb_mem_rmask;
logic [31:0] memwb_mem_wdata;
logic [31:0] memwb_mem_rdata;
logic [31:0] exmem_rs1_rdata, exmem_rs2_rdata, memwb_rs1_rdata, memwb_rs2_rdata;
logic pause_pipeline;

// initial $monitor(
//       "time: %0t; ", $time,
//       // "btb_hit: %d; ", dut.d.btb_hit,
//       // "branch_go: %d; ", dut.d.branch_go,
//       // "\n",
//       // "alu_module_out: %x; ", dut.d.alu_module_out,
//       // "target: %x; ", dut.d.target,
//       // "\n",
//       // "pcmux_out: %x; ", dut.d.pcmux_out,
//       // "pc_module_out: %x; ", dut.d.pc_module_out,
//       // "\n",
//       // "pipereg_ifid_pc_out: %x; ", dut.d.pipereg_ifid_pc_out,
//       // "pipereg_idex_pc_out: %x; ", dut.d.pipereg_idex_pc_out,
//       // "pipereg_exmem_pc_out: %x; ", dut.d.pipereg_exmem_pc_out,
//       // "pipereg_memwb_pc_out: %x; ", dut.d.pipereg_memwb_pc_out,
//       // "\n",
//       "btb_counter: %d; ",dut.d.btb_counter,
//       // "pipereg_exmem_idecode.opcode == op_br: %d", dut.d.pipereg_exmem_idecode.opcode == op_br,
// );


assign pause_pipeline = dut.d.pause_pipeline;
logic delay_br_go;
always_ff @(posedge itf.clk) begin
      if (~pause_pipeline) begin
            exmem_rs1_rdata <= dut.d.rs1mux_out;
            exmem_rs2_rdata <= dut.d.rs2mux_out;
            delay_br_go <= dut.d.branch_go;
      end
      if (~pause_pipeline) begin
            memwb_pc_wdata <= (delay_br_go)? dut.d.pc_module_out : (dut.d.pipereg_idex_pc_out);
            memwb_rs1_rdata <= exmem_rs1_rdata;
            //memwb_rs2_rdata <= exmem_rs2_rdata;
            unique case(dut.d.dcachemux_forwarding_sel)
                  dcachemux::rs2_out: memwb_rs2_rdata <= dut.d.pipereg_exmem_rs2_out;
                  dcachemux::regfilemux_out: memwb_rs2_rdata <= dut.d.dcachemux_out;
            endcase
            memwb_mem_addr <= dut.dcache_address;
            memwb_mem_rmask <= (dut.d.pipereg_exmem_ctrl_word.dcache_read)? dut.dcache_mbe : '0;
            memwb_mem_wmask <= (dut.d.pipereg_exmem_ctrl_word.dcache_write)? dut.dcache_mbe : '0;
            memwb_mem_wdata <= dut.dcache_wdata;
            memwb_mem_rdata <= dut.dcache_rdata;
      end
end

always_comb begin // rvfi signals
//     logic halt;
      if (dut.d.pipereg_memwb_idecode.opcode) begin
            rvfi.commit = (~pause_pipeline);
      end else rvfi.commit = 1'b0;
//     logic [63:0] order;
      rvfi.inst = {dut.d.pipereg_memwb_idecode.u_imm[31:12], dut.d.pipereg_memwb_idecode.rd, dut.d.pipereg_memwb_idecode.opcode};
      rvfi.trap = 1'b0;
      rvfi.rs1_addr = dut.d.pipereg_memwb_idecode.rs1;
      rvfi.rs2_addr = dut.d.pipereg_memwb_idecode.rs2;
      rvfi.rs1_rdata = memwb_rs1_rdata;
      rvfi.rs2_rdata = memwb_rs2_rdata;
      rvfi.load_regfile = dut.d.pipereg_memwb_ctrl_word.load_regfile;
      rvfi.rd_addr = dut.d.pipereg_memwb_idecode.rd;
      rvfi.rd_wdata = dut.d.regfile.in;
      rvfi.pc_rdata = dut.d.pipereg_memwb_pc_out;
      rvfi.pc_wdata = memwb_pc_wdata;
      rvfi.mem_addr = memwb_mem_addr;
      rvfi.mem_rmask = memwb_mem_rmask;
      rvfi.mem_wmask = memwb_mem_wmask;
      //rvfi.mem_rdata = dut.d.pipereg_memwb_mdr_out;
      rvfi.mem_rdata = memwb_mem_rdata;
      rvfi.mem_wdata = memwb_mem_wdata;

//     logic [15:0] errcode;
end

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

/***************************** End Instantiation *****************************/

/**************************** Performance Counters ***************************/
int ewb_count;
int l2_hit, l2_miss;
int dcache_hit, dcache_miss;
int icache_hit, icache_miss;

assign itf.dcache_hit = dut.cache.dcache.control.hit_count;
assign itf.dcache_miss = dut.cache.dcache.control.miss_count;
assign itf.icache_hit = dut.cache.icache.control.hit_count;
assign itf.icache_miss = dut.cache.icache.control.miss_count;

assign itf.btb_counter = dut.d.btb_counter;
assign itf.br_counter = dut.d.br_counter;
assign itf.l2_hit_counter = dut.cache.l2.control.hit_count;
assign itf.l2_miss_counter = dut.cache.l2.control.miss_count;
assign itf.ewb_counter = dut.cache.buffer.eviction_write_counter;

endmodule
