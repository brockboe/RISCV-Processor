# AG Report Generated 2020-03-27 16:06
This is a report about mp3 generated for ZBA at 2020-03-27 16:06. The autograder used commit ``94814fd06661`` as a starting point. If you have any questions about this report, please contact the TAs on Piazza.
### Quick Results:
 - Compilation: YES
 - Targeted: 0/1 (0.0%)
### Compilation ![Success][success]
You succesfully compiled. Your report is below.
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
    Info: Processing started: Fri Mar 27 21:05:39 2020
Info: Command: quartus_map mp3 -c mp3
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Info (20030): Parallel compilation is enabled and will use 4 of the 4 processors detected
Info (12021): Found 1 design units, including 1 entities, in source file hdl/control_rom.sv
    Info (12023): Found entity 1: control_rom File: /job/student/hdl/control_rom.sv Line: 12
Info (12021): Found 1 design units, including 0 entities, in source file hdl/control_itf.sv
    Info (12022): Found design unit 1: control_itf (SystemVerilog) File: /job/student/hdl/control_itf.sv Line: 8
Info (12021): Found 1 design units, including 1 entities, in source file hdl/execute_controller.sv
    Info (12023): Found entity 1: execute_controller File: /job/student/hdl/execute_controller.sv Line: 10
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
    Info (12022): Found design unit 8: dcachemux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 80
Info (12021): Found 2 design units, including 2 entities, in source file hdl/register.sv
    Info (12023): Found entity 1: register File: /job/student/hdl/register.sv Line: 3
    Info (12023): Found entity 2: ctrl_word_register File: /job/student/hdl/register.sv Line: 37
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
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cmp_module.sv
    Info (12023): Found entity 1: cmp_module File: /job/student/hdl/cmp_module.sv Line: 18
Info (12021): Found 1 design units, including 1 entities, in source file hdl/alu.sv
    Info (12023): Found entity 1: alu File: /job/student/hdl/alu.sv Line: 3
