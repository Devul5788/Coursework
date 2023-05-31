#!/bin/bash
../bin/generate_memory_file.sh mul_div_test.s && cp ../sim/bin/mul_div_test.elf . && /class/ece411/software/spike_new/bin/spike --isa=rv32im -m0x40000000:0x80000000 --log-commits mul_div_test.elf 2>&1 | head -n $1
