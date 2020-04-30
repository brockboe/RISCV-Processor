# AG Report Generated 2020-03-26 16:06
This is a report about mp3 generated for ZBA at 2020-03-26 16:06. The autograder used commit ``22d4024d9ae3`` as a starting point. If you have any questions about this report, please contact the TAs on Piazza.
### Quick Results:
 - Compilation: NO
 - Targeted: 0/1 (0.0%)
### Compilation ![Failure][failure]
You did not succesfully compile. Your report is below.
<details>
<summary>Compilation Report</summary>

```
Info: *******************************************************************
Info: Running Quartus Prime Analysis & Synthesis
    Info: Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition
    Info: Copyright (C) 2018  Intel Corporation. All rights reserved.
    Info: Your use of Intel Corporation's design tools, logic functions 
    Info: and other software and tools, and its AMPP partner logic 
    Info: functions, and any output files from any of the foregoing 
    Info: (including device programming or simulation files), and any 
    Info: associated documentation or information are expressly subject 
    Info: to the terms and conditions of the Intel Program License 
    Info: Subscription Agreement, the Intel Quartus Prime License Agreement,
    Info: the Intel FPGA IP License Agreement, or other applicable license
    Info: agreement, including, without limitation, that your use is for
    Info: the sole purpose of programming logic devices manufactured by
    Info: Intel and sold by Intel or its authorized distributors.  Please
    Info: refer to the applicable agreement for further details.
    Info: Processing started: Thu Mar 26 21:05:48 2020
Info: Command: quartus_map mp3 -c mp3
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Info (20030): Parallel compilation is enabled and will use 4 of the 4 processors detected
Info (12021): Found 1 design units, including 0 entities, in source file hdl/rv32i_types.sv
    Info (12022): Found design unit 1: rv32i_types (SystemVerilog) File: /job/student/hdl/rv32i_types.sv Line: 1
Info (12021): Found 8 design units, including 0 entities, in source file hdl/rv32i_mux_types.sv
    Info (12022): Found design unit 1: pcmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 1
    Info (12022): Found design unit 2: marmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 9
    Info (12022): Found design unit 3: cmpmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 16
    Info (12022): Found design unit 4: alumux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 23
    Info (12022): Found design unit 5: rs1mux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 56
    Info (12022): Found design unit 6: rs2mux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 63
    Info (12022): Found design unit 7: regfilemux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 69
    Info (12022): Found design unit 8: dcachemux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 79
Info (12021): Found 1 design units, including 1 entities, in source file hdl/register.sv
    Info (12023): Found entity 1: register File: /job/student/hdl/register.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/regfile.sv
    Info (12023): Found entity 1: regfile File: /job/student/hdl/regfile.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/pc_reg.sv
    Info (12023): Found entity 1: pc_register File: /job/student/hdl/pc_reg.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/mp3.sv
    Info (12023): Found entity 1: mp3 File: /job/student/hdl/mp3.sv Line: 20
Info (12021): Found 1 design units, including 1 entities, in source file hdl/ir.sv
    Info (12023): Found entity 1: ir File: /job/student/hdl/ir.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/datapath.sv
    Info (12023): Found entity 1: datapath File: /job/student/hdl/datapath.sv Line: 17
Info (12021): Found 1 design units, including 0 entities, in source file hdl/control_itf.sv
    Info (12022): Found design unit 1: control_itf (SystemVerilog) File: /job/student/hdl/control_itf.sv Line: 8
Critical Warning (10191): Verilog HDL Compiler Directive warning at cmp_module.sv(20): text macro "BAD_MUX_SEL_CMP" is undefined File: /job/student/hdl/cmp_module.sv Line: 20
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cmp_module.sv
    Info (12023): Found entity 1: cmp_module File: /job/student/hdl/cmp_module.sv Line: 5
Info (12021): Found 1 design units, including 1 entities, in source file hdl/alu.sv
    Info (12023): Found entity 1: alu File: /job/student/hdl/alu.sv Line: 3
Info (12127): Elaborating entity "mp3" for the top level hierarchy
Warning (10034): Output port "icache_read" at mp3.sv(29) has no driver File: /job/student/hdl/mp3.sv Line: 29
Warning (10034): Output port "icache_write" at mp3.sv(30) has no driver File: /job/student/hdl/mp3.sv Line: 30
Warning (10034): Output port "dcache_read" at mp3.sv(36) has no driver File: /job/student/hdl/mp3.sv Line: 36
Warning (10034): Output port "dcache_write" at mp3.sv(38) has no driver File: /job/student/hdl/mp3.sv Line: 38
Info (12128): Elaborating entity "datapath" for hierarchy "datapath:datapath" File: /job/student/hdl/mp3.sv Line: 54
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(49): object "dcachemux_out" assigned a value but never read File: /job/student/hdl/datapath.sv Line: 49
Warning (10034): Output port "icache_address" at datapath.sv(30) has no driver File: /job/student/hdl/datapath.sv Line: 30
Warning (10034): Output port "icache_wdata" at datapath.sv(31) has no driver File: /job/student/hdl/datapath.sv Line: 31
Warning (10034): Output port "dcache_address" at datapath.sv(34) has no driver File: /job/student/hdl/datapath.sv Line: 34
Warning (10034): Output port "dcache_wdata" at datapath.sv(35) has no driver File: /job/student/hdl/datapath.sv Line: 35
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:pipe_ifid_icache_rdata" File: /job/student/hdl/datapath.sv Line: 106
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:pipe_idex_idecode" File: /job/student/hdl/datapath.sv Line: 128
Info (12128): Elaborating entity "register" for hierarchy "datapath:datapath|register:pipe_idex_ctrl_word" File: /job/student/hdl/datapath.sv Line: 137
Info (12128): Elaborating entity "pc_register" for hierarchy "datapath:datapath|pc_register:pc" File: /job/student/hdl/datapath.sv Line: 280
Info (12128): Elaborating entity "regfile" for hierarchy "datapath:datapath|regfile:regfile" File: /job/student/hdl/datapath.sv Line: 294
Info (12128): Elaborating entity "alu" for hierarchy "datapath:datapath|alu:alu" File: /job/student/hdl/datapath.sv Line: 303
Info (12128): Elaborating entity "cmp_module" for hierarchy "datapath:datapath|cmp_module:cmp" File: /job/student/hdl/datapath.sv Line: 310
Warning (12241): 3 hierarchies have connectivity warnings - see the Connectivity Checks report folder
Warning (13024): Output pins are stuck at VCC or GND
    Warning (13410): Pin "icache_address[0]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[1]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[2]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[3]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[4]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[5]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[6]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[7]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[8]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[9]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[10]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[11]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[12]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[13]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[14]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[15]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[16]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[17]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[18]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[19]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[20]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[21]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[22]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[23]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[24]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[25]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[26]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[27]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[28]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[29]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[30]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_address[31]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 26
    Warning (13410): Pin "icache_wdata[0]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[1]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[2]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[3]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[4]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[5]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[6]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[7]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[8]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[9]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[10]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[11]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[12]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[13]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[14]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[15]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[16]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[17]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[18]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[19]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[20]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[21]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[22]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[23]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[24]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[25]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[26]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[27]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[28]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[29]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[30]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_wdata[31]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 27
    Warning (13410): Pin "icache_read" is stuck at GND File: /job/student/hdl/mp3.sv Line: 29
    Warning (13410): Pin "icache_write" is stuck at GND File: /job/student/hdl/mp3.sv Line: 30
    Warning (13410): Pin "dcache_address[0]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[1]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[2]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[3]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[4]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[5]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[6]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[7]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[8]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[9]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[10]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[11]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[12]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[13]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[14]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[15]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[16]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[17]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[18]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[19]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[20]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[21]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[22]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[23]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[24]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[25]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[26]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[27]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[28]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[29]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[30]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_address[31]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 33
    Warning (13410): Pin "dcache_wdata[0]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[1]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[2]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[3]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[4]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[5]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[6]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[7]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[8]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[9]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[10]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[11]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[12]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[13]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[14]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[15]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[16]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[17]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[18]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[19]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[20]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[21]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[22]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[23]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[24]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[25]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[26]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[27]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[28]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[29]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[30]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_wdata[31]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 34
    Warning (13410): Pin "dcache_read" is stuck at GND File: /job/student/hdl/mp3.sv Line: 36
    Warning (13410): Pin "dcache_write" is stuck at GND File: /job/student/hdl/mp3.sv Line: 38
Info (16010): Generating hard_block partition "hard_block:auto_generated_inst"
    Info (16011): Adding 0 node(s), including 0 DDIO, 0 PLL, 0 transceiver and 0 LCELL
Warning (21074): Design contains 66 input pin(s) that do not drive logic
    Warning (15610): No output dependent on input pin "clk" File: /job/student/hdl/mp3.sv Line: 22
    Warning (15610): No output dependent on input pin "rst" File: /job/student/hdl/mp3.sv Line: 23
    Warning (15610): No output dependent on input pin "icache_rdata[0]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[1]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[2]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[3]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[4]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[5]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[6]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[7]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[8]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[9]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[10]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[11]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[12]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[13]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[14]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[15]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[16]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[17]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[18]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[19]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[20]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[21]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[22]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[23]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[24]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[25]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[26]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[27]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[28]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[29]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[30]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "icache_rdata[31]" File: /job/student/hdl/mp3.sv Line: 28
    Warning (15610): No output dependent on input pin "dcache_rdata[0]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[1]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[2]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[3]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[4]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[5]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[6]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[7]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[8]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[9]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[10]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[11]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[12]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[13]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[14]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[15]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[16]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[17]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[18]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[19]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[20]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[21]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[22]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[23]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[24]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[25]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[26]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[27]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[28]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[29]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[30]" File: /job/student/hdl/mp3.sv Line: 35
    Warning (15610): No output dependent on input pin "dcache_rdata[31]" File: /job/student/hdl/mp3.sv Line: 35
Info (21057): Implemented 198 device resources after synthesis - the final resource count might be different
    Info (21058): Implemented 66 input pins
    Info (21059): Implemented 132 output pins
Info: Quartus Prime Analysis & Synthesis was successful. 0 errors, 212 warnings
    Info: Peak virtual memory: 1178 megabytes
    Info: Processing ended: Thu Mar 26 21:06:14 2020
    Info: Elapsed time: 00:00:26
    Info: Total CPU time (on all processors): 00:00:40
Info: *******************************************************************
Info: Running Quartus Prime Shell
    Info: Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition
    Info: Copyright (C) 2018  Intel Corporation. All rights reserved.
    Info: Your use of Intel Corporation's design tools, logic functions 
    Info: and other software and tools, and its AMPP partner logic 
    Info: functions, and any output files from any of the foregoing 
    Info: (including device programming or simulation files), and any 
    Info: associated documentation or information are expressly subject 
    Info: to the terms and conditions of the Intel Program License 
    Info: Subscription Agreement, the Intel Quartus Prime License Agreement,
    Info: the Intel FPGA IP License Agreement, or other applicable license
    Info: agreement, including, without limitation, that your use is for
    Info: the sole purpose of programming logic devices manufactured by
    Info: Intel and sold by Intel or its authorized distributors.  Please
    Info: refer to the applicable agreement for further details.
    Info: Processing started: Thu Mar 26 21:06:15 2020
Info: Command: quartus_sh -t /opt/altera/quartus/common/tcl/internal/nativelink/qnativesim.tcl --gen_script --rtl_sim mp3 mp3
Info: Quartus(args): --gen_script --rtl_sim mp3 mp3
Info: Info: Start Nativelink Simulation process
Info: Info: NativeLink has detected Verilog design -- Verilog simulation models will be used
Info: Info: Starting NativeLink simulation with ModelSim-Altera software
Info: Info: Generated ModelSim-Altera script file /job/student/simulation/modelsim/mp3_run_msim_rtl_verilog.do File: /job/student/simulation/modelsim/mp3_run_msim_rtl_verilog.do Line: 0
Info: Info: NativeLink simulation flow was successful
Info: Info: For messages from NativeLink scripts, check the file /job/student/mp3_nativelink_simulation.rpt File: /job/student/mp3_nativelink_simulation.rpt Line: 0
Info (23030): Evaluation of Tcl script /opt/altera/quartus/common/tcl/internal/nativelink/qnativesim.tcl was successful
Info: Quartus Prime Shell was successful. 0 errors, 0 warnings
    Info: Peak virtual memory: 788 megabytes
    Info: Processing ended: Thu Mar 26 21:06:17 2020
    Info: Elapsed time: 00:00:02
    Info: Total CPU time (on all processors): 00:00:01
Reading pref.tcl

# 10.5b

ModelSim> transcript on
ModelSim> > > if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
ModelSim> vlib rtl_work
ModelSim> vmap work rtl_work
# Model Technology ModelSim - Intel FPGA Edition vmap 10.5b Lib Mapping Utility 2016.10 Oct  5 2016
# vmap work rtl_work 
# Modifying /opt/altera/modelsim_ase/linuxaloem/../modelsim.ini
ModelSim> 
> 
vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_mux_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:19 on Mar 26,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/rv32i_mux_types.sv 
# -- Compiling package pcmux
# -- Compiling package marmux
# -- Compiling package cmpmux
# -- Compiling package alumux
# -- Compiling package rs1mux
# -- Compiling package rs2mux
# -- Compiling package regfilemux
# -- Compiling package dcachemux
# 
# Top level modules:
# 	--none--
# End time: 21:06:19 on Mar 26,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/register.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:19 on Mar 26,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/register.sv 
# -- Compiling module register
# 
# Top level modules:
# 	register
# End time: 21:06:19 on Mar 26,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/regfile.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:19 on Mar 26,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/regfile.sv 
# -- Compiling module regfile
# 
# Top level modules:
# 	regfile
# End time: 21:06:19 on Mar 26,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/pc_reg.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:19 on Mar 26,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/pc_reg.sv 
# -- Compiling module pc_register
# 
# Top level modules:
# 	pc_register
# End time: 21:06:19 on Mar 26,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/mp3.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:19 on Mar 26,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/mp3.sv 
# ** Error: /job/student/hdl/mp3.sv(6): (vlog-13006) Could not find the package (rv32i_types).  Design read will continue, but expect a cascade of errors after this failure.  Furthermore if you experience a vopt-7 error immediately before this error then please check the package names or the library search paths on the command line.
# ** Error: /job/student/hdl/mp3.sv(7): (vlog-13006) Could not find the package (control_itf).  Design read will continue, but expect a cascade of errors after this failure.  Furthermore if you experience a vopt-7 error immediately before this error then please check the package names or the library search paths on the command line.
# ** Error: /job/student/hdl/mp3.sv(9): (vlog-13006) Could not find the package (rv32i_types).  Design read will continue, but expect a cascade of errors after this failure.  Furthermore if you experience a vopt-7 error immediately before this error then please check the package names or the library search paths on the command line.
# End time: 21:06:19 on Mar 26,2020, Elapsed time: 0:00:00
# Errors: 3, Warnings: 0
# /opt/altera/modelsim_ase/linuxaloem/vlog failed.
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:19 on Mar 26,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/rv32i_types.sv 
# -- Compiling package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# 
# Top level modules:
# 	--none--
# End time: 21:06:19 on Mar 26,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/control_itf.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:19 on Mar 26,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/control_itf.sv 
# ** Error: (vlog-13069) /job/student/hdl/control_itf.sv(63): near "rv32i_opcode": syntax error, unexpected IDENTIFIER.
# ** Error: (vlog-13069) /job/student/hdl/control_itf.sv(72): near "}": syntax error, unexpected '}', expecting class.
# End time: 21:06:19 on Mar 26,2020, Elapsed time: 0:00:00
# Errors: 2, Warnings: 0
# /opt/altera/modelsim_ase/linuxaloem/vlog failed.
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cmp_module.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:19 on Mar 26,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/cmp_module.sv 
# -- Compiling module cmp_module
# ** Error: (vlog-13069) /job/student/hdl/cmp_module.sv(6): near "op": syntax error, unexpected IDENTIFIER, expecting ')'.
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# ** Error: /job/student/hdl/cmp_module.sv(20): (vlog-2163) Macro `BAD_MUX_SEL_CMP is undefined.
# End time: 21:06:19 on Mar 26,2020, Elapsed time: 0:00:00
# Errors: 2, Warnings: 0
# /opt/altera/modelsim_ase/linuxaloem/vlog failed.
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/alu.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:19 on Mar 26,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/alu.sv 
# -- Compiling package alu_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module alu
# 
# Top level modules:
# 	alu
# End time: 21:06:20 on Mar 26,2020, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:20 on Mar 26,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/datapath.sv 
# ** Error: /job/student/hdl/datapath.sv(4): (vlog-13006) Could not find the package (control_itf).  Design read will continue, but expect a cascade of errors after this failure.  Furthermore if you experience a vopt-7 error immediately before this error then please check the package names or the library search paths on the command line.
# ** Error: /job/student/hdl/datapath.sv(21): (vlog-2164) Class or package 'control_itf' not found.
# ** Error: (vlog-13069) /job/student/hdl/datapath.sv(21): near "::": syntax error, unexpected ::, expecting ')'.
# ** Error: /job/student/hdl/datapath.sv(25): (vlog-2164) Class or package 'control_itf' not found.
# ** Error: /job/student/hdl/datapath.sv(41): (vlog-2164) Class or package 'control_itf' not found.
# ** Error: /job/student/hdl/datapath.sv(42): (vlog-2164) Class or package 'control_itf' not found.
# ** Error: /job/student/hdl/datapath.sv(43): (vlog-2164) Class or package 'control_itf' not found.
# ** Error: /job/student/hdl/datapath.sv(44): (vlog-2164) Class or package 'control_itf' not found.
# ** Error: /job/student/hdl/datapath.sv(45): (vlog-2164) Class or package 'control_itf' not found.
# ** Error: /job/student/hdl/datapath.sv(46): (vlog-2164) Class or package 'control_itf' not found.
# ** Error: /job/student/hdl/datapath.sv(77): (vlog-2164) Class or package 'control_itf' not found.
# ** Error: /job/student/hdl/datapath.sv(78): (vlog-2164) Class or package 'control_itf' not found.
# End time: 21:06:20 on Mar 26,2020, Elapsed time: 0:00:00
# Errors: 12, Warnings: 0
# /opt/altera/modelsim_ase/linuxaloem/vlog failed.
ModelSim> 
> 
vlog -vlog01compat -work work +incdir+/job/student/hvl {/job/student/hvl/rvfimon.v}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:20 on Mar 26,2020
# vlog -vlog01compat -work work "+incdir+/job/student/hvl" /job/student/hvl/rvfimon.v 
# -- Compiling module riscv_formal_monitor_rv32imc
# -- Compiling module riscv_formal_monitor_rv32imc_rob
# -- Compiling module riscv_formal_monitor_rv32imc_isa_spec
# -- Compiling module riscv_formal_monitor_rv32imc_insn_add
# -- Compiling module riscv_formal_monitor_rv32imc_insn_addi
# -- Compiling module riscv_formal_monitor_rv32imc_insn_and
# -- Compiling module riscv_formal_monitor_rv32imc_insn_andi
# -- Compiling module riscv_formal_monitor_rv32imc_insn_auipc
# -- Compiling module riscv_formal_monitor_rv32imc_insn_beq
# -- Compiling module riscv_formal_monitor_rv32imc_insn_bge
# -- Compiling module riscv_formal_monitor_rv32imc_insn_bgeu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_blt
# -- Compiling module riscv_formal_monitor_rv32imc_insn_bltu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_bne
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_add
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_addi
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_addi16sp
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_addi4spn
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_and
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_andi
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_beqz
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_bnez
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_j
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_jal
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_jalr
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_jr
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_li
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_lui
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_lw
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_lwsp
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_mv
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_or
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_slli
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_srai
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_srli
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_sub
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_sw
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_swsp
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_xor
# -- Compiling module riscv_formal_monitor_rv32imc_insn_div
# -- Compiling module riscv_formal_monitor_rv32imc_insn_divu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_jal
# -- Compiling module riscv_formal_monitor_rv32imc_insn_jalr
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lb
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lbu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lh
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lhu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lui
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lw
# -- Compiling module riscv_formal_monitor_rv32imc_insn_mul
# -- Compiling module riscv_formal_monitor_rv32imc_insn_mulh
# -- Compiling module riscv_formal_monitor_rv32imc_insn_mulhsu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_mulhu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_or
# -- Compiling module riscv_formal_monitor_rv32imc_insn_ori
# -- Compiling module riscv_formal_monitor_rv32imc_insn_rem
# -- Compiling module riscv_formal_monitor_rv32imc_insn_remu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sb
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sh
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sll
# -- Compiling module riscv_formal_monitor_rv32imc_insn_slli
# -- Compiling module riscv_formal_monitor_rv32imc_insn_slt
# -- Compiling module riscv_formal_monitor_rv32imc_insn_slti
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sltiu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sltu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sra
# -- Compiling module riscv_formal_monitor_rv32imc_insn_srai
# -- Compiling module riscv_formal_monitor_rv32imc_insn_srl
# -- Compiling module riscv_formal_monitor_rv32imc_insn_srli
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sub
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sw
# -- Compiling module riscv_formal_monitor_rv32imc_insn_xor
# -- Compiling module riscv_formal_monitor_rv32imc_insn_xori
# 
# Top level modules:
# 	riscv_formal_monitor_rv32imc
# End time: 21:06:20 on Mar 26,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/source_tb.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:20 on Mar 26,2020
# vlog -sv -work work "+incdir+/job/student/hvl" /job/student/hvl/source_tb.sv 
# -- Compiling module magic_memory_dp
# -- Compiling module ParamMemory
# ** Warning: ** while parsing file included at /job/student/hvl/source_tb.sv(14)
# ** at hvl/param_memory.sv(25): (vlog-2244) Variable 'iteration' is implicitly static. You must either explicitly declare it as static or automatic
# or remove the initialization in the declaration of variable.
# -- Compiling interface rvfi_itf
# -- Compiling module shadow_memory
# -- Compiling interface tb_itf
# -- Compiling package source_tb_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module source_tb
# 
# Top level modules:
# 	source_tb
# End time: 21:06:20 on Mar 26,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 1
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/top.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:20 on Mar 26,2020
# vlog -sv -work work "+incdir+/job/student/hvl" /job/student/hvl/top.sv 
# -- Compiling module mp3_tb
# 
# Top level modules:
# 	mp3_tb
# End time: 21:06:20 on Mar 26,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> 
> 
vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb
# vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs=""+acc"" mp3_tb 
# Start time: 21:06:20 on Mar 26,2020
# Loading sv_std.std
# Loading work.mp3_tb
# Loading work.tb_itf
# Loading work.rvfi_itf
# Loading work.regfilemux
# Loading work.alumux
# Loading work.cmpmux
# Loading work.marmux
# Loading work.pcmux
# Loading work.rv32i_types
# Loading work.source_tb_sv_unit
# Loading work.source_tb
# ** Error: (vsim-3033) /job/student/hvl/top.sv(36): Instantiation of 'mp3' failed. The design unit was not found.
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb File: /job/student/hvl/top.sv
#         Searched libraries:
#             /opt/altera/modelsim_ase/altera/verilog/altera
#             /opt/altera/modelsim_ase/altera/verilog/220model
#             /opt/altera/modelsim_ase/altera/verilog/sgate
#             /opt/altera/modelsim_ase/altera/verilog/altera_mf
#             /opt/altera/modelsim_ase/altera/verilog/altera_lnsim
#             /opt/altera/modelsim_ase/altera/verilog/arriaii_hssi
#             /opt/altera/modelsim_ase/altera/verilog/arriaii_pcie_hip
#             /opt/altera/modelsim_ase/altera/verilog/arriaii
#             /job/student/rtl_work
#             /job/student/rtl_work
# Error loading design
# End time: 21:06:21 on Mar 26,2020, Elapsed time: 0:00:01
# Errors: 1, Warnings: 0

```

</details>


### Targeted Tests: 
<ul>
<li> <b>cp1</b> <img src="https://upload.wikimedia.org/wikipedia/en/thumb/7/74/Ambox_warning_yellow.svg/40px-Ambox_warning_yellow.svg.png" alt="error" width="13" height="13" ></img><details>
<summary>Error Occurred</summary>

```
An error occured when running this test.
If your code did not successfully compile, that is likely the reason.
If your code did compile, then please reach out to a TA on Piazza
```

</details>
</li>
</ul>

---
Staff use: 5e7d18fe52680ce0e28cc90e

[success]: https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png 
[failure]: https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png 