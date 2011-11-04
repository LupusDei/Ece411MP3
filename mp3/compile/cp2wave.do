onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /mp3_cpu/controlunit/clk
add wave -noupdate -format Literal -radix hexadecimal -expand /mp3_cpu/pipelinedatapath/ourregfile/ram
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/ra
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/pcinstaddr
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/newpcin
add wave -noupdate -format Logic /mp3_cpu/l1cache/im_read_l
add wave -noupdate -format Logic /mp3_cpu/l1cache/im_resp_h
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/l1cache/instmemin
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/instout
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/mem_c_out
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/if_c_in
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/id_c_in
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/ex_c_in
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/mem_c_in
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/wb_c_in
add wave -noupdate -format Literal -expand /mp3_cpu/controlunit/mem_creg/mem
add wave -noupdate -format Logic /mp3_cpu/l1cache/dm_read_l
add wave -noupdate -format Logic /mp3_cpu/l1cache/dm_resp_h
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/dataaddr
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/datamemin
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/dr
add wave -noupdate -format Literal /mp3_cpu/pipelinedatapath/regdatain
add wave -noupdate -format Logic /mp3_cpu/pipelinedatapath/regwrite
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1075 ns} 0}
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
WaveRestoreZoom {848 ns} {1215 ns}
