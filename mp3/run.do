transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work  {./hdl/rv32i_mux_types.sv}
vlog -sv -work work  {./hdl/rv32i_types.sv}
vlog -sv -work work  {./hdl/alu.sv}
vlog -sv -work work  {./hdl/bht.sv}
vlog -sv -work work  {./hdl/btb.sv}
vlog -sv -work work  {./hdl/btb_col.sv}
vlog -sv -work work  {./hdl/control_itf.sv}
vlog -sv -work work  {./hdl/forwarding/forwarding_itf.sv}
vlog -sv -work work  {./hdl/cmp_module.sv}
vlog -sv -work work  {./hdl/control_rom.sv}
vlog -sv -work work  {./hdl/datapath.sv}
vlog -sv -work work  {./hdl/execute_controller.sv}
vlog -sv -work work  {./hdl/ir.sv}
vlog -sv -work work  {./hdl/mp3.sv}
vlog -sv -work work  {./hdl/pc_reg.sv}
vlog -sv -work work  {./hdl/regfile.sv}
vlog -sv -work work  {./hdl/register.sv}
vlog -sv -work work  {./hdl/cache/array.sv}
vlog -sv -work work  {./hdl/cache/bus_adapter.sv}
vlog -sv -work work  {./hdl/cache/cache_arbiter.sv}
vlog -sv -work work  {./hdl/cache/cache_control.sv}
vlog -sv -work work  {./hdl/cache/cache_datapath.sv}
vlog -sv -work work  {./hdl/cache/cache.sv}
vlog -sv -work work  {./hdl/cache/cacheline_adaptor.sv}
vlog -sv -work work  {./hdl/cache/data_array.sv}
vlog -sv -work work  {./hdl/cache/l2_cache.sv}
vlog -sv -work work  {./hdl/cache/l2_control.sv}
vlog -sv -work work  {./hdl/cache/l2_datapath.sv}
vlog -sv -work work  {./hdl/cache/mp3_cache.sv}
vlog -sv -work work  {./hdl/forwarding/forwarding.sv}
vlog -sv -work work  {./hdl/muldiv/divider.sv}
vlog -sv -work work  {./hdl/muldiv/mult_precomputed.sv}
vlog -sv -work work  {./hdl/muldiv/multiplier.sv}




vlog -sv -work work  {./hvl/magic_dual_port.sv}
vlog -sv -work work  {./hvl/param_memory.sv}
vlog -sv -work work  {./hvl/shadow_memory.sv}
vlog -sv -work work  {./hvl/rvfimon.v}
vlog -sv -work work  {./hvl/source_tb.sv}
vlog -sv -work work  {./hvl/rvfi_itf.sv}
vlog -sv -work work  {./hvl/tb_itf.sv}
vlog -sv -work work  {./hvl/top.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixv_ver -L stratixv_hssi_ver -L stratixv_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb

run -all 