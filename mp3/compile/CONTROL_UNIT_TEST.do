echo "--- Executing initialization force file for CONTROL_UNIT_TEST"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /mp3_cpu/if_c_in
add wave -hex /mp3_cpu/id_c_in
add wave -hex /mp3_cpu/ex_c_in
add wave -hex /mp3_cpu/mem_c_in
add wave -hex /mp3_cpu/wb_c_in
add wave -hex /mp3_cpu/mem_c_out
add wave -hex /mp3_cpu/im_resp_h
add wave -hex /mp3_cpu/im_read_l
add wave -hex /mp3_cpu/im_writeh_l
add wave -hex /mp3_cpu/im_writel_l
add wave -hex /mp3_cpu/reset_l
add wave -hex /mp3_cpu/clk
add wave -hex /mp3_cpu/pcinstaddr
add wave -hex /mp3_cpu/pipelinedatapath/newPC
add wave -hex /mp3_cpu/instOut
add wave -hex /mp3_cpu/controlunit/forwardA
add wave -hex /mp3_cpu/controlunit/forwardB
add wave -hex /mp3_cpu/id_c_out

force -freeze /mp3_cpu/clk 0 -repeat 50
force -freeze /mp3_cpu/clk 1 25 -repeat 50
force -freeze /mp3_cpu/im_resp_h 0

force /mp3_cpu/instOut 0000000000000000 -freeze

echo "Control Unit signal generation... PCMuxSel, LoadPC" 
virtual signal {/mp3_cpu/im_read_l == 0 && /mp3_cpu/pcinstaddr == 0} cutest1a
virtual signal {/mp3_cpu/IF_C_In == 2} cutest1b
add wave -color white cutest1a
add wave -color white cutest1b

force /mp3_cpu/reset_l 0 -freeze
run 24
force /mp3_cpu/reset_l 1 -freeze
run 1
run 15
force /mp3_cpu/im_resp_h 1 -freeze 
run 10
force /mp3_cpu/im_resp_h 0 -freeze 
run 25

echo "PCMuxSel should be 0 and LoadPC should be 1"

run 100

add wave -noupdate -divider -height 32 ADDTests
echo "ID_C_UNIT tests...ADD"
echo "Test ADD R7,R1,R7 inst will lead to ALUMuxSel = 000"
virtual signal {/mp3_cpu/id_c_in == 0  && /mp3_cpu/pcinstaddr == 2} ID_test1
add wave -color white ID_test1

force /mp3_cpu/instOut 0001111001000111 -freeze
run 10
force /mp3_cpu/instOut 0000000000000000 -freeze
run 10
echo "ID_C_In should be 0000, ALUMuxSel is 000, or the input from RegFileOutB"

force /mp3_cpu/pcinstaddr 0000000000000100 -freeze
run 50

echo "ID_C_UNIT tests...ADD Immediate"
echo "Test ADD R7, R1, 3 inst will lead to ALUMuxSel = 010"
virtual signal {/mp3_cpu/id_c_in == 2 && /mp3_cpu/pcinstaddr == 4} IDI_test1
add wave -color white IDI_test1

force /mp3_cpu/instOut 0001111001100011 -freeze
run 10
force /mp3_cpu/instOut 0000000000000000 -freeze
run 10

echo "ID_C_In should be 0002, ALUMuxSel is 010, or Imm5"

force /mp3_cpu/pcinstaddr 0000000000000110 -freeze
run 100

add wave -noupdate -divider -height 32 ANDTests 
echo "Test AND R5,R3,R2 inst will lead to ALUMuxSel = 000"
virtual signal {/mp3_cpu/id_c_in == 0  && /mp3_cpu/pcinstaddr == 6} ID_test2
add wave -color white ID_test2

force /mp3_cpu/instOut 0101101011000010 -freeze
run 10
force /mp3_cpu/instOut 0000000000000000 -freeze
run 10
echo "ID_C_In should be 0000, ALUMuxSel is 000, or the input from RegFileOutB"

force /mp3_cpu/pcinstaddr 0000000000001000 -freeze
run 50

echo "Test AND R5, R3, 4 inst will lead to ALUMuxSel = 010"
virtual signal {/mp3_cpu/id_c_in == 2 && /mp3_cpu/pcinstaddr == 8} IDI_test2
add wave -color white IDI_test2

