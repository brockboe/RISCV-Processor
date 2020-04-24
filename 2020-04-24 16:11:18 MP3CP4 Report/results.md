# AG Report Generated 2020-04-24 16:11
This is a report about mp3cp4 generated for ZBA at 2020-04-24 16:11. The autograder used commit ``644f46396910`` as a starting point. If you have any questions about this report, please contact the TAs on Piazza.
### Quick Results:
 - Compilation: NO
 - Targeted: 0/4 (0.0%)
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
    Info: Processing started: Fri Apr 24 21:11:02 2020
Info: Command: quartus_map mp3 -c mp3
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Info (20030): Parallel compilation is enabled and will use 4 of the 4 processors detected
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
Error (10149): Verilog HDL Declaration error at datapath.sv(255): identifier "pipereg_ifid_taken" is already declared in the present scope File: /job/student/hdl/datapath.sv Line: 255
Error (10149): Verilog HDL Declaration error at datapath.sv(314): identifier "pipereg_idex_taken" is already declared in the present scope File: /job/student/hdl/datapath.sv Line: 314
Error (10170): Verilog HDL syntax error at datapath.sv(485) near text: "bht";  expecting ";". Check for and fix any syntax errors that appear immediately before or at the specified keyword. The Intel FPGA Knowledge Database contains many articles with specific details on how to resolve this error. Visit the Knowledge Database at https://www.altera.com/support/support-resources/knowledge-base/search.html and search for this specific error message number. File: /job/student/hdl/datapath.sv Line: 485
Error (10112): Ignored design unit "datapath" at datapath.sv(19) due to previous errors File: /job/student/hdl/datapath.sv Line: 19
Info (12021): Found 0 design units, including 0 entities, in source file hdl/datapath.sv
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cmp_module.sv
    Info (12023): Found entity 1: cmp_module File: /job/student/hdl/cmp_module.sv Line: 18
Info (12021): Found 1 design units, including 1 entities, in source file hdl/alu.sv
    Info (12023): Found entity 1: alu File: /job/student/hdl/alu.sv Line: 3
Info (144001): Generated suppressed messages file /job/student/output_files/mp3.map.smsg
Error: Quartus Prime Analysis & Synthesis was unsuccessful. 4 errors, 1 warning
    Error: Peak virtual memory: 986 megabytes
    Error: Processing ended: Fri Apr 24 21:11:15 2020
    Error: Elapsed time: 00:00:13
    Error: Total CPU time (on all processors): 00:00:36

```

</details>


### Targeted Tests: 
<ul>
<li> <b>cp1_cache</b> <img src="https://upload.wikimedia.org/wikipedia/en/thumb/7/74/Ambox_warning_yellow.svg/40px-Ambox_warning_yellow.svg.png" alt="error" width="13" height="13" ></img><details>
<summary>Error Occurred</summary>

```
An error occured when running this test.
If your code did not successfully compile, that is likely the reason.
If your code did compile, then please reach out to a TA on Piazza
```

</details>
</li>
<li> <b>cp2</b> <img src="https://upload.wikimedia.org/wikipedia/en/thumb/7/74/Ambox_warning_yellow.svg/40px-Ambox_warning_yellow.svg.png" alt="error" width="13" height="13" ></img><details>
<summary>Error Occurred</summary>

```
An error occured when running this test.
If your code did not successfully compile, that is likely the reason.
If your code did compile, then please reach out to a TA on Piazza
```

</details>
</li>
<li> <b>cp3</b> <img src="https://upload.wikimedia.org/wikipedia/en/thumb/7/74/Ambox_warning_yellow.svg/40px-Ambox_warning_yellow.svg.png" alt="error" width="13" height="13" ></img><details>
<summary>Error Occurred</summary>

```
An error occured when running this test.
If your code did not successfully compile, that is likely the reason.
If your code did compile, then please reach out to a TA on Piazza
```

</details>
</li>
<li> <b>cp4</b> <img src="https://upload.wikimedia.org/wikipedia/en/thumb/7/74/Ambox_warning_yellow.svg/40px-Ambox_warning_yellow.svg.png" alt="error" width="13" height="13" ></img><details>
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
Staff use: 5ea3547e52680ce0e28d1971

[success]: https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png 
[failure]: https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png 