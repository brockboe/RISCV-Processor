## Generated SDC file "mp3.out.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"

## DATE    "Sat Apr 18 15:54:19 2020"

##
## DEVICE  "EP2AGX45DF25I3"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 10.000 -waveform { 0.000 5.000 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[8]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[9]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[10]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[11]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[12]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[13]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[14]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[15]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[16]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[17]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[18]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[19]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[20]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[21]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[22]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[23]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[24]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[25]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[26]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[27]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[28]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[29]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[30]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[31]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[32]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[33]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[34]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[35]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[36]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[37]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[38]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[39]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[40]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[41]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[42]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[43]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[44]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[45]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[46]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[47]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[48]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[49]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[50]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[51]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[52]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[53]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[54]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[55]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[56]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[57]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[58]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[59]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[60]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[61]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[62]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_i[63]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {clk}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {resp_i}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {rst}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[8]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[9]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[10]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[11]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[12]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[13]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[14]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[15]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[16]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[17]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[18]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[19]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[20]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[21]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[22]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[23]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[24]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[25]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[26]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[27]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[28]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[29]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[30]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {address_o[31]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[8]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[9]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[10]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[11]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[12]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[13]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[14]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[15]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[16]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[17]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[18]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[19]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[20]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[21]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[22]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[23]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[24]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[25]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[26]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[27]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[28]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[29]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[30]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[31]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[32]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[33]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[34]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[35]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[36]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[37]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[38]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[39]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[40]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[41]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[42]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[43]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[44]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[45]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[46]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[47]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[48]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[49]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[50]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[51]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[52]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[53]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[54]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[55]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[56]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[57]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[58]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[59]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[60]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[61]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[62]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {burst_o[63]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {read_o}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {write_o}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

