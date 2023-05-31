#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# This script is designed to be used with scripts/atomic_test_gen.py
# That script writes an assembly test for the implemented atomics
# by simply reading back the values of all the regs/mem locs involved
# in the atomic operation. hvl/spike_log.sv doesn't know how to print
# atomics, and I don't want to teach it so we simply filter out
# any atomics that Spike prints by checking line length.

./run_spike.py $1
cat  sim/spike_gold.log | cut -c -50 > sim/tmp
mv sim/tmp sim/filtered_csrs_spike_gold.log
MSG=$(diff -s sim/spike.log sim/filtered_csrs_spike_gold.log)
echo -e "${GREEN}${MSG}.${NC}"
