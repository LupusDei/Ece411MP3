echo "--- Executing initialization force file for WB_STAGE_TEST"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /wbstage/wb_c_in
add wave -hex /wbstage/MEMDataOut
add wave -hex /wbstage/ALUresult
add wave -hex /wbstage/RegDataIn
add wave /wbstage/RegWrite
add wave /wbstage/DR

echo "First test, ADD R6,R3,R2 should set RegDataIn to ALUresult and DR to 110 and RegWrite to 1"
run 10
virtual signal {/wbstage/RegDataIn == 42} test1a
virtual signal {/wbstage/dr == 6} test1b
virtual signal {/wbstage/RegWrite == 1} test1c
add wave -color white /wbstage/test1a
add wave -color white /wbstage/test1b
add wave -color white /wbstage/test1c

#/*dr is 110, regwrite is 1, and select ALUresult for wbmux is 1*/
force /wbstage/wb_c_in 0000000000011011 -freeze 
force /wbstage/ALUresult 0000000000101010 -freeze
run 20
force /wbstage/wb_c_in 0000000000000000 -freeze 
force /wbstage/ALUresult 0000000000000000 -freeze

echo "dr == 110 & regdatain == 002A & regwrite == 1"
run 20
