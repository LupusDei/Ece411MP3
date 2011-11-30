echo "--- Executing initialization force file for the Acceptance Tests"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /mp3_cpu/reset_l
add wave -hex /mp3_cpu/clk
add wave -hex /mp3_cpu/if_c_in
add wave -hex /mp3_cpu/id_c_in
add wave -hex /mp3_cpu/ex_c_in
add wave -hex /mp3_cpu/mem_c_in
add wave -hex /mp3_cpu/mem_c_out
add wave -hex /mp3_cpu/wb_c_in
add wave -hex /mp3_cpu/pipelinedatapath/aluina
add wave -hex /mp3_cpu/pipelinedatapath/memaccess/DestReg
add wave -hex /mp3_cpu/pipelinedatapath/memaccess/loadNZP
add wave -hex /mp3_cpu/pipelinedatapath/memaccess/brInst
add wave -hex /mp3_cpu/pipelinedatapath/decode/B
add wave -hex /mp3_cpu/pipelinedatapath/decode/trapvect8
add wave -hex /mp3_cpu/pipelinedatapath/memdataout
add wave -hex /mp3_cpu/pipelinedatapath/decode/instIn
add wave -hex /mp3_cpu/pipelinedatapath/SrcIn
add wave -hex /mp3_cpu/pipelinedatapath/PCValue
add wave -hex /mp3_cpu/pipelinedatapath/instructionfetch/pcmuxsel
add wave -hex /mp3_cpu/pipelinedatapath/instructionfetch/newpcin
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


echo "Full Instruction Tests"
force -freeze /mp3_cpu/Pipelinedatapath/ourregfile/ram(1) 0000000000101010
force -freeze /mp3_cpu/Pipelinedatapath/ourregfile/ram(2) 0000000000001000
force -freeze /mp3_cpu/Pipelinedatapath/ourregfile/ram(3) 0000000000000011
force -freeze /mp3_cpu/Pipelinedatapath/ourregfile/ram(5) 0000000001010100 
force -freeze /mp3_cpu/reset_l 0
run 50
force -freeze /mp3_cpu/reset_l 1

echo "ADD R7, R1, R2 :  R7 <= 42 + 8"
virtual signal {/mp3_cpu/Pipelinedatapath/ourregfile/ram(7) == 50 && /mp3_cpu/pcinstaddr == 10} ADD_test1
add wave -color white /mp3_cpu/ADD_test1

run 300

echo "ADD R0, R1, 11 : R0 <= 53"
virtual signal {/mp3_cpu/Pipelinedatapath/ourregfile/ram(0) == 53 && /mp3_cpu/pcinstaddr == 12} ADD_test2
add wave -color white /mp3_cpu/ADD_test2
run 50

add wave -noupdate -divider -height 32 ANDTests
echo "AND R6, R1, R2 :  R6 <= 101010 AND 00100"
virtual signal {/mp3_cpu/Pipelinedatapath/ourregfile/ram(6) == 8 && /mp3_cpu/pcinstaddr == 14} AND_test1
add wave -color white /mp3_cpu/AND_test1
run 50

run 50

echo "AND R6, R1, 7 : R6 <= 2"
virtual signal {/mp3_cpu/Pipelinedatapath/ourregfile/ram(6) == 2 && /mp3_cpu/pcinstaddr == 16} AND_test2
add wave -color white /mp3_cpu/AND_test2
run 50
 
add wave -noupdate -divider -height 32 NOTTests

echo "NOT R4, R3 : R4 <= NOT(011)" 
virtual signal {/mp3_cpu/Pipelinedatapath/ourregfile/ram(4) == -4 && /mp3_cpu/pcinstaddr == 18} NOT_test1
add wave -color white /mp3_cpu/NOT_test1
run 50

echo "LDR r7, r2, 6 : r7 <= MEM(0012) which is 600D"
virtual signal {/mp3_cpu/Pipelinedatapath/ourregfile/ram(7) == 24589 && /mp3_cpu/pcinstaddr == 20} LDR_test1
add wave -color white /mp3_cpu/LDR_test1
run 50

