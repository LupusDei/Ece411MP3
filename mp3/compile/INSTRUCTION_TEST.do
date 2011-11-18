echo "--- Executing initialization force file for the Instruction Tests"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /mp3_cpu/reset_l
add wave -hex /mp3_cpu/clk
add wave -hex /mp3_cpu/if_c_in
add wave -hex /mp3_cpu/id_c_in
add wave -hex /mp3_cpu/ex_c_in
add wave -hex /mp3_cpu/mem_c_in
add wave -hex /mp3_cpu/mem_c_out
add wave -hex /mp3_cpu/pipelinedatapath/memaccess/DestReg
add wave -hex /mp3_cpu/pipelinedatapath/memaccess/loadNZP
add wave -hex /mp3_cpu/pipelinedatapath/memaccess/brInst
add wave -hex /mp3_cpu/pipelinedatapath/decode/B
add wave -hex /mp3_cpu/pipelinedatapath/decode/instIn
add wave -hex /mp3_cpu/pipelinedatapath/instructionfetch/pcmuxsel
add wave -hex /mp3_cpu/pipelinedatapath/instructionfetch/newpcin
add wave -hex /mp3_cpu/wb_c_in
add wave -hex /mp3_cpu/im_resp_h
add wave -hex /mp3_cpu/im_read_l
add wave -hex /mp3_cpu/dm_resp_h
add wave -hex /mp3_cpu/dm_read_l
add wave -hex /mp3_cpu/dm_writeh_l
add wave -hex /mp3_cpu/dm_writel_l
add wave -hex /mp3_cpu/dataaddr
add wave -hex /mp3_cpu/datamemin
add wave -hex /mp3_cpu/MEMWriteData
add wave -hex /mp3_cpu/pcinstaddr
add wave -hex /mp3_cpu/instMemIn
add wave -hex /mp3_cpu/instOut
add wave -hex /mp3_cpu/pipelinedatapath/aluResult
add wave -hex /mp3_cpu/pipelinedatapath/RegDataIn
add wave -hex /mp3_cpu/Pipelinedatapath/ourregfile/ram

add wave /mp3_cpu/pipelinedatapath/memaccess/n
add wave /mp3_cpu/pipelinedatapath/memaccess/z
add wave /mp3_cpu/pipelinedatapath/memaccess/p

force -freeze /mp3_cpu/clk 0 -repeat 50
force -freeze /mp3_cpu/clk 1 25 -repeat 50
force -freeze /mp3_cpu/reset_l 0
run 50
force -freeze /mp3_cpu/reset_l 1

echo "LEA R3, 8   pc = 0 -- R3 <= 0 + 2 + 16 = 18"
virtual signal {/mp3_cpu/Pipelinedatapath/ourregfile/ram(3) == 18 && /mp3_cpu/pcinstaddr == 10} LEA_test1
add wave -color white /mp3_cpu/LEA_test1

run 6
force -freeze /mp3_cpu/instMemIn 1110011000001000
run 50
force -freeze /mp3_cpu/instMemIn 0000000000000000
run 44
run 200