Info (12127): Elaborating entity "mp3" for the top level hierarchy
Warning (10034): Output port "icache_read" at mp3.sv(29) has no driver File: /job/student/hdl/mp3.sv Line: 29
Warning (10034): Output port "icache_write" at mp3.sv(30) has no driver File: /job/student/hdl/mp3.sv Line: 30
Warning (10034): Output port "dcache_read" at mp3.sv(36) has no driver File: /job/student/hdl/mp3.sv Line: 36
Warning (10034): Output port "dcache_write" at mp3.sv(38) has no driver File: /job/student/hdl/mp3.sv Line: 38
Info (12128): Elaborating entity "datapath" for hierarchy "datapath:d" File: /job/student/hdl/mp3.sv Line: 62
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(52): object "dcachemux_out" assigned a value but never read File: /job/student/hdl/datapath.sv Line: 52
Warning (10034): Output port "icache_address" at datapath.sv(33) has no driver File: /job/student/hdl/datapath.sv Line: 33
Warning (10034): Output port "icache_wdata" at datapath.sv(34) has no driver File: /job/student/hdl/datapath.sv Line: 34
Warning (10034): Output port "dcache_address" at datapath.sv(37) has no driver File: /job/student/hdl/datapath.sv Line: 37
Warning (10034): Output port "dcache_wdata" at datapath.sv(38) has no driver File: /job/student/hdl/datapath.sv Line: 38
Info (12128): Elaborating entity "register" for hierarchy "datapath:d|register:pipe_ifid_icache_rdata" File: /job/student/hdl/datapath.sv Line: 109
Info (12128): Elaborating entity "register" for hierarchy "datapath:d|register:pipe_idex_idecode" File: /job/student/hdl/datapath.sv Line: 131
Info (12128): Elaborating entity "ctrl_word_register" for hierarchy "datapath:d|ctrl_word_register:pipe_idex_ctrl_word" File: /job/student/hdl/datapath.sv Line: 140
Info (12128): Elaborating entity "execute_controller" for hierarchy "datapath:d|execute_controller:execute_controller" File: /job/student/hdl/datapath.sv Line: 291
Info (12128): Elaborating entity "pc_register" for hierarchy "datapath:d|pc_register:pc" File: /job/student/hdl/datapath.sv Line: 304
Info (12128): Elaborating entity "regfile" for hierarchy "datapath:d|regfile:regfile" File: /job/student/hdl/datapath.sv Line: 318
Info (12128): Elaborating entity "alu" for hierarchy "datapath:d|alu:alu" File: /job/student/hdl/datapath.sv Line: 330
Info (12128): Elaborating entity "cmp_module" for hierarchy "datapath:d|cmp_module:cmp" File: /job/student/hdl/datapath.sv Line: 337
Info (12128): Elaborating entity "control_rom" for hierarchy "control_rom:ctrl_rom" File: /job/student/hdl/mp3.sv Line: 69
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
Info (144001): Generated suppressed messages file /job/student/output_files/mp3.map.smsg
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
Info: Quartus Prime Analysis & Synthesis was successful. 0 errors, 210 warnings
    Info: Peak virtual memory: 1130 megabytes
    Info: Processing ended: Fri Mar 27 21:06:04 2020
    Info: Elapsed time: 00:00:25
    Info: Total CPU time (on all processors): 00:00:38
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
    Info: Processing started: Fri Mar 27 21:06:05 2020
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
    Info: Peak virtual memory: 789 megabytes
    Info: Processing ended: Fri Mar 27 21:06:06 2020
    Info: Elapsed time: 00:00:01
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
# Start time: 21:06:09 on Mar 27,2020
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
# End time: 21:06:09 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/regfile.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:09 on Mar 27,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/regfile.sv 
# -- Compiling module regfile
# 
# Top level modules:
# 	regfile
# End time: 21:06:09 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/pc_reg.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:09 on Mar 27,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/pc_reg.sv 
# -- Compiling module pc_register
# 
# Top level modules:
# 	pc_register
# End time: 21:06:09 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:09 on Mar 27,2020
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
# End time: 21:06:09 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/control_itf.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:09 on Mar 27,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/control_itf.sv 
# -- Compiling package control_itf_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling package control_itf
# 
# Top level modules:
# 	--none--
# End time: 21:06:09 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/alu.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:09 on Mar 27,2020
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
# End time: 21:06:09 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/control_rom.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:09 on Mar 27,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/control_rom.sv 
# -- Compiling package control_rom_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package rs1mux
# -- Importing package rs2mux
# -- Importing package dcachemux
# -- Importing package control_itf
# -- Compiling module control_rom
# 
# Top level modules:
# 	control_rom
# End time: 21:06:09 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/execute_controller.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:09 on Mar 27,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/execute_controller.sv 
# -- Compiling package execute_controller_sv_unit
# -- Importing package control_itf
# -- Importing package alumux
# -- Importing package cmpmux
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package regfilemux
# -- Compiling module execute_controller
# 
# Top level modules:
# 	execute_controller
# End time: 21:06:09 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/register.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:09 on Mar 27,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/register.sv 
# -- Compiling package register_sv_unit
# -- Importing package control_itf
# -- Importing package alumux
# -- Importing package cmpmux
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package regfilemux
# -- Compiling module register
# -- Compiling module ctrl_word_register
# 
# Top level modules:
# 	register
# 	ctrl_word_register
# End time: 21:06:09 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/mp3.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:09 on Mar 27,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/mp3.sv 
# -- Compiling package mp3_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package control_itf
# -- Importing package rs1mux
# -- Importing package rs2mux
# -- Importing package dcachemux
# -- Compiling module mp3
# 
# Top level modules:
# 	mp3
# End time: 21:06:09 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:09 on Mar 27,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/datapath.sv 
# -- Compiling package datapath_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package control_itf
# -- Importing package rs1mux
# -- Importing package rs2mux
# -- Importing package dcachemux
# -- Compiling module datapath
# 
# Top level modules:
# 	datapath
# End time: 21:06:09 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cmp_module.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:09 on Mar 27,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/cmp_module.sv 
# -- Compiling package cmp_module_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package control_itf
# -- Importing package rs1mux
# -- Importing package rs2mux
# -- Importing package dcachemux
# -- Compiling module cmp_module
# 
# Top level modules:
# 	cmp_module
# End time: 21:06:10 on Mar 27,2020, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
ModelSim> 
> 
vlog -vlog01compat -work work +incdir+/job/student/hvl {/job/student/hvl/rvfimon.v}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:10 on Mar 27,2020
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
# End time: 21:06:10 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/source_tb.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:10 on Mar 27,2020
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
# End time: 21:06:10 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 1
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/top.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 21:06:10 on Mar 27,2020
# vlog -sv -work work "+incdir+/job/student/hvl" /job/student/hvl/top.sv 
# -- Compiling module mp3_tb
# 
# Top level modules:
# 	mp3_tb
# End time: 21:06:10 on Mar 27,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> 
> 
vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb
# vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs=""+acc"" mp3_tb 
# Start time: 21:06:10 on Mar 27,2020
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
# Loading work.dcachemux
# Loading work.rs2mux
# Loading work.rs1mux
# Loading work.control_itf
# Loading work.mp3_sv_unit
# Loading work.mp3
# Loading work.datapath_sv_unit
# Loading work.datapath
# Loading work.register_sv_unit
# Loading work.register
# Loading work.ctrl_word_register
# Loading work.execute_controller_sv_unit
# Loading work.execute_controller
# Loading work.pc_register
# Loading work.regfile
# Loading work.alu_sv_unit
# Loading work.alu
# Loading work.cmp_module_sv_unit
# Loading work.cmp_module
# Loading work.control_rom_sv_unit
# Loading work.control_rom
# Loading work.magic_memory_dp
VSIM 21> 
> 
add wave *
# (vish-4014) No objects found matching '*'.
VSIM 22> view structure
VSIM 23> # 
# <EOF>
# 0: RVMODEL NULL (Expected)
# End time: 21:06:11 on Mar 27,2020, Elapsed time: 0:00:01
# Errors: 1, Warnings: 0

```

</details>


### Targeted Tests: 
<ul>
<li> <b>cp1</b> <img alt="failure" width="13" height="13" src="https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png" ></img></li>
</ul>

---
Staff use: 5e7e6a7d52680ce0e28cc9e1

[success]: https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png 
[failure]: https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png 