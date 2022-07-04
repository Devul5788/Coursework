transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/Downloads/playground1/playground1 {U:/Downloads/playground1/playground1/adder9.sv}
vlog -sv -work work +incdir+U:/Downloads/playground1/playground1 {U:/Downloads/playground1/playground1/adder1.sv}
vlog -sv -work work +incdir+U:/Downloads/playground1/playground1 {U:/Downloads/playground1/playground1/HexDriver.sv}
vlog -sv -work work +incdir+U:/Downloads/playground1/playground1 {U:/Downloads/playground1/playground1/reg8.sv}
vlog -sv -work work +incdir+U:/Downloads/playground1/playground1 {U:/Downloads/playground1/playground1/counter.sv}
vlog -sv -work work +incdir+U:/Downloads/playground1/playground1 {U:/Downloads/playground1/playground1/control.sv}
vlog -sv -work work +incdir+U:/Downloads/playground1/playground1 {U:/Downloads/playground1/playground1/multiplier.sv}

vlog -sv -work work +incdir+U:/Downloads/playground1/playground1 {U:/Downloads/playground1/playground1/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
