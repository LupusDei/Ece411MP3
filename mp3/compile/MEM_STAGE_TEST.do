echo "--- Executing initialization force file for MEM_STAGE_TEST"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /memstage/ALUResult
add wave -hex /memstage/srcIn
add wave -hex /memstage/MEMDataOut
add wave -hex /memstage/DataAddr
add wave -hex /memstage/DataMemIn
add wave -hex /memstage/MEM_C_In
add wave /memstage/MEMWriteData


echo "Test1, LDR should output the addr to memory, wait for a respsonce, and then output the result to the wbstage"
virtual signal {/memstage/DataAddr == 39} test1a
virtual signal {/memstage/MEMDataOut == 42} test1b
add wave -color white /memstage/test1a
add wave -color white /memstage/test1b

run 10
force -freeze /memstage/ALUResult 0000000000100111
run 10
force -freeze /memstage/DataMemIn 0000000000101010
run 10

force -freeze /memstage/ALUResult 0000000000000000
force -freeze /memstage/DataMemIn 0000000000000000

add wave -divider -color orange -height 32 STR
run 30


echo "Test1, STR should output the aluresult as the addr & srcin as the MEMWriteData"
virtual signal {/memstage/DataAddr == 7} test2a
virtual signal {/memstage/MEMWriteData == 42} test2b
add wave -color white /memstage/test2a
add wave -color white /memstage/test2b

run 10
force -freeze /memstage/ALUResult 0000000000000111
force -freeze /memstage/srcIn 0000000000101010
run 10

force -freeze /memstage/ALUResult 0000000000000000
force -freeze /memstage/srcIn 0000000000000000
run 30
