onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /test_bench_2/SW
add wave -noupdate -radix hexadecimal /test_bench_2/Clk
add wave -noupdate -radix hexadecimal /test_bench_2/Run
add wave -noupdate -radix hexadecimal /test_bench_2/Continue
add wave -noupdate -radix hexadecimal /test_bench_2/LED
add wave -noupdate -radix hexadecimal /test_bench_2/HEX0
add wave -noupdate -radix hexadecimal /test_bench_2/HEX1
add wave -noupdate -radix hexadecimal /test_bench_2/HEX2
add wave -noupdate -radix hexadecimal /test_bench_2/HEX3
add wave -noupdate -radix hexadecimal /test_bench_2/PC_sim
add wave -noupdate -radix hexadecimal /test_bench_2/IR_sim
add wave -noupdate -radix hexadecimal /test_bench_2/MDR_sim
add wave -noupdate -radix hexadecimal /test_bench_2/MAR_sim
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/state_controller/State
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/state_controller/State
add wave -noupdate -radix hexadecimal {/test_bench_2/topTest/slc/d0/RF_OUT[0]}
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/SR2_OUT
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/SR2_OUT
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/ADDER_OUT
add wave -noupdate -radix decimal /test_bench_2/topTest/slc/d0/ADDER_B
add wave -noupdate -radix decimal /test_bench_2/topTest/slc/d0/ADDER_A
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/LD_MAR
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/BUS
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/LD_PC
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/PC_DATA_FROM_MUX
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/PC_REG/D
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/PC_REG/Data_Out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1158579 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 277
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {995658 ps} {1258162 ps}
