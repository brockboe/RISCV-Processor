# AG Report Generated 2020-04-30 10:45
This is a report about mp3cp5 generated for ZBA at 2020-04-30 10:45. The autograder used commit ``5e6bd9e0d7a5`` as a starting point. If you have any questions about this report, please contact the TAs on Piazza.
### Quick Results:
 - Compilation: YES
 - Targeted: 6/7 (85.7%)
 - Timing: 105.3 MHz
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
    Info: Processing started: Thu Apr 30 15:27:50 2020
Info: Command: quartus_map mp3 -c mp3
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Info (20030): Parallel compilation is enabled and will use 4 of the 4 processors detected
Info (12021): Found 1 design units, including 1 entities, in source file hdl/btb_col.sv
    Info (12023): Found entity 1: btb_col File: /job/student/hdl/btb_col.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/btb.sv
    Info (12023): Found entity 1: btb File: /job/student/hdl/btb.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/bht.sv
    Info (12023): Found entity 1: bht File: /job/student/hdl/bht.sv Line: 2
Info (12021): Found 2 design units, including 2 entities, in source file hdl/cache/pLRU_tree.sv
    Info (12023): Found entity 1: pLRU_tree File: /job/student/hdl/cache/pLRU_tree.sv Line: 1
    Info (12023): Found entity 2: tree_node File: /job/student/hdl/cache/pLRU_tree.sv Line: 56
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/ewb.sv
    Info (12023): Found entity 1: ewb File: /job/student/hdl/cache/ewb.sv Line: 1
Info (12021): Found 2 design units, including 2 entities, in source file hdl/muldiv/multiplier.sv
    Info (12023): Found entity 1: multiplier_unsigned File: /job/student/hdl/muldiv/multiplier.sv Line: 4
    Info (12023): Found entity 2: multiplier File: /job/student/hdl/muldiv/multiplier.sv Line: 71
Info (12021): Found 0 design units, including 0 entities, in source file hdl/muldiv/mult_precomputed.sv
Info (12021): Found 2 design units, including 2 entities, in source file hdl/muldiv/divider.sv
    Info (12023): Found entity 1: divider_unsigned File: /job/student/hdl/muldiv/divider.sv Line: 4
    Info (12023): Found entity 2: divider File: /job/student/hdl/muldiv/divider.sv Line: 107
Info (12021): Found 1 design units, including 0 entities, in source file hdl/forwarding/forwarding_itf.sv
    Info (12022): Found design unit 1: forwarding_itf (SystemVerilog) File: /job/student/hdl/forwarding/forwarding_itf.sv Line: 13
Info (12021): Found 0 design units, including 0 entities, in source file hdl/forwarding/forwarding.sv
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l2_datapath.sv
    Info (12023): Found entity 1: l2_datapath File: /job/student/hdl/cache/l2_datapath.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l2_control.sv
    Info (12023): Found entity 1: l2_control File: /job/student/hdl/cache/l2_control.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l2_cache.sv
    Info (12023): Found entity 1: l2_cache File: /job/student/hdl/cache/l2_cache.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/mp3_cache.sv
    Info (12023): Found entity 1: mp3_cache File: /job/student/hdl/cache/mp3_cache.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/data_array.sv
    Info (12023): Found entity 1: data_array File: /job/student/hdl/cache/data_array.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/cacheline_adaptor.sv
    Info (12023): Found entity 1: cacheline_adaptor File: /job/student/hdl/cache/cacheline_adaptor.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/cache_datapath.sv
    Info (12023): Found entity 1: cache_datapath File: /job/student/hdl/cache/cache_datapath.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/cache_control.sv
    Info (12023): Found entity 1: cache_control File: /job/student/hdl/cache/cache_control.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/cache_arbiter.sv
    Info (12023): Found entity 1: cache_arbiter File: /job/student/hdl/cache/cache_arbiter.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/cache.sv
    Info (12023): Found entity 1: cache File: /job/student/hdl/cache/cache.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/bus_adapter.sv
    Info (12023): Found entity 1: bus_adapter File: /job/student/hdl/cache/bus_adapter.sv Line: 1
Info (12021): Found 2 design units, including 2 entities, in source file hdl/cache/array.sv
    Info (12023): Found entity 1: array File: /job/student/hdl/cache/array.sv Line: 1
    Info (12023): Found entity 2: array2 File: /job/student/hdl/cache/array.sv Line: 47
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
    Info (12022): Found design unit 6: rs2mux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 68
    Info (12022): Found design unit 7: regfilemux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 79
    Info (12022): Found design unit 8: dcachemux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 90
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
    Info (12023): Found entity 1: datapath File: /job/student/hdl/datapath.sv Line: 19
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cmp_module.sv
    Info (12023): Found entity 1: cmp_module File: /job/student/hdl/cmp_module.sv Line: 18
Info (12021): Found 1 design units, including 1 entities, in source file hdl/alu.sv
    Info (12023): Found entity 1: alu File: /job/student/hdl/alu.sv Line: 3