force /mp3_cpu/instOut 0101101011100100 -freeze
run 10
force /mp3_cpu/instOut 0000000000000000 -freeze
run 10
echo "ID_C_In should be 0002, ALUMuxSel is 002, or Imm5"

force /mp3_cpu/pcinstaddr 0000000000001010 -freeze
noforce /mp3_cpu/clk
force -freeze /mp3_cpu/clk 0
run 100

add wave -noupdate -divider -height 32 EXTests
echo "EX_C_UNIT & EX_C_REG Tests..."
echo "Test that ex_c_in is 0 for ADD and that it isn't outputed for a full cycle"
force -freeze /mp3_cpu/clk 1 -repeat 50
force -freeze /mp3_cpu/clk 0 25 -repeat 50

virtual signal {/mp3_cpu/id_c_in == 0 && /mp3_cpu/ex_c_in == 61440 && /mp3_cpu/pcinstaddr == 10} EX_test1a
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/ex_c_in == 0 && /mp3_cpu/pcinstaddr == 12} EX_test1b
add wave -color white EX_test1a
add wave -color white EX_test1b
#/*it would take the inst 6ns to load after the rising edge of the clk */
run 6
force /mp3_cpu/instOut 0001000000000000 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000000001100 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000000010000 -freeze
run 44

echo "ex_c_in should be 0xF000 and then 0x0000 after 1 clock cycle, and then back to 0xF000 after the next cycle"

#/*Ex Test for AND*/
echo "Test that ex_c_in is 1 for AND and that it isn't outputed for a full cycle"

virtual signal {/mp3_cpu/id_c_in == 0 && /mp3_cpu/ex_c_in == 61440 && /mp3_cpu/pcinstaddr == 16} EX_test2a
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/ex_c_in == 1 && /mp3_cpu/pcinstaddr == 18} EX_test2b
add wave -color white EX_test2a
add wave -color white EX_test2b
#/*it would take the inst 6ns to load after the rising edge of the clk */
run 6
force /mp3_cpu/instOut 0101000000000000 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000000010010 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000000011000 -freeze
run 44

echo "ex_c_in should be 0xF000 and then 0x0001 after 1 clock cycle, and then back to 0xF000 after the next cycle"

#/*Ex Test for NOT*/
echo "Test that ex_c_in is 2 for NOT and that it isn't outputed for a full cycle"

virtual signal {/mp3_cpu/ex_c_in == 61440 && /mp3_cpu/pcinstaddr == 26} EX_test3a
virtual signal {/mp3_cpu/ex_c_in == 2 && /mp3_cpu/pcinstaddr == 28} EX_test3b
add wave -color white EX_test3a
add wave -color white EX_test3b
#/*it would take the inst 6ns to load after the rising edge of the clk */
run 6
force /mp3_cpu/instOut 1001010000111111 -freeze
force /mp3_cpu/pcinstaddr 0000000000011010 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000000011100 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000000100000 -freeze
run 44

echo "ex_c_in should be 0xF000 and then 0x0002 after 1 clock cycle, and then back to 0xF000 after the next cycle"

run 50

add wave -noupdate -divider -height 32 WBTests
echo "WB_C_UNIT & WB_C_REG Tests..."
echo "Test that wb_c_in has the correct DR, RegWrite signal, and WBMuxSel for ADD and that it isn't outputed for 3 full cycles.  The data shold skip the MEM stage for ADD"

virtual signal {/mp3_cpu/id_c_in == 0 && /mp3_cpu/wb_c_in == 61440 && /mp3_cpu/pcinstaddr == 32} WB_test1a
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/ex_c_in == 0 && /mp3_cpu/wb_c_in == 61440 && /mp3_cpu/pcinstaddr == 34} WB_test1b
#/*wb_c_in should be 00...011011   or dr = r6, regwrite = 1, muxSel = 1*/
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/wb_c_in == 27 && /mp3_cpu/pcinstaddr == 38} WB_test1c
add wave -color white WB_test1a
add wave -color white WB_test1b
add wave -color white WB_test1c
#/*it would take the inst 6ns to load after the rising edge of the clk */
run 6
#/*the inst is ADD r6, r3, r2*/
force /mp3_cpu/instOut 0001110011000010 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000000100010 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000000100100 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000000100110 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000001000000 -freeze
run 44

