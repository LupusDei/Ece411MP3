echo "--- Executing initialization force file for PIPELINE_TEST"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /pipeline/id_c_in
add wave -hex /pipeline/id_c_out
add wave -hex /pipeline/inst
add wave -hex /pipeline/aluina
add wave -hex /pipeline/aluinb
add wave -hex /pipeline/regdatain
add wave /pipeline/dr
add wave /pipeline/regwrite
add wave /pipeline/ra
add wave /pipeline/rb
add wave /pipeline/clk
add wave /pipeline/reset_l
add wave -hex /pipeline/ourregfile/ram

force -freeze /pipeline/clk 0 -repeat 20
force -freeze /pipeline/clk 1 10 -repeat 20
force /pipeline/reset_l 0 -freeze
run 10
force /pipeline/reset_l 1 -freeze
echo "Test setup.... preload R1, R6"

force /pipeline/regdatain 0000000000101010 -freeze
force /pipeline/dr 001 -freeze
run 5
force /pipeline/regwrite 1 -freeze
run 20

force /pipeline/regwrite 0 -freeze
run 10

force /pipeline/regdatain 0000000000100101 -freeze
force /pipeline/dr 110 -freeze
run 5
force /pipeline/regwrite 1 -freeze
run 20

force /pipeline/regwrite 0 -freeze
run 10

echo "ID & Regfile communication tests."
echo "Test 1, test alu inputs from ID stage on ADD R7, R1,R6"
virtual signal {/pipeline/aluina == 42} id_test1a
virtual signal {/pipeline/aluinb == 37} id_test1b
add wave -color white /pipeline/id_test1a
add wave -color white /pipeline/id_test1b

force /pipeline/inst 0001111001000110 -freeze
force /pipeline/ID_C_In 0001001000000000 -freeze

run 10
noforce /pipeline/inst
echo "aluina should be 002A and aluinb should be 0025"
run 50


echo "IF tests"
echo "Test1, the IF stage will increment the pc when the CU instructs it to"
virtual signal {/pipeline/inst == 7} if_test1a
virtual signal {/pipeline/nextPC == 4} if_test1b
add wave -color white /pipeline/if_test1a
add wave -color white /pipeline/if_test1b

force /pipeline/reset_l 0 -freeze
run 10
force /pipeline/reset_l 1 -freeze
run 1
force /pipeline/IF_C_In 0000000000000000 -freeze
run 1
force /pipeline/InstMemIn 0000000000000111 -freeze
run 10
force /pipeline/IF_C_In 0000000000000010 -freeze
run 40
echo "inst should be 7, nextPC should be 4"

