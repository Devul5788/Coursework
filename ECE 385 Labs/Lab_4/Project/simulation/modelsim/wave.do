onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/SW
add wave -noupdate /testbench/Clk
add wave -noupdate /testbench/Reset_Load_Clear
add wave -noupdate /testbench/Run
add wave -noupdate /testbench/HEX0
add wave -noupdate /testbench/HEX1
add wave -noupdate /testbench/HEX2
add wave -noupdate /testbench/HEX3
add wave -noupdate /testbench/Aval
add wave -noupdate /testbench/Bval
add wave -noupdate /testbench/Xval
add wave -noupdate /testbench/test_mult/Controller/curr_state
add wave -noupdate /testbench/test_mult/Controller/counter/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {75840 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {262500 ps}
