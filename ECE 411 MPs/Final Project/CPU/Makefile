SHELL = /bin/bash -o pipefail

#Collect All Source Files
PKG_SRCS := $(shell find $(PWD)/pkg -name '*.sv')
HDL_SRCS := $(shell find $(PWD)/hdl -name '*.sv' -o -name '*.c')
HVL_SRCS := $(shell find $(PWD)/hvl -name '*.sv' -o -name '*.v' -o -name "*.c")
SRCS := $(PKG_SRCS) $(HDL_SRCS) $(HVL_SRCS)
MULT_SRC := /software/Synopsys-2021_x86_64/icc/R-2020.09-SP4/dw/sim_ver/DW_mult_seq.v
DIV_SRC := /software/Synopsys-2021_x86_64/icc/R-2020.09-SP4/dw/sim_ver/DW_div_seq.v
IP_SRCS := $(MULT_SRC) $(DIV_SRC)

SYNTH_TCL := $(CURDIR)/synthesis.tcl

VCS_FLAGS= -full64 -lca -sverilog +lint=all,noNS -timescale=1ns/10ps -debug_acc+all -kdb -fsdb -msg_config=../warn.config -l compile.log +incdir+../pkg +incdir+../hvl +incdir+/software/Synopsys-2021_x86_64/icc/R-2020.09-SP4/dw/sim_ver+ +define+DW_SUPPRESS_WARN

sim/simv: $(SRCS)
	mkdir -p sim
	cd sim && vcs $(SRCS) $(IP_SRCS) $(VCS_FLAGS) -top mp4_tb


sim/beh_uart_dut : $(SRCS)
	mkdir -p sim
	cd sim && vcs $(SRCS) $(IP_SRCS) $(VCS_FLAGS) -msg_config=../warn.config -l compile_dut.log -top beh_uart_tb -o beh_uart

run_uart_dut: sim/beh_uart_dut
	cd sim && ./beh_uart -l simulation_dut.log

run: sim/simv $(ASM)
	bin/generate_memory_file.sh $(ASM) 2>&1 | tee sim/asm.log
	cd sim && ./simv -l simulation.log

synth: $(SRCS) $(SYNTH_TCL)
	mkdir -p synth/reports
	cd synth && dc_shell -f $(SYNTH_TCL)  2>&1 | tee synthesis.log
	@if grep -q -i -f synth-error-codes synth/synthesis.log; then \
		echo -e "\033[0;31m Fix errors/warnings below \033[0m"; \
		grep -H -i -n -f synth-error-codes synth/synthesis.log; exit 1; \
	else \
		echo -e "\033[0;32m Synthesis Successful \033[0m Check timing and power report under synth/reports/"; \
    fi

report_power: $(ASM) run
	cd sim && fsdb2saif dump.fsdb
	cd synth && dc_shell -f ../report_power.tcl 2>&1 | tee report_power.log

clean:
	rm -rf sim synth

.PHONY: clean
.PHONY: run