echo "2 NOPs should skoot on by"

echo "STR r1, r3, 3 : MEM(0009) <= r1 followed by nothin"
#/*our magic memory takes the mem to be written and out puts it as datamemin so we can test*/
#/*it should be steady 2 cycles early, since we are checking data in the memstage*/
virtual signal {/mp3_cpu/datamemin == 42 && mp3_cpu/dm_resp_h == 1 && /mp3_cpu/pcinstaddr == 22} STR_test1
add wave -color white /mp3_cpu/STR_test1
run 50

#/*it is 20 because it comes from fetch reg which stores PC + 2 ; we consider pcinstaddr in ID stage for branch instead of when we write to the register, as for other instructions*/
echo "BR np, 8   20 + 16 = 36"
virtual signal {/mp3_cpu/pcinstaddr == 24} br_1
virtual signal {/mp3_cpu/pcinstaddr == 36} br_2
add wave -color white /mp3_cpu/br_1
add wave -color white /mp3_cpu/br_2
run 50

echo "LEA R7, 10 -- R5 <= pc = 36 + 2 + 20 = 58"
virtual signal {/mp3_cpu/pcinstaddr == 46 && /mp3_cpu/Pipelinedatapath/ourregfile/ram(7) == 58} LEA_1
add wave -color white /mp3_cpu/LEA_1
run 50

add wave -noupdate -divider -height 32 SHFTests
echo "LSHF R4, R3, 2  ;  R4 <= 3 << 2 = 12"
virtual signal {/mp3_cpu/pcinstaddr == 48 && /mp3_cpu/Pipelinedatapath/ourregfile/ram(4) == 12} LSHF
add wave -color white /mp3_cpu/LSHF
run 50
echo "RSHFL R4, R4, 2  ;  R4 <= 12 >> 2 = 3"
virtual signal {/mp3_cpu/pcinstaddr == 50 && /mp3_cpu/Pipelinedatapath/ourregfile/ram(4) == 3} RSHFL
add wave -color white /mp3_cpu/RSHFL
run 50
echo "RSHFA R4, R1, 3  ;  R4 <= 42 >> 3 = 5"
virtual signal {/mp3_cpu/pcinstaddr == 52 && /mp3_cpu/Pipelinedatapath/ourregfile/ram(4) == 5} RSHFA
add wave -color white /mp3_cpu/RSHFA

run 200

echo "RET ; PC <= R7 = 58"
virtual signal {/mp3_cpu/pcinstaddr == 58} RET
add wave -color white /mp3_cpu/RET

run 150

echo "JSR 1; PC <= 58 + 2 + 8 = 68"
virtual signal {/mp3_cpu/pcinstaddr == 68} JSR
add wave -color white /mp3_cpu/JSR

echo "STB R3, R2,7;  MEM(R2 + 7) <= R3(7:0);  starts at pc=68"
virtual signal {/mp3_cpu/pcinstaddr == 74 && /mp3_cpu/datamemin == 7 && /mp3_cpu/dm_resp_h == 1} stb
add wave -color white /mp3_cpu/stb
run 200

run 100

echo "JSRR R5; PC <= R5"
virtual signal {/mp3_cpu/pcinstaddr == 84} jsrr
add wave -color white /mp3_cpu/jsrr
run 200

echo "TRAP x44; PC <= MEM(64)"
#/*This is not a valid test for TRAP at all*/
virtual signal {/mp3_cpu/pcinstaddr == 4} trap1a
add wave -color white /mp3_cpu/trap1a
run 200 

echo "TRAP x44; R7 <= PC"
virtual signal {/mp3_cpu/pcinstaddr == 6 && /mp3_cpu/Pipelinedatapath/ourregfile/ram(7) == 88} trap1b 
add wave -color white /mp3_cpu/trap1b
run 200 
  