echo "wb_c_in should be 0xF000 for 3 cycles then 0x001B for 1 clock cycle, and then back to 0xF000 after the next cycle"

echo "Test2, make sure wb_c_in waits an extra cycle for ldr."
virtual signal {/mp3_cpu/id_c_in == 6 && /mp3_cpu/wb_c_in == 61440 && /mp3_cpu/pcinstaddr == 64} WB_test2a
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/ex_c_in == 0 && /mp3_cpu/wb_c_in == 61440 && /mp3_cpu/pcinstaddr == 66} WB_test2b
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/ex_c_in == 61440 && /mp3_cpu/wb_c_in == 61440 && /mp3_cpu/pcinstaddr == 68} WB_test2c
#/*wb_c_in should be 00...011110   or dr = r7, regwrite = 1, muxSel = 0*/
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/wb_c_in == 30 && /mp3_cpu/pcinstaddr == 70} WB_test2d
add wave -color white WB_test2a
add wave -color white WB_test2b
add wave -color white WB_test2c
add wave -color white WB_test2d
#/*it would take the inst 6ns to load after the rising edge of the clk */
run 6
#/*LDR R7, R1, 7*/
force /mp3_cpu/instOut 0110111001000111 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000001000010 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000001000100 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000001000110 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000001001000 -freeze
run 44


#/***********************************************/
#/* Full CU tests for instructions */
echo "Testing full path for MEM instructions"
add wave -noupdate -divider -height 32 FullInstTests
#/*pc is 128*/
force /mp3_cpu/pcinstaddr 0000000010000000 -freeze
#/*id_c_in is 6 for ALUMuxSel to be 110, or SEXT(offset 6) << 1*/
virtual signal {/mp3_cpu/id_c_in == 6 && /mp3_cpu/ex_c_in == 61440 && /mp3_cpu/pcinstaddr == 128} MEM_test1a
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/ex_c_in == 0 && /mp3_cpu/mem_c_in == 61440 && /mp3_cpu/pcinstaddr == 130} MEM_test1b
#/*mem_c_in should control the gencc*/
virtual signal {/mp3_cpu/ex_c_in == 61440 && /mp3_cpu/mem_c_in == 1 && /mp3_cpu/dm_read_l == 0 && /mp3_cpu/pcinstaddr == 132} MEM_test1c
#/*wb_c_in should be 00...011110   or dr = r7, regwrite = 1, muxSel = 0*/
virtual signal {/mp3_cpu/ex_c_in == 61440 && /mp3_cpu/mem_c_in == 61440 && /mp3_cpu/dm_read_l == 1 && /mp3_cpu/wb_c_in == 30 && /mp3_cpu/pcinstaddr == 134} MEM_test1d
add wave -color white MEM_test1a
add wave -color white MEM_test1b
add wave -color white MEM_test1c
add wave -color white MEM_test1d

run 6
#/*LDR R7, R1, 7*/
force /mp3_cpu/instOut 0110111001000111 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000010000010 -freeze
force /mp3_cpu/instOut 1111000000000000 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000010000100 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000010000110 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000010001000 -freeze
run 44


echo "Test 2, STR R7, R2, 7"
virtual signal {/mp3_cpu/id_c_in == 14 && /mp3_cpu/ex_c_in == 61440 && /mp3_cpu/pcinstaddr == 136} MEM_test2a
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/ex_c_in == 0 && /mp3_cpu/mem_c_in == 61440 && /mp3_cpu/pcinstaddr == 138} MEM_test2b
virtual signal {/mp3_cpu/ex_c_in == 61440 && /mp3_cpu/mem_c_in == 0 && /mp3_cpu/dm_writel_l == 0 && /mp3_cpu/dm_writeh_l == 0 && /mp3_cpu/pcinstaddr == 140} MEM_test2c
#/*wb_c_in is 28 since the dr is still set to 111*/
virtual signal {/mp3_cpu/ex_c_in == 61440 && /mp3_cpu/mem_c_in == 61440 && /mp3_cpu/dm_writel_l == 1 && /mp3_cpu/wb_c_in == 28 && /mp3_cpu/pcinstaddr == 142} MEM_test2d
add wave -color white MEM_test2a
add wave -color white MEM_test2b
add wave -color white MEM_test2c
add wave -color white MEM_test2d