Info (12127): Elaborating entity "mp3" for the top level hierarchy
Info (12128): Elaborating entity "datapath" for hierarchy "datapath:d" File: /job/student/hdl/mp3.sv Line: 79
Info (12128): Elaborating entity "register" for hierarchy "datapath:d|register:pipe_ifid_idecode" File: /job/student/hdl/datapath.sv Line: 239
Info (12128): Elaborating entity "register" for hierarchy "datapath:d|register:pipe_ifid_pc" File: /job/student/hdl/datapath.sv Line: 248
Info (12128): Elaborating entity "ctrl_word_register" for hierarchy "datapath:d|ctrl_word_register:pipe_idex_ctrl_word" File: /job/student/hdl/datapath.sv Line: 271
Info (12128): Elaborating entity "pc_register" for hierarchy "datapath:d|pc_register:pc" File: /job/student/hdl/datapath.sv Line: 438
Info (12128): Elaborating entity "regfile" for hierarchy "datapath:d|regfile:regfile" File: /job/student/hdl/datapath.sv Line: 451
Info (12128): Elaborating entity "btb" for hierarchy "datapath:d|btb:btb" File: /job/student/hdl/datapath.sv Line: 466
Info (12128): Elaborating entity "btb_col" for hierarchy "datapath:d|btb:btb|btb_col:tags" File: /job/student/hdl/btb.sv Line: 38
Info (12128): Elaborating entity "btb_col" for hierarchy "datapath:d|btb:btb|btb_col:targets" File: /job/student/hdl/btb.sv Line: 48
Info (12128): Elaborating entity "btb_col" for hierarchy "datapath:d|btb:btb|btb_col:is_valid" File: /job/student/hdl/btb.sv Line: 58
Info (12128): Elaborating entity "alu" for hierarchy "datapath:d|alu:alu" File: /job/student/hdl/datapath.sv Line: 474
Info (12128): Elaborating entity "cmp_module" for hierarchy "datapath:d|cmp_module:cmp" File: /job/student/hdl/datapath.sv Line: 481
Info (12128): Elaborating entity "multiplier" for hierarchy "datapath:d|multiplier:multiplier" File: /job/student/hdl/datapath.sv Line: 491
Info (12128): Elaborating entity "multiplier_unsigned" for hierarchy "datapath:d|multiplier:multiplier|multiplier_unsigned:multiu" File: /job/student/hdl/muldiv/multiplier.sv Line: 137
Info (12128): Elaborating entity "divider" for hierarchy "datapath:d|divider:divider" File: /job/student/hdl/datapath.sv Line: 503
Info (12128): Elaborating entity "divider_unsigned" for hierarchy "datapath:d|divider:divider|divider_unsigned:d" File: /job/student/hdl/muldiv/divider.sv Line: 132
Warning (10230): Verilog HDL assignment warning at divider.sv(75): truncated value with size 33 to match size of target (32) File: /job/student/hdl/muldiv/divider.sv Line: 75
Info (12128): Elaborating entity "control_rom" for hierarchy "control_rom:ctrl_rom" File: /job/student/hdl/mp3.sv Line: 88
Info (12128): Elaborating entity "mp3_cache" for hierarchy "mp3_cache:cache" File: /job/student/hdl/mp3.sv Line: 114
Info (12128): Elaborating entity "cache" for hierarchy "mp3_cache:cache|cache:icache" File: /job/student/hdl/cache/mp3_cache.sv Line: 57
Info (12128): Elaborating entity "cache_control" for hierarchy "mp3_cache:cache|cache:icache|cache_control:control" File: /job/student/hdl/cache/cache.sv Line: 66
Info (10264): Verilog HDL Case Statement information at cache_control.sv(40): all case item expressions in this case statement are onehot File: /job/student/hdl/cache/cache_control.sv Line: 40
Info (12128): Elaborating entity "cache_datapath" for hierarchy "mp3_cache:cache|cache:icache|cache_datapath:datapath" File: /job/student/hdl/cache/cache.sv Line: 92
Info (12128): Elaborating entity "data_array" for hierarchy "mp3_cache:cache|cache:icache|cache_datapath:datapath|data_array:data0" File: /job/student/hdl/cache/cache_datapath.sv Line: 37
Info (12128): Elaborating entity "array" for hierarchy "mp3_cache:cache|cache:icache|cache_datapath:datapath|array:tag0" File: /job/student/hdl/cache/cache_datapath.sv Line: 40
Info (12128): Elaborating entity "array" for hierarchy "mp3_cache:cache|cache:icache|cache_datapath:datapath|array:d0" File: /job/student/hdl/cache/cache_datapath.sv Line: 43
Info (12128): Elaborating entity "bus_adapter" for hierarchy "mp3_cache:cache|cache:icache|bus_adapter:bus_adapter" File: /job/student/hdl/cache/cache.sv Line: 103
Info (12128): Elaborating entity "cache_arbiter" for hierarchy "mp3_cache:cache|cache_arbiter:arbiter" File: /job/student/hdl/cache/mp3_cache.sv Line: 107
Info (12128): Elaborating entity "l2_cache" for hierarchy "mp3_cache:cache|l2_cache:l2" File: /job/student/hdl/cache/mp3_cache.sv Line: 136
Info (12128): Elaborating entity "l2_control" for hierarchy "mp3_cache:cache|l2_cache:l2|l2_control:control" File: /job/student/hdl/cache/l2_cache.sv Line: 70
Info (10264): Verilog HDL Case Statement information at l2_control.sv(78): all case item expressions in this case statement are onehot File: /job/student/hdl/cache/l2_control.sv Line: 78
Info (10264): Verilog HDL Case Statement information at l2_control.sv(30): all case item expressions in this case statement are onehot File: /job/student/hdl/cache/l2_control.sv Line: 30
Info (10264): Verilog HDL Case Statement information at l2_control.sv(130): all case item expressions in this case statement are onehot File: /job/student/hdl/cache/l2_control.sv Line: 130
Info (12128): Elaborating entity "l2_datapath" for hierarchy "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath" File: /job/student/hdl/cache/l2_cache.sv Line: 95
Info (12128): Elaborating entity "array" for hierarchy "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data0" File: /job/student/hdl/cache/l2_datapath.sv Line: 43
Info (12128): Elaborating entity "array" for hierarchy "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag0" File: /job/student/hdl/cache/l2_datapath.sv Line: 52
Info (12128): Elaborating entity "array" for hierarchy "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:d0" File: /job/student/hdl/cache/l2_datapath.sv Line: 61
Info (12128): Elaborating entity "pLRU_tree" for hierarchy "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|pLRU_tree:pLRU" File: /job/student/hdl/cache/l2_datapath.sv Line: 79
Info (12128): Elaborating entity "tree_node" for hierarchy "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|pLRU_tree:pLRU|tree_node:L0" File: /job/student/hdl/cache/pLRU_tree.sv Line: 42
Info (12128): Elaborating entity "ewb" for hierarchy "mp3_cache:cache|ewb:buffer" File: /job/student/hdl/cache/mp3_cache.sv Line: 153
Info (12128): Elaborating entity "cacheline_adaptor" for hierarchy "mp3_cache:cache|cacheline_adaptor:adapter" File: /job/student/hdl/cache/mp3_cache.sv Line: 182
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag0|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag1|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag2|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag3|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag4|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag5|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag6|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag7|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|cache:dcache|cache_datapath:datapath|array:tag1|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|cache:dcache|cache_datapath:datapath|array:tag0|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|cache:icache|cache_datapath:datapath|array:tag1|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|cache:icache|cache_datapath:datapath|array:tag0|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data0|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data1|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data2|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data3|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data4|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data5|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data6|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data7|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Info (19000): Inferred 22 megafunctions from design logic
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag0|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 23
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 23
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag1|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 23
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 23
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag2|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 23
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 23
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag3|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 23
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 23
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag4|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 23
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 23
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag5|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 23
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 23
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag6|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 23
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 23
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag7|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 23
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 23
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|cache:dcache|cache_datapath:datapath|array:tag1|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 24
        Info (286033): Parameter WIDTHAD_A set to 3
        Info (286033): Parameter NUMWORDS_A set to 8
        Info (286033): Parameter WIDTH_B set to 24
        Info (286033): Parameter WIDTHAD_B set to 3
        Info (286033): Parameter NUMWORDS_B set to 8
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|cache:dcache|cache_datapath:datapath|array:tag0|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 24
        Info (286033): Parameter WIDTHAD_A set to 3
        Info (286033): Parameter NUMWORDS_A set to 8
        Info (286033): Parameter WIDTH_B set to 24
        Info (286033): Parameter WIDTHAD_B set to 3
        Info (286033): Parameter NUMWORDS_B set to 8
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|cache:icache|cache_datapath:datapath|array:tag1|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 24
        Info (286033): Parameter WIDTHAD_A set to 3
        Info (286033): Parameter NUMWORDS_A set to 8
        Info (286033): Parameter WIDTH_B set to 24
        Info (286033): Parameter WIDTHAD_B set to 3
        Info (286033): Parameter NUMWORDS_B set to 8
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|cache:icache|cache_datapath:datapath|array:tag0|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 24
        Info (286033): Parameter WIDTHAD_A set to 3
        Info (286033): Parameter NUMWORDS_A set to 8
        Info (286033): Parameter WIDTH_B set to 24
        Info (286033): Parameter WIDTHAD_B set to 3
        Info (286033): Parameter NUMWORDS_B set to 8
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data0|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 256
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 256
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data1|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 256
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 256
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data2|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 256
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 256
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data3|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 256
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 256
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data4|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 256
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 256
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data5|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 256
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 256
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data6|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 256
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 256
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276029): Inferred altsyncram megafunction from the following design logic: "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data7|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 256
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 256
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter READ_DURING_WRITE_MODE_MIXED_PORTS set to OLD_DATA
    Info (276031): Inferred altsyncram megafunction from the following design logic: "datapath:d|multiplier:multiplier|multiplier_unsigned:multiu|WideOr329_rtl_0"
        Info (286033): Parameter OPERATION_MODE set to ROM
        Info (286033): Parameter WIDTH_A set to 7
        Info (286033): Parameter WIDTHAD_A set to 8
        Info (286033): Parameter NUMWORDS_A set to 256
        Info (286033): Parameter OUTDATA_REG_A set to UNREGISTERED
        Info (286033): Parameter RAM_BLOCK_TYPE set to AUTO
        Info (286033): Parameter INIT_FILE set to mp3.mp30.rtl.mif
    Info (276031): Inferred altsyncram megafunction from the following design logic: "datapath:d|multiplier:multiplier|multiplier_unsigned:multiu|WideOr0_rtl_0"
        Info (286033): Parameter OPERATION_MODE set to ROM
        Info (286033): Parameter WIDTH_A set to 7
        Info (286033): Parameter WIDTHAD_A set to 8
        Info (286033): Parameter NUMWORDS_A set to 256
        Info (286033): Parameter OUTDATA_REG_A set to UNREGISTERED
        Info (286033): Parameter RAM_BLOCK_TYPE set to AUTO
        Info (286033): Parameter INIT_FILE set to mp3.mp31.rtl.mif
