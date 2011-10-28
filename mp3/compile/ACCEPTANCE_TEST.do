echo "--- Executing initialization force file for the Acceptance Tests"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /mp3_cpu/reset_l
add wave -hex /mp3_cpu/clk
add wave -hex /mp3_cpu/if_c_in
add wave -hex /mp3_cpu/id_c_in
add wave -hex /mp3_cpu/ex_c_in
add wave -hex /mp3_cpu/wb_c_in
add wave -hex /mp3_cpu/im_resp_h
add wave -hex /mp3_cpu/im_read_l
add wave -hex /mp3_cpu/im_writeh_l
add wave -hex /mp3_cpu/im_writel_l
add wave -hex /mp3_cpu/pcinstaddr
add wave -hex /mp3_cpu/instMemIn
add wave -hex /mp3_cpu/instOut
add wave -hex /mp3_cpu/pipelinedatapath/aluResult
add wave -hex /mp3_cpu/pipelinedatapath/RegDataIn
add wave -hex /mp3_cpu/Pipelinedatapath/ourregfile/ram


force -freeze /mp3_cpu/clk 0 -repeat 50
force -freeze /mp3_cpu/clk 1 25 -repeat 50


echo "Full Instruction Tests"
echo "ADD R7, R1, R2 :  R7 <= 42 + 8"
force -freeze /mp3_cpu/Pipelinedatapath/ourregfile/ram(1) 0000000000101010
force -freeze /mp3_cpu/Pipelinedatapath/ourregfile/ram(2) 0000000000001000
force -freeze /mp3_cpu/Pipelinedatapath/ourregfile/ram(3) 0000000000000011
force -freeze /mp3_cpu/reset_l 0
run 50
force -freeze /mp3_cpu/reset_l 1

virtual signal {/mp3_cpu/Pipelinedatapath/ourregfile/ram(7) == 50 && /mp3_cpu/pcinstaddr == 8} ADD_test1
add wave -color white /mp3_cpu/ADD_test1

run 250

echo "ADD R0, R1, 11 : R0 <= 53"
virtual signal {/mp3_cpu/Pipelinedatapath/ourregfile/ram(0) == 53 && /mp3_cpu/pcinstaddr == 10} ADD_test2
add wave -color white /mp3_cpu/ADD_test2
run 50
add wave -noupdate -divider -height 32 ANDTests

echo "AND R6, R1, R2 :  R6 <= 101010 AND 00100"
virtual signal {/mp3_cpu/Pipelinedatapath/ourregfile/ram(6) == 8 && /mp3_cpu/pcinstaddr == 12} AND_test1
add wave -color white /mp3_cpu/AND_test1
run 50

run 50

echo "AND R5, R2, 5 : R5 <= 0"
virtual signal {/mp3_cpu/Pipelinedatapath/ourregfile/ram(5) == 0 && /mp3_cpu/pcinstaddr == 14} AND_test2
add wave -color white /mp3_cpu/AND_test2
run 50
 
add wave -noupdate -divider -height 32 NOTTests

echo "NOT R4, R3 : R4 <= NOT(011) Followed by a dummy instruction" 
virtual signal {/mp3_cpu/Pipelinedatapath/ourregfile/ram(4) == -4 && /mp3_cpu/pcinstaddr == 16} NOT_test1
add wave -color white /mp3_cpu/NOT_test1
run 50

run 50
