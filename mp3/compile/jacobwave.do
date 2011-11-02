onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /mp3_cpu/controlunit/clk
add wave -noupdate -format Literal -radix hexadecimal -expand /mp3_cpu/pipelinedatapath/ourregfile/ram
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/ra
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/pcinstaddr
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/newpcin
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/instout
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/instructionfetch/nextpc
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/pipelinedatapath/instructionfetch/loadpc
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/instructionfetch/newpcin
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/instructionfetch/pcmuxout
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/pipelinedatapath/instructionfetch/pcmuxsel
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/mem_c_out
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/if_c_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 209
configure wave -valuecolwidth 274
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
WaveRestoreZoom {0 ns} {367 ns}