Info (12130): Elaborated megafunction instantiation "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag0|altsyncram:data_rtl_0"
Info (12133): Instantiated megafunction "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:tag0|altsyncram:data_rtl_0" with the following parameter:
    Info (12134): Parameter "OPERATION_MODE" = "DUAL_PORT"
    Info (12134): Parameter "WIDTH_A" = "23"
    Info (12134): Parameter "WIDTHAD_A" = "4"
    Info (12134): Parameter "NUMWORDS_A" = "16"
    Info (12134): Parameter "WIDTH_B" = "23"
    Info (12134): Parameter "WIDTHAD_B" = "4"
    Info (12134): Parameter "NUMWORDS_B" = "16"
    Info (12134): Parameter "ADDRESS_ACLR_A" = "NONE"
    Info (12134): Parameter "OUTDATA_REG_B" = "UNREGISTERED"
    Info (12134): Parameter "ADDRESS_ACLR_B" = "NONE"
    Info (12134): Parameter "OUTDATA_ACLR_B" = "NONE"
    Info (12134): Parameter "ADDRESS_REG_B" = "CLOCK0"
    Info (12134): Parameter "INDATA_ACLR_A" = "NONE"
    Info (12134): Parameter "WRCONTROL_ACLR_A" = "NONE"
    Info (12134): Parameter "READ_DURING_WRITE_MODE_MIXED_PORTS" = "OLD_DATA"
