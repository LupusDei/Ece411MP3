echo "--- Executing initialization force file for PIPELINE_TEST"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /mp3_cpu/if_c_in
add wave -hex /mp3_cpu/pcinstaddr
add wave -hex /mp3_cpu/instmemin
add wave -hex /mp3_cpu/im_resp_h
add wave -hex /mp3_cpu/im_read_l
add wave -hex /mp3_cpu/im_writeh_l
add wave -hex /mp3_cpu/im_writel_l
add wave /mp3_cpu/reset_l
add wave /mp3_cpu/clk



force -freeze /mp3_cpu/clk 0 -repeat 20
force -freeze /mp3_cpu/clk 1 10 -repeat 20
force -freeze /mp3_cpu/im_resp_h 0

echo "Control Unit signal generation... PCMuxSel, LoadPC" 
virtual signal {/mp3_cpu/im_read_l == 0} cutest1a
virtual signal {/mp3_cpu/IF_C_In == 2} cutest1b
add wave -color white /mp3_cpu/cutest1a
add wave -color white /mp3_cpu/cutest1b

force /mp3_cpu/reset_l 0 -freeze
run 10
force /mp3_cpu/reset_l 1 -freeze

force /mp3_cpu/im_resp_h 1 -freeze 
run 10

echo "PCMuxSel should be 0 and LoadPC should be 1"
