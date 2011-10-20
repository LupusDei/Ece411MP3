onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /mp1_cpu/reset_l
add wave -noupdate -format Logic /mp1_cpu/start_h
add wave -noupdate -format Logic /mp1_cpu/thedatapath/clk
add wave -noupdate -format Literal /mp1_cpu/thedatapath/pcout
add wave -noupdate -format Literal /mp1_cpu/thedatapath/address
add wave -noupdate -format Logic /mp1_cpu/mread_l
add wave -noupdate -format Logic /mp1_cpu/mwriteh_l
add wave -noupdate -format Logic /mp1_cpu/mwritel_l
add wave -noupdate -format Literal -radix hexadecimal /mp1_cpu/thedatapath/datain
add wave -noupdate -format Literal /mp1_cpu/dataout
add wave -noupdate -format Literal -expand /mp1_cpu/thedatapath/aregfile/ram
add wave -noupdate -format Literal -radix binary /mp1_cpu/opcode
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5 ns} 0}
configure wave -namecolwidth 256
configure wave -valuecolwidth 55
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
update
WaveRestoreZoom {0 ns} {755 ns}