Info (12021): Found 1 design units, including 1 entities, in source file db/altsyncram_t6n1.tdf
    Info (12023): Found entity 1: altsyncram_t6n1 File: /job/student/db/altsyncram_t6n1.tdf Line: 27
Info (12130): Elaborated megafunction instantiation "mp3_cache:cache|cache:dcache|cache_datapath:datapath|array:tag1|altsyncram:data_rtl_0"
Info (12133): Instantiated megafunction "mp3_cache:cache|cache:dcache|cache_datapath:datapath|array:tag1|altsyncram:data_rtl_0" with the following parameter:
    Info (12134): Parameter "OPERATION_MODE" = "DUAL_PORT"
    Info (12134): Parameter "WIDTH_A" = "24"
    Info (12134): Parameter "WIDTHAD_A" = "3"
    Info (12134): Parameter "NUMWORDS_A" = "8"
    Info (12134): Parameter "WIDTH_B" = "24"
    Info (12134): Parameter "WIDTHAD_B" = "3"
    Info (12134): Parameter "NUMWORDS_B" = "8"
    Info (12134): Parameter "ADDRESS_ACLR_A" = "NONE"
    Info (12134): Parameter "OUTDATA_REG_B" = "UNREGISTERED"
    Info (12134): Parameter "ADDRESS_ACLR_B" = "NONE"
    Info (12134): Parameter "OUTDATA_ACLR_B" = "NONE"
    Info (12134): Parameter "ADDRESS_REG_B" = "CLOCK0"
    Info (12134): Parameter "INDATA_ACLR_A" = "NONE"
    Info (12134): Parameter "WRCONTROL_ACLR_A" = "NONE"
    Info (12134): Parameter "READ_DURING_WRITE_MODE_MIXED_PORTS" = "OLD_DATA"
Info (12021): Found 1 design units, including 1 entities, in source file db/altsyncram_v3n1.tdf
    Info (12023): Found entity 1: altsyncram_v3n1 File: /job/student/db/altsyncram_v3n1.tdf Line: 27
Info (12130): Elaborated megafunction instantiation "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data0|altsyncram:data_rtl_0"
Info (12133): Instantiated megafunction "mp3_cache:cache|l2_cache:l2|l2_datapath:datapath|array:data0|altsyncram:data_rtl_0" with the following parameter:
    Info (12134): Parameter "OPERATION_MODE" = "DUAL_PORT"
    Info (12134): Parameter "WIDTH_A" = "256"
    Info (12134): Parameter "WIDTHAD_A" = "4"
    Info (12134): Parameter "NUMWORDS_A" = "16"
    Info (12134): Parameter "WIDTH_B" = "256"
    Info (12134): Parameter "WIDTHAD_B" = "4"
    Info (12134): Parameter "NUMWORDS_B" = "16"
    Info (12134): Parameter "ADDRESS_ACLR_A" = "NONE"
    Info (12134): Parameter "OUTDATA_REG_B" = "UNREGISTERED"
    Info (12134): Parameter "ADDRESS_ACLR_B" = "NONE"
    Info (12134): Parameter "OUTDATA_ACLR_B" = "NONE"
    Info (12134): Parameter "ADDRESS_REG_B" = "CLOCK0"
    Info (12134): Parameter "INDATA_ACLR_A" = "NONE"
    Info (12134): Parameter "WRCONTROL_ACLR_A" = "NONE"
    Info (12134): Parameter "READ_DURING_WRITE_MODE_MIXED_PORTS" = "OLD_DATA"
