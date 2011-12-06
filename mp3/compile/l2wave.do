onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /mp3_cache/reset_l
add wave -noupdate -format Logic /mp3_cache/clk
add wave -noupdate -format Logic /mp3_cache/dm_read_l
add wave -noupdate -format Logic /mp3_cache/dm_writeh_l
add wave -noupdate -format Logic /mp3_cache/dm_writel_l
add wave -noupdate -format Logic /mp3_cache/im_read_l
add wave -noupdate -format Logic /mp3_cache/im_writeh_l
add wave -noupdate -format Logic /mp3_cache/im_writel_l
add wave -noupdate -format Logic /mp3_cache/dmiss
add wave -noupdate -format Logic /mp3_cache/dm_resp_h
add wave -noupdate -format Logic /mp3_cache/imiss
add wave -noupdate -format Logic /mp3_cache/im_resp_h
add wave -noupdate -format Literal -radix hexadecimal /mp3_cache/instmemin
add wave -noupdate -format Literal -radix hexadecimal /mp3_cache/datamemin
add wave -noupdate -format Literal -radix hexadecimal /mp3_cache/dataaddr
add wave -noupdate -format Literal -radix hexadecimal /mp3_cache/pcinstaddr
add wave -noupdate -format Literal -radix hexadecimal /mp3_cache/memwritedata
add wave -noupdate -format Literal -radix hexadecimal /mp3_cache/icache/way0/adataarray/data
add wave -noupdate -format Literal -radix hexadecimal /mp3_cache/megal2/datapath/wayunit7/way0/adataarray/data
add wave -noupdate -format Literal -radix decimal /mp3_cache/megal2/datapath/trueness/index
add wave -noupdate -format Logic /mp3_cache/megal2/datapath/trueness/hit
add wave -noupdate -format Literal -radix decimal /mp3_cache/megal2/datapath/trueness/lruout
add wave -noupdate -format Literal -radix decimal /mp3_cache/megal2/datapath/trueness/unit7/waylrureg/ram
add wave -noupdate -format Logic /mp3_cache/pram/pmread_l
add wave -noupdate -format Logic /mp3_cache/pram/pmwrite_l
add wave -noupdate -format Logic /mp3_cache/pram/pmresp_h
add wave -noupdate -format Literal -radix hexadecimal /mp3_cache/pram/pmdataout
add wave -noupdate -format Literal -radix hexadecimal /mp3_cache/pram/pmdatain
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
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
WaveRestoreZoom {0 ns} {1 us}
