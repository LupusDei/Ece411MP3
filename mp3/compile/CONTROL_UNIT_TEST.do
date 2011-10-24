echo "--- Executing initialization force file for PIPELINE_TEST"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex if_c_in
add wave -hex im_resp_h
add wave -hex im_read_l
add wave -hex im_writeh_l
add wave -hex im_writel_l
add wave -hex reset_l
add wave -hex clk



force -freeze clk 0 -repeat 20
force -freeze clk 1 10 -repeat 20
force -freeze im_resp_h 0

echo "Control Unit signal generation... PCMuxSel, LoadPC" 
virtual signal {im_read_l == 0} cutest1a
virtual signal {IF_C_In == 2} cutest1b
add wave -color white cutest1a
add wave -color white cutest1b

force reset_l 0 -freeze
run 10
force reset_l 1 -freeze

force im_resp_h 1 -freeze 
run 10

echo "PCMuxSel should be 0 and LoadPC should be 1"