Info (12021): Found 1 design units, including 1 entities, in source file db/altsyncram_dan1.tdf
    Info (12023): Found entity 1: altsyncram_dan1 File: /job/student/db/altsyncram_dan1.tdf Line: 27
Info (12130): Elaborated megafunction instantiation "datapath:d|multiplier:multiplier|multiplier_unsigned:multiu|altsyncram:WideOr329_rtl_0"
Info (12133): Instantiated megafunction "datapath:d|multiplier:multiplier|multiplier_unsigned:multiu|altsyncram:WideOr329_rtl_0" with the following parameter:
    Info (12134): Parameter "OPERATION_MODE" = "ROM"
    Info (12134): Parameter "WIDTH_A" = "7"
    Info (12134): Parameter "WIDTHAD_A" = "8"
    Info (12134): Parameter "NUMWORDS_A" = "256"
    Info (12134): Parameter "OUTDATA_REG_A" = "UNREGISTERED"
    Info (12134): Parameter "RAM_BLOCK_TYPE" = "AUTO"
    Info (12134): Parameter "INIT_FILE" = "mp3.mp30.rtl.mif"
Info (12021): Found 1 design units, including 1 entities, in source file db/altsyncram_3051.tdf
    Info (12023): Found entity 1: altsyncram_3051 File: /job/student/db/altsyncram_3051.tdf Line: 27
Info (12130): Elaborated megafunction instantiation "datapath:d|multiplier:multiplier|multiplier_unsigned:multiu|altsyncram:WideOr0_rtl_0"
Info (12133): Instantiated megafunction "datapath:d|multiplier:multiplier|multiplier_unsigned:multiu|altsyncram:WideOr0_rtl_0" with the following parameter:
    Info (12134): Parameter "OPERATION_MODE" = "ROM"
    Info (12134): Parameter "WIDTH_A" = "7"
    Info (12134): Parameter "WIDTHAD_A" = "8"
    Info (12134): Parameter "NUMWORDS_A" = "256"
    Info (12134): Parameter "OUTDATA_REG_A" = "UNREGISTERED"
    Info (12134): Parameter "RAM_BLOCK_TYPE" = "AUTO"
    Info (12134): Parameter "INIT_FILE" = "mp3.mp31.rtl.mif"
Info (12021): Found 1 design units, including 1 entities, in source file db/altsyncram_4051.tdf
    Info (12023): Found entity 1: altsyncram_4051 File: /job/student/db/altsyncram_4051.tdf Line: 27
Warning (13024): Output pins are stuck at VCC or GND
    Warning (13410): Pin "address_o[0]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 28
    Warning (13410): Pin "address_o[1]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 28
    Warning (13410): Pin "address_o[2]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 28
    Warning (13410): Pin "address_o[3]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 28
    Warning (13410): Pin "address_o[4]" is stuck at GND File: /job/student/hdl/mp3.sv Line: 28
Info (286030): Timing-Driven Synthesis is running
Info (17049): 156 registers lost all their fanouts during netlist optimizations.
Info (144001): Generated suppressed messages file /job/student/output_files/mp3.map.smsg
Info (16010): Generating hard_block partition "hard_block:auto_generated_inst"
    Info (16011): Adding 0 node(s), including 0 DDIO, 0 PLL, 0 transceiver and 0 LCELL
Info (21057): Implemented 28611 device resources after synthesis - the final resource count might be different
    Info (21058): Implemented 67 input pins
    Info (21059): Implemented 98 output pins
    Info (21061): Implemented 26104 logic cells
    Info (21064): Implemented 2342 RAM segments
