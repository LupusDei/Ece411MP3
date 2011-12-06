onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /mp3_cpu/clk
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pcinstaddr
add wave -noupdate -format Logic /mp3_cpu/stall
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/if_c_in
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/id_c_in
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/decode/id_c_out
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/ex_c_in
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/mem_c_in
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/mem_c_out
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/wb_c_in
add wave -noupdate -divider Memory
add wave -noupdate -format Logic /mp3_cpu/im_read_l
add wave -noupdate -format Logic /mp3_cpu/im_resp_h
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/instmemin
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/instout
add wave -noupdate -format Logic /mp3_cpu/dm_read_l
add wave -noupdate -format Logic /mp3_cpu/dm_resp_h
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/dataaddr
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/datamemin
add wave -noupdate -format Logic /mp3_cpu/dm_writeh_l
add wave -noupdate -format Logic /mp3_cpu/dm_writel_l
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memwritedata
add wave -noupdate -divider Pipeline
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/instructionfetch/newpcin
add wave -noupdate -format Literal -radix hexadecimal -expand /mp3_cpu/pipelinedatapath/ourregfile/ram
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/execution/srcregin
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/execution/ina
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/execution/inb
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/memaccess/aluresult
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/memaccess/srcin
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/writeback/aludata
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/writeback/memdata
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/writeback/wb_c_in
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/pipelinedatapath/writeback/regdatain
add wave -noupdate -format Logic /mp3_cpu/pipelinedatapath/memaccess/loadnzp
add wave -noupdate -format Logic /mp3_cpu/pipelinedatapath/memaccess/n
add wave -noupdate -format Logic /mp3_cpu/pipelinedatapath/memaccess/z
add wave -noupdate -format Logic /mp3_cpu/pipelinedatapath/memaccess/p
add wave -noupdate -divider iCache
add wave -noupdate -format Logic /mp3_cpu/mymp3_cache/icache/hit
add wave -noupdate -format Logic /mp3_cpu/mymp3_cache/icache/miss
add wave -noupdate -format Logic /mp3_cpu/mymp3_cache/icache/in_idlehit
add wave -noupdate -format Logic /mp3_cpu/mymp3_cache/icache/in_load
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/mymp3_cache/icache/way0/adataarray/data
add wave -noupdate -divider dCache
add wave -noupdate -format Logic /mp3_cpu/mymp3_cache/dcache/hit
add wave -noupdate -format Logic /mp3_cpu/mymp3_cache/dcache/miss
add wave -noupdate -format Logic /mp3_cpu/mymp3_cache/dcache/in_idlehit
add wave -noupdate -format Logic /mp3_cpu/mymp3_cache/dcache/in_load
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/mymp3_cache/dcache/way0/adataarray/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3845 ns} 0}
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
WaveRestoreZoom {531 ns} {2078 ns}
