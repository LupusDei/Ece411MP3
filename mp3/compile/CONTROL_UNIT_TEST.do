echo "--- Executing initialization force file for CONTROL_UNIT_TEST"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /mp3_cpu/if_c_in
add wave -hex /mp3_cpu/id_c_in
add wave -hex /mp3_cpu/ex_c_in
add wave -hex /mp3_cpu/wb_c_in
add wave -hex /mp3_cpu/im_resp_h
add wave -hex /mp3_cpu/im_read_l
add wave -hex /mp3_cpu/im_writeh_l
add wave -hex /mp3_cpu/im_writel_l
add wave -hex /mp3_cpu/reset_l
add wave -hex /mp3_cpu/clk
add wave -hex /mp3_cpu/pcinstaddr
add wave -hex /mp3_cpu/instOut


force -freeze /mp3_cpu/clk 0 -repeat 50
force -freeze /mp3_cpu/clk 1 25 -repeat 50
force -freeze /mp3_cpu/im_resp_h 0

echo "Control Unit signal generation... PCMuxSel, LoadPC" 
virtual signal {/mp3_cpu/im_read_l == 0 && /mp3_cpu/pcinstaddr == 0} cutest1a
virtual signal {/mp3_cpu/IF_C_In == 2} cutest1b
add wave -color white cutest1a
add wave -color white cutest1b

force /mp3_cpu/reset_l 0 -freeze
run 10
force /mp3_cpu/reset_l 1 -freeze

force /mp3_cpu/im_resp_h 1 -freeze 
run 10
force /mp3_cpu/im_resp_h 0 -freeze 
run 50

echo "PCMuxSel should be 0 and LoadPC should be 1"

run 50

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
run 100

echo "Test AND R5,R3,R2 inst will lead to ALUMuxSel = 000"
virtual signal {/mp3_cpu/id_c_in == 0  && /mp3_cpu/pcinstaddr == 4} ID_test2
add wave -color white ID_test2

force /mp3_cpu/instOut 0101101011000010 -freeze
run 10
force /mp3_cpu/instOut 0000000000000000 -freeze
run 10
echo "ID_C_In should be 0000, ALUMuxSel is 000, or the input from RegFileOutB"

force /mp3_cpu/pcinstaddr 0000000000001000 -freeze


noforce /mp3_cpu/clk
force -freeze /mp3_cpu/clk 0
run 100

echo "EX_C_UNIT & EX_C_REG Tests..."
echo "Test that ex_c_in is 0 for ADD and that it isn't outputed for a full cycle"
force -freeze /mp3_cpu/clk 1 -repeat 50
force -freeze /mp3_cpu/clk 0 25 -repeat 50

virtual signal {/mp3_cpu/id_c_in == 0 && /mp3_cpu/ex_c_in == 61440 && /mp3_cpu/pcinstaddr == 8} EX_test1a
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/ex_c_in == 0 && /mp3_cpu/pcinstaddr == 10} EX_test1b
add wave -color white EX_test1a
add wave -color white EX_test1b
#/*it would take the inst 6ns to load after the rising edge of the clk */
run 6
force /mp3_cpu/instOut 0001000000000000 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000000001010 -freeze
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

virtual signal {/mp3_cpu/ex_c_in == 61440 && /mp3_cpu/pcinstaddr == 24} EX_test3a
virtual signal {/mp3_cpu/ex_c_in == 2 && /mp3_cpu/pcinstaddr == 26} EX_test3b
add wave -color white EX_test3a
add wave -color white EX_test3b
#/*it would take the inst 6ns to load after the rising edge of the clk */
run 6
force /mp3_cpu/instOut 1001010000111111 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000000011010 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000000100000 -freeze
run 44

echo "ex_c_in should be 0xF000 and then 0x0002 after 1 clock cycle, and then back to 0xF000 after the next cycle"

echo "WB_C_UNIT & WB_C_REG Tests..."
echo "Test that wb_c_in has the correct DR, RegWrite signal, and WBMuxSel for ADD and that it isn't outputed for 2 full cycles.  The data shold skip the MEM stage for ADD"

virtual signal {/mp3_cpu/id_c_in == 0 && /mp3_cpu/wb_c_in == 61440 && /mp3_cpu/pcinstaddr == 32} WB_test1a
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/ex_c_in == 0 && /mp3_cpu/wb_c_in == 61440 && /mp3_cpu/pcinstaddr == 34} WB_test1b
#/*wb_c_in should be 00...011011   or dr = r6, regwrite = 1, muxSel = 1*/
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/wb_c_in == 27 && /mp3_cpu/pcinstaddr == 36} WB_test1c
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
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000000100100 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000001000000 -freeze
run 44

echo "wb_c_in should be 0xF000 for 2 cycles then 0x001B for 1 clock cycle, and then back to 0xF000 after the next cycle"

