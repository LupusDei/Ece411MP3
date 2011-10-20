onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /mp2_cpu/reset_l
add wave -noupdate -format Logic /mp2_cpu/start_h
add wave -noupdate -format Logic -radix hexadecimal /mp2_cpu/clk
add wave -noupdate -format Literal /mp2_cpu/thedatapath/pcout
add wave -noupdate -format Literal /mp2_cpu/address
add wave -noupdate -format Logic /mp2_cpu/mwritel_l
add wave -noupdate -format Logic /mp2_cpu/mwriteh_l
add wave -noupdate -format Logic -radix hexadecimal /mp2_cpu/mread_l
add wave -noupdate -format Literal /mp2_cpu/datain
add wave -noupdate -format Literal /mp2_cpu/dataout
add wave -noupdate -format Literal -expand /mp2_cpu/thedatapath/aregfile/ram
add wave -noupdate -format Logic /mp2_cpu/controlunit/immediate
add wave -noupdate -format Literal -radix binary /mp2_cpu/controlunit/opcode
add wave -noupdate -format Literal /mp2_cpu/thedatapath/aregfile/rfmuxout
add wave -noupdate -format Logic /mp2_cpu/thedatapath/aregfile/regwrite
add wave -noupdate -format Literal /mp2_cpu/thedatapath/aregfile/destreg
add wave -noupdate -format Literal /mp2_cpu/thedatapath/aregfile/rfaout
add wave -noupdate -format Literal /mp2_cpu/thedatapath/aregfile/rfbout
add wave -noupdate -format Literal /mp2_cpu/thedatapath/alumuxout
add wave -noupdate -format Literal /mp2_cpu/thedatapath/alumuxsel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4815 ns} 0}
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
update
WaveRestoreZoom {4060 ns} {5060 ns}