run 6
force /mp3_cpu/instOut 0111111010000111 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000010001010 -freeze
force /mp3_cpu/instOut 1111000000000000 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000010001100 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000010001110 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000010010000 -freeze
run 44

echo "Test 3, BRp 8"
#/*for now, branch will occur in the mem stage*/
virtual signal {/mp3_cpu/id_c_in == 0 && /mp3_cpu/pcinstaddr == 144} BR_test1a
#/*mem_c_in is now 1000 0010. 1 for br instruction, 000 for dm read&writeh&l, then nzp positive check, then 0 for loadnzp */
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/mem_c_in == 130 && /mp3_cpu/if_c_in == 3 && /mp3_cpu/pcinstaddr == 148} BR_test1b
add wave -color white BR_test1a
add wave -color white BR_test1b

run 6
force /mp3_cpu/instOut 0000001000001000 -freeze
force /mp3_cpu/pipelinedatapath/nextPCIn 0000000000001000 -freeze
run 50
#/*pc = 146*/
force /mp3_cpu/pcinstaddr 0000000010010010 -freeze
force /mp3_cpu/instOut 1111000000000000 -freeze
run 50
force /mp3_cpu/pcinstaddr 0000000010010100 -freeze
force /mp3_cpu/mem_c_out 0000000000000001 -freeze
run 50
noforce /mp3_cpu/pcinstaddr
#/*pc = 150*/
force /mp3_cpu/pcinstaddr 0000000010010110 -freeze
run 50

run 44


add wave -noupdate -divider -height 32 ForwardingUnitTests

echo "Test Forwarding Unit for ADD"
echo "Test forwarding Signal A"
virtual signal {/mp3_cpu/controlunit/forwardA == 0 && /mp3_cpu/pcinstaddr == 152} Forward_test1a 
virtual signal {/mp3_cpu/controlunit/forwardA == 1 && /mp3_cpu/pcinstaddr == 154} Forward_test1b
add wave -color white Forward_test1a 
add wave -color white Forward_test1b

#/*add r4, r2, r0*/
run 6
#/*pc = 152*/
force /mp3_cpu/pcinstaddr 0000000010011000 -freeze
force /mp3_cpu/instOut 0001100010000000 -freeze
force /mp3_cpu/id_c_out 0000000010001000 -freeze

#/*add r2, r4, r0*/
run 50
force /mp3_cpu/pcinstaddr 0000000010011010 -freeze
force /mp3_cpu/instOut 0001010100000000 -freeze
force /mp3_cpu/id_c_out 0000000100001000 -freeze


run 50
force /mp3_cpu/pcinstaddr 0000000010011100 -freeze

run 44

run 100

echo "Test Forwarding Signal B"
virtual signal {/mp3_cpu/controlunit/forwardA == 0 && /mp3_cpu/controlunit/forwardB == 0 && /mp3_cpu/pcinstaddr == 158} Forward_test2a
virtual signal {/mp3_cpu/controlunit/forwardB == 1 && /mp3_cpu/pcinstaddr == 160} Forward_test2b
add wave -color white Forward_test2a
add wave -color white Forward_test2b

run 6
#/*pc = 158*/
force /mp3_cpu/pcinstaddr 0000000010011110 -freeze
#/*add r1, r0, r3*/
force /mp3_cpu/instOut 0001001000000011 -freeze
force /mp3_cpu/id_c_out 0000001000001011 -freeze

run 50
force /mp3_cpu/pcinstaddr 0000000010100000 -freeze
#/*add r2, r0, r1*/
force /mp3_cpu/instOut 0001010000000001 -freeze
force /mp3_cpu/id_c_out 0000000000001001 -freeze

run 50
force /mp3_cpu/pcinstaddr 0000000010100010 -freeze

run 44

run 100

