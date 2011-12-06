echo "--- Executing initialization force file for the L2 Tests"

quietly WaveActivateNextPane {} 0
delete wave *

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
add wave -noupdate -format Literal -radix hexadecimal /mp3_cache/dcache/way0/adataarray/data
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


force -freeze /mp3_cache/clk 0 -repeat 50
force -freeze /mp3_cache/clk 1 25 -repeat 50

force -freeze /mp3_cache/dm_writeh_l 1
force -freeze /mp3_cache/dm_writel_l 1
force -freeze /mp3_cache/im_writeh_l 1
force -freeze /mp3_cache/im_writel_l 1
force -freeze /mp3_cache/dm_read_l 1
force -freeze /mp3_cache/im_read_l 1
force -freeze /mp3_cache/reset_l 0
run 50
force -freeze /mp3_cache/reset_l 1
run 50


force -freeze /mp3_cache/dm_read_l 0
force -freeze /mp3_cache/dataaddr 0000000000000000
run 500
force -freeze /mp3_cache/dm_read_l 1

force -freeze /mp3_cache/dataaddr 0000000000010000
force -freeze /mp3_cache/dm_writeh_l 0
force -freeze /mp3_cache/dm_writel_l 0
force -freeze /mp3_cache/memwritedata 0000000001000010
run 500

force -freeze /mp3_cache/dataaddr 0000000010010000
force -freeze /mp3_cache/memwritedata 0000000001000011
run 500

force -freeze /mp3_cache/dataaddr 0000000110010000
force -freeze /mp3_cache/memwritedata 0000000001000100
run 500

force -freeze /mp3_cache/dm_writeh_l 1
force -freeze /mp3_cache/dm_writel_l 1
run 500


force -freeze /mp3_cache/dataaddr 0000000000010000
force -freeze /mp3_cache/dm_read_l 0
run 500
