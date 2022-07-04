onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /test_bench_2/SW
add wave -noupdate -radix hexadecimal /test_bench_2/Clk
add wave -noupdate -radix hexadecimal /test_bench_2/Run
add wave -noupdate -radix hexadecimal /test_bench_2/Continue
add wave -noupdate -radix hexadecimal /test_bench_2/LED
add wave -noupdate -radix decimal /test_bench_2/PC_sim
add wave -noupdate -radix hexadecimal /test_bench_2/IR_sim
add wave -noupdate -radix hexadecimal /test_bench_2/MDR_sim
add wave -noupdate -radix hexadecimal /test_bench_2/MAR_sim
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/state_controller/State
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/state_controller/State
add wave -noupdate -radix hexadecimal {/test_bench_2/topTest/slc/d0/RF_OUT[0]}
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/SR2_OUT
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/SR2_OUT
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/BUS
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/RF_1/Data_Out
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/RF_2/Data_Out
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/RF_3/Data_Out
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/RF_4/Data_Out
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/RF_5/Data_Out
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/RF_6/Data_Out
add wave -noupdate -radix hexadecimal /test_bench_2/topTest/slc/d0/RF_7/Data_Out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1987357 ps} 0}
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
WaveRestoreZoom {5254375 ps} {7091875 ps}