Info: Quartus Prime Analysis & Synthesis was successful. 0 errors, 28 warnings
    Info: Peak virtual memory: 1525 megabytes
    Info: Processing ended: Thu Apr 30 15:30:28 2020
    Info: Elapsed time: 00:02:38
    Info: Total CPU time (on all processors): 00:02:59
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
    Info: Processing started: Thu Apr 30 15:36:51 2020
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
    Info: Peak virtual memory: 816 megabytes
    Info: Processing ended: Thu Apr 30 15:36:51 2020
    Info: Elapsed time: 00:00:00
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
# Modifying modelsim.ini
ModelSim> 
> 
vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/btb_col.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:52 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/btb_col.sv 
# -- Compiling module btb_col
# 
# Top level modules:
# 	btb_col
# End time: 15:36:52 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/pLRU_tree.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:52 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/pLRU_tree.sv 
# -- Compiling module pLRU_tree
# -- Compiling module tree_node
# 
# Top level modules:
# 	pLRU_tree
# End time: 15:36:52 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/ewb.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:52 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/ewb.sv 
# -- Compiling module ewb
# 
# Top level modules:
# 	ewb
# End time: 15:36:52 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/muldiv {/job/student/hdl/muldiv/mult_precomputed.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:52 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/muldiv" /job/student/hdl/muldiv/mult_precomputed.sv 
# 
# Top level modules:
# 	--none--
# End time: 15:36:52 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/l2_datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:52 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/l2_datapath.sv 
# -- Compiling module l2_datapath
# 
# Top level modules:
# 	l2_datapath
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/l2_control.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/l2_control.sv 
# -- Compiling module l2_control
# 
# Top level modules:
# 	l2_control
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/mp3_cache.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/mp3_cache.sv 
# -- Compiling module mp3_cache
# 
# Top level modules:
# 	mp3_cache
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/data_array.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/data_array.sv 
# -- Compiling module data_array
# 
# Top level modules:
# 	data_array
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/cacheline_adaptor.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/cacheline_adaptor.sv 
# -- Compiling module cacheline_adaptor
# 
# Top level modules:
# 	cacheline_adaptor
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/cache_datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/cache_datapath.sv 
# -- Compiling module cache_datapath
# 
# Top level modules:
# 	cache_datapath
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/cache_control.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/cache_control.sv 
# -- Compiling module cache_control
# 
# Top level modules:
# 	cache_control
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/cache_arbiter.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/cache_arbiter.sv 
# -- Compiling module cache_arbiter
# 
# Top level modules:
# 	cache_arbiter
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/bus_adapter.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/bus_adapter.sv 
# -- Compiling module bus_adapter
# 
# Top level modules:
# 	bus_adapter
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/array.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/array.sv 
# -- Compiling module array
# -- Compiling module array2
# 
# Top level modules:
# 	array
# 	array2
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_mux_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
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
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/regfile.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/regfile.sv 
# -- Compiling module regfile
# 
# Top level modules:
# 	regfile
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/pc_reg.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/pc_reg.sv 
# -- Compiling module pc_register
# 
# Top level modules:
# 	pc_register
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/l2_cache.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/l2_cache.sv 
# -- Compiling module l2_cache
# 
# Top level modules:
# 	l2_cache
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/cache.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/cache.sv 
# -- Compiling module cache
# 
# Top level modules:
# 	cache
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
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
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/btb.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/btb.sv 
# -- Compiling package btb_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module btb
# 
# Top level modules:
# 	btb
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/muldiv {/job/student/hdl/muldiv/multiplier.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/muldiv" /job/student/hdl/muldiv/multiplier.sv 
# -- Compiling package multiplier_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module multiplier_unsigned
# -- Compiling module multiplier
# 
# Top level modules:
# 	multiplier
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/muldiv {/job/student/hdl/muldiv/divider.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/muldiv" /job/student/hdl/muldiv/divider.sv 
# -- Compiling package divider_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Compiling module divider_unsigned
# -- Compiling module divider
# 
# Top level modules:
# 	divider
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/control_itf.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
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
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/alu.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
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
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/forwarding {/job/student/hdl/forwarding/forwarding_itf.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/forwarding" /job/student/hdl/forwarding/forwarding_itf.sv 
# -- Compiling package forwarding_itf_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package control_itf
# -- Importing package rs1mux
# -- Importing package rs2mux
# -- Compiling package forwarding_itf
# 
# Top level modules:
# 	--none--
# End time: 15:36:53 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/control_rom.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:53 on Apr 30,2020
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
# End time: 15:36:54 on Apr 30,2020, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/register.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:54 on Apr 30,2020
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
# End time: 15:36:54 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/mp3.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:54 on Apr 30,2020
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
# End time: 15:36:54 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/forwarding {/job/student/hdl/forwarding/forwarding.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:54 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hdl/forwarding" /job/student/hdl/forwarding/forwarding.sv 
# 
# Top level modules:
# 	--none--
# End time: 15:36:54 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:54 on Apr 30,2020
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
# -- Importing package forwarding_itf
# -- Importing package dcachemux
# -- Compiling module datapath
# 
# Top level modules:
# 	datapath
# End time: 15:36:54 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cmp_module.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:54 on Apr 30,2020
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
# End time: 15:36:54 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> 
> 
vlog -vlog01compat -work work +incdir+/job/student/hvl {/job/student/hvl/rvfimon.v}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:54 on Apr 30,2020
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
# End time: 15:36:54 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/source_tb.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:54 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hvl" /job/student/hvl/source_tb.sv 
# -- Compiling module magic_memory_dp
# -- Compiling module ParamMemory
# ** Warning: ** while parsing file included at /job/student/hvl/source_tb.sv(14)
# ** at hvl/param_memory.sv(25): (vlog-2244) Variable 'iteration' is implicitly static. You must either explicitly declare it as static or automatic
# or remove the initialization in the declaration of variable.
# -- Compiling interface rvfi_itf
# -- Compiling module shadow_memory
# -- Compiling interface tb_itf
# -- Compiling package ag_rv32i_types
# -- Compiling package source_tb_sv_unit
# -- Importing package ag_rv32i_types
# -- Compiling module source_tb
# 
# Top level modules:
# 	source_tb
# End time: 15:36:54 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 1
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/top.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 15:36:54 on Apr 30,2020
# vlog -sv -work work "+incdir+/job/student/hvl" /job/student/hvl/top.sv 
# -- Compiling package top_sv_unit
# -- Importing package dcachemux
# -- Compiling module mp3_tb
# 
# Top level modules:
# 	mp3_tb
# End time: 15:36:54 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> 
> 
vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb
# vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs=""+acc"" mp3_tb 
# Start time: 15:36:54 on Apr 30,2020
# Loading sv_std.std
# Loading work.dcachemux
# Loading work.top_sv_unit
# Loading work.mp3_tb
# Loading work.tb_itf
# Loading work.rvfi_itf
# Loading work.ag_rv32i_types
# Loading work.source_tb_sv_unit
# Loading work.source_tb
# Loading work.riscv_formal_monitor_rv32imc
# Loading work.riscv_formal_monitor_rv32imc_isa_spec
# Loading work.riscv_formal_monitor_rv32imc_insn_add
# Loading work.riscv_formal_monitor_rv32imc_insn_addi
# Loading work.riscv_formal_monitor_rv32imc_insn_and
# Loading work.riscv_formal_monitor_rv32imc_insn_andi
# Loading work.riscv_formal_monitor_rv32imc_insn_auipc
# Loading work.riscv_formal_monitor_rv32imc_insn_beq
# Loading work.riscv_formal_monitor_rv32imc_insn_bge
# Loading work.riscv_formal_monitor_rv32imc_insn_bgeu
# Loading work.riscv_formal_monitor_rv32imc_insn_blt
# Loading work.riscv_formal_monitor_rv32imc_insn_bltu
# Loading work.riscv_formal_monitor_rv32imc_insn_bne
# Loading work.riscv_formal_monitor_rv32imc_insn_c_add
# Loading work.riscv_formal_monitor_rv32imc_insn_c_addi
# Loading work.riscv_formal_monitor_rv32imc_insn_c_addi16sp
# Loading work.riscv_formal_monitor_rv32imc_insn_c_addi4spn
# Loading work.riscv_formal_monitor_rv32imc_insn_c_and
# Loading work.riscv_formal_monitor_rv32imc_insn_c_andi
# Loading work.riscv_formal_monitor_rv32imc_insn_c_beqz
# Loading work.riscv_formal_monitor_rv32imc_insn_c_bnez
# Loading work.riscv_formal_monitor_rv32imc_insn_c_j
# Loading work.riscv_formal_monitor_rv32imc_insn_c_jal
# Loading work.riscv_formal_monitor_rv32imc_insn_c_jalr
# Loading work.riscv_formal_monitor_rv32imc_insn_c_jr
# Loading work.riscv_formal_monitor_rv32imc_insn_c_li
# Loading work.riscv_formal_monitor_rv32imc_insn_c_lui
# Loading work.riscv_formal_monitor_rv32imc_insn_c_lw
# Loading work.riscv_formal_monitor_rv32imc_insn_c_lwsp
# Loading work.riscv_formal_monitor_rv32imc_insn_c_mv
# Loading work.riscv_formal_monitor_rv32imc_insn_c_or
# Loading work.riscv_formal_monitor_rv32imc_insn_c_slli
# Loading work.riscv_formal_monitor_rv32imc_insn_c_srai
# Loading work.riscv_formal_monitor_rv32imc_insn_c_srli
# Loading work.riscv_formal_monitor_rv32imc_insn_c_sub
# Loading work.riscv_formal_monitor_rv32imc_insn_c_sw
# Loading work.riscv_formal_monitor_rv32imc_insn_c_swsp
# Loading work.riscv_formal_monitor_rv32imc_insn_c_xor
# Loading work.riscv_formal_monitor_rv32imc_insn_div
# Loading work.riscv_formal_monitor_rv32imc_insn_divu
# Loading work.riscv_formal_monitor_rv32imc_insn_jal
# Loading work.riscv_formal_monitor_rv32imc_insn_jalr
# Loading work.riscv_formal_monitor_rv32imc_insn_lb
# Loading work.riscv_formal_monitor_rv32imc_insn_lbu
# Loading work.riscv_formal_monitor_rv32imc_insn_lh
# Loading work.riscv_formal_monitor_rv32imc_insn_lhu
# Loading work.riscv_formal_monitor_rv32imc_insn_lui
# Loading work.riscv_formal_monitor_rv32imc_insn_lw
# Loading work.riscv_formal_monitor_rv32imc_insn_mul
# Loading work.riscv_formal_monitor_rv32imc_insn_mulh
# Loading work.riscv_formal_monitor_rv32imc_insn_mulhsu
# Loading work.riscv_formal_monitor_rv32imc_insn_mulhu
# Loading work.riscv_formal_monitor_rv32imc_insn_or
# Loading work.riscv_formal_monitor_rv32imc_insn_ori
# Loading work.riscv_formal_monitor_rv32imc_insn_rem
# Loading work.riscv_formal_monitor_rv32imc_insn_remu
# Loading work.riscv_formal_monitor_rv32imc_insn_sb
# Loading work.riscv_formal_monitor_rv32imc_insn_sh
# Loading work.riscv_formal_monitor_rv32imc_insn_sll
# Loading work.riscv_formal_monitor_rv32imc_insn_slli
# Loading work.riscv_formal_monitor_rv32imc_insn_slt
# Loading work.riscv_formal_monitor_rv32imc_insn_slti
# Loading work.riscv_formal_monitor_rv32imc_insn_sltiu
# Loading work.riscv_formal_monitor_rv32imc_insn_sltu
# Loading work.riscv_formal_monitor_rv32imc_insn_sra
# Loading work.riscv_formal_monitor_rv32imc_insn_srai
# Loading work.riscv_formal_monitor_rv32imc_insn_srl
# Loading work.riscv_formal_monitor_rv32imc_insn_srli
# Loading work.riscv_formal_monitor_rv32imc_insn_sub
# Loading work.riscv_formal_monitor_rv32imc_insn_sw
# Loading work.riscv_formal_monitor_rv32imc_insn_xor
# Loading work.riscv_formal_monitor_rv32imc_insn_xori
# Loading work.riscv_formal_monitor_rv32imc_rob
# Loading work.shadow_memory
# Loading work.rs2mux
# Loading work.rs1mux
# Loading work.regfilemux
# Loading work.alumux
# Loading work.cmpmux
# Loading work.marmux
# Loading work.pcmux
# Loading work.rv32i_types
# Loading work.control_itf
# Loading work.mp3_sv_unit
# Loading work.mp3
# Loading work.forwarding_itf
# Loading work.datapath_sv_unit
# Loading work.datapath
# Loading work.register_sv_unit
# Loading work.register
# Loading work.ctrl_word_register
# Loading work.pc_register
# Loading work.regfile
# Loading work.btb_sv_unit
# Loading work.btb
# Loading work.btb_col
# Loading work.alu_sv_unit
# Loading work.alu
# Loading work.cmp_module_sv_unit
# Loading work.cmp_module
# Loading work.multiplier_sv_unit
# Loading work.multiplier
# Loading work.multiplier_unsigned
# Loading work.divider_sv_unit
# Loading work.divider
# Loading work.divider_unsigned
# Loading work.control_rom_sv_unit
# Loading work.control_rom
# Loading work.mp3_cache
# Loading work.cache
# Loading work.cache_control
# Loading work.cache_datapath
# Loading work.data_array
# Loading work.array
# Loading work.bus_adapter
# Loading work.cache_arbiter
# Loading work.l2_cache
# Loading work.l2_control
# Loading work.l2_datapath
# Loading work.pLRU_tree
# Loading work.tree_node
# Loading work.ewb
# Loading work.cacheline_adaptor
# Loading work.ParamMemory
# ** Warning: (vsim-3015) /job/student/hvl/source_tb.sv(228): [PCDPC] - Port size (5) does not match connection size (32) for port 'rvfi_rd_addr'. The port definition is at: /job/student/hvl/rvfimon.v(21).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb/tb/monitor File: /job/student/hvl/rvfimon.v
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(129): Variable '/mp3_tb/itf/data_rdata' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb File: /job/student/hvl/top.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(128): Variable '/mp3_tb/itf/data_resp' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb File: /job/student/hvl/top.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(120): Variable '/mp3_tb/itf/inst_rdata' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb File: /job/student/hvl/top.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(119): Variable '/mp3_tb/itf/inst_resp' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp3_tb File: /job/student/hvl/top.sv
VSIM 41> 
> 
add wave *
VSIM 42> view structure
VSIM 43> # 
# <EOF>
# 0: RVMODEL NULL (Expected)
# End time: 15:36:54 on Apr 30,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 5

```

</details>


### Targeted Tests: 
<ul>
<li> <b>cp1_cache</b> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png" alt="success" ></img></li>
<li> <b>cp2</b> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png" alt="success" ></img></li>
<li> <b>cp3</b> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png" alt="success" ></img></li>
<li> <b>cp4</b> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png" alt="success" ></img></li>
<li> <b>cp5_comp1</b> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png" alt="success" ></img><details>
<summary>Competition Details</summary>

```
The following performance metrics are available:
 - Time (ns): 590065
 - Power (mW): 784.05
 - FMax  (MHz): 105.3
Please note these results may not be accurate if you didn't pass timing.
```

</details>
</li>
<li> <b>cp5_comp2_m</b> <img alt="failure" width="13" height="13" src="https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png" ></img></li>
<li> <b>cp5_comp3</b> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png" alt="success" ></img><details>
<summary>Competition Details</summary>

```
The following performance metrics are available:
 - Time (ns): 979555
 - Power (mW): 719.95
 - FMax  (MHz): 105.3
Please note these results may not be accurate if you didn't pass timing.
```

</details>
</li>
</ul>

### Timing ![Success][success]
Your design has an FMax of 105.3 MHz.

---
Staff use: 5eaaee6d52680ce0e28d29c6

[success]: https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png 
[failure]: https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png 