echo "--- Executing initialization force file for PIPELINE_TEST"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /mp3_cpu/if_c_in
add wave -hex /mp3_cpu/id_c_in
add wave -hex /mp3_cpu/ex_c_in
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

echo "ID_C_UNIT tests..."
echo "Test ADD R7,R1,R7 inst will lead to ALUMuxSel = 000"
virtual signal {/mp3_cpu/id_c_in == 0  && /mp3_cpu/pcinstaddr == 2} ID_test1a
add wave -color white ID_test1a

force /mp3_cpu/instOut 0001111001000111 -freeze
run 10
force /mp3_cpu/instOut 0000000000000000 -freeze
run 10
echo "ID_C_In should be 0000, this ALUMuxSel is 000, or the input from RegFileOutB"

force /mp3_cpu/pcinstaddr 0000000000000100 -freeze
run 100


echo "EX_C_UNIT & EX_C_REG Tests..."
echo "Test that ex_c_in is 0 for ADD and that it isn't outputed for a full cycle"

virtual signal {/mp3_cpu/id_c_in == 0 && /mp3_cpu/ex_c_in == 61440 && /mp3_cpu/pcinstaddr == 4} EX_test1a
virtual signal {/mp3_cpu/id_c_in == 61440 && /mp3_cpu/ex_c_in == 0 && /mp3_cpu/pcinstaddr == 4} EX_test1b
add wave -color white EX_test1a
add wave -color white EX_test1b

force /mp3_cpu/instOut 0001000000000000 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
run 50
force /mp3_cpu/instOut 1111000000000000 -freeze
force /mp3_cpu/pcinstaddr 0000000000001000 -freeze
run 50

echo "ex_c_in should be 0xF000 and then 0x0000 after 1 clock cycle, and then back to 0xF000 after the next cycle"

