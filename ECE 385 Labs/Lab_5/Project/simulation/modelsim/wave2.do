onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /test_bench_2/SW
add wave -noupdate -radix hexadecimal /test_bench_2/Clk
add wave -noupdate -radix hexadecimal /test_bench_2/PC_sim
add wave -noupdate -radix hexadecimal /test_bench_2/IR_sim
add wave -noupdate -radix hexadecimal /test_bench_2/MDR_sim
add wave -noupdate -radix hexadecimal /test_bench_2/MAR_sim
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/state_controller/State
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/state_controller/State
add wave -noupdate -radix hexadecimal {/test_bench_2/topTest/slc/d0/RF_OUT[0]}
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/SR2_OUT
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/SR2_OUT
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/LD_MAR
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/BUS
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/RF_0/Data_Out
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/RF_1/Data_Out
add wave -noupdate /test_bench_2/topTest/slc/d0/LD_REG
add wave -noupdate /test_bench_2/topTest/slc/d0/GateMDR
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/ALUK_OUT
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/SR1_OUT
add wave -noupdate /test_bench_2/topTest/slc/d0/SR1MUX_OUT
add wave -noupdate /test_bench_2/topTest/slc/d0/SR1MUX
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {549490 ps} 0}
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
WaveRestoreZoom {445730 ps} {713342 ps}