echo "Test Forwarding Unit for Loads and Stores"
echo "Test for loads"
virtual signal {/mp3_cpu/controlunit/forwardA == 0 && /mp3_cpu/pcinstaddr == 164} Forward_test3a
virtual signal {/mp3_cpu/controlunit/forwardA == 1 && /mp3_cpu/pcinstaddr == 166} Forward_test3b
virtual signal {/mp3_cpu/controlunit/forwardA == 2 && /mp3_cpu/controlunit/forwardB == 2 && /mp3_cpu/pcinstaddr == 168} Forward_test3c
add wave -color white Forward_test3a
add wave -color white Forward_test3b
add wave -color white Forward_test3c

run 6
#/*pc = 164*/
force /mp3_cpu/pcinstaddr 0000000010100100 -freeze
#/*add r5, r0, r0*/
force /mp3_cpu/instOut 0001101000000000 -freeze
force /mp3_cpu/id_c_out 0000000000001000 -freeze

run 50
force /mp3_cpu/pcinstaddr 0000000010100110 -freeze
#/*ld r2, r5, 0*/
force /mp3_cpu/instOut 0110010101000000 -freeze
force /mp3_cpu/id_c_out 0000000101000000 -freeze

run 50
force /mp3_cpu/pcinstaddr 0000000010101000 -freeze
#/*add r3, r5, r5*/
force /mp3_cpu/instOut 0001011101000101 -freeze
force /mp3_cpu/id_c_out 0000000101001101 -freeze

run 50
#/*pc = 170*/
force /mp3_cpu/pcinstaddr 0000000010101010 -freeze
run 44

run 100

echo "Test for stores"
virtual signal {/mp3_cpu/controlunit/forwardA == 0 && /mp3_cpu/pcinstaddr == 172} Forward_test4a
virtual signal {/mp3_cpu/controlunit/forwardA == 1 && /mp3_cpu/pcinstaddr == 174} Forward_test4b
add wave -color white Forward_test4a
add wave -color white Forward_test4b

run 6
force /mp3_cpu/pcinstaddr 0000000010101100 -freeze
#/*add r7, r0, r0*/
force /mp3_cpu/instOut 0001111000000000 -freeze
force /mp3_cpu/id_c_out 0000000000001000 -freeze

run 50
force /mp3_cpu/pcinstaddr 0000000010101110 -freeze
#/*st r2, r7, 0*/
force /mp3_cpu/instOut 0110010111000000 -freeze
force /mp3_cpu/id_c_out 0000000111010000 -freeze

run 50
#/*pc = 176*/
force /mp3_cpu/pcinstaddr 0000000010110000 -freeze

run 44

force /mp3_cpu/instOut 0000000000000000 -freeze
run 150

echo "Test for 3 consecutive instructions"
virtual signal {/mp3_cpu/controlunit/forwardA == 0 && /mp3_cpu/pcinstaddr == 178} Forward_test5a
virtual signal {/mp3_cpu/controlunit/forwardA == 1 && /mp3_cpu/pcinstaddr == 180} Forward_test5b
virtual signal {/mp3_cpu/controlunit/forwardB == 1 && /mp3_cpu/controlunit/forwardA == 2 && /mp3_cpu/pcinstaddr == 182} Forward_test5c

add wave -color white Forward_test5a
add wave -color white Forward_test5b
add wave -color white Forward_test5c

run 6
#/*pc = 178*/
force /mp3_cpu/pcinstaddr 0000000010110010 -freeze
#/*ADD R3, R2, R1*/
force /mp3_cpu/instOut 0001011010000001 -freeze
force /mp3_cpu/id_c_out 0000000010001001 -freeze

run 50
force /mp3_cpu/pcinstaddr 0000000010110100 -freeze
#/*ADD R5, R3, R4*/
force /mp3_cpu/instOut 0001101011000100 -freeze
force /mp3_cpu/id_c_out 0000000011001100 -freeze

run 50
force /mp3_cpu/pcinstaddr 0000000010110110 -freeze
#/*ADD R6, R3, R5*/
force /mp3_cpu/instOut 0001110011000101 -freeze
force /mp3_cpu/id_c_out 0000000011001101 -freeze

run 50
force /mp3_cpu/pcinstaddr 0000000010111000 -freeze

run 44

