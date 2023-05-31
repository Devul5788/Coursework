#!/bin/bash

SPIKE_FILES="testcode/mp4-cp2.s testcode/mp4-cp3.s testcode/lr_sc_test.s"
SPIKE_FILES="${SPIKE_FILES} $(find testcode -name nebu-*)"
SPIKE_FILES="${SPIKE_FILES} testcode/comp/comp1_rv32i.elf testcode/comp/comp2_rv32im.elf testcode/comp/comp3_rv32i.elf"
SPIKE_FILES="${SPIKE_FILES} testcode/mul_div_test.s"
SPIKE_FILES="${SPIKE_FILES} testcode/lr_sc_test.s"
SPIKE_FILES="${SPIKE_FILES} testcode/fence_test.s"
for file in $SPIKE_FILES; do
  ./run_spike.py $file
done

printf "\nRunning atomic tests using filter_atomics_run_spike.sh.\n"

ATOMIC_FILES="testcode/atomics_test.s testcode/autogen_atomic_test.s"
for file in $ATOMIC_FILES; do
  ./filter_atomics_run_spike.sh $file
done

./filter_csrs_run_spike.sh testcode/csr_test.s
./run_spike.py testcode/coremark/coremark_rv32im.elf
