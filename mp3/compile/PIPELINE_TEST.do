echo "--- Executing initialization force file for PIPELINE_TEST"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /pipeline/id_c_in
add wave -hex /pipeline/ex_c_in
add wave -hex /pipeline/wb_c_in
add wave -hex /pipeline/inst
add wave -hex /pipeline/aluina
add wave -hex /pipeline/aluinb
add wave -hex /pipeline/aluout
add wave -hex /pipeline/regdatain
add wave -hex /pipeline/pcinstaddr
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

noforce /pipeline/regwrite
noforce /pipeline/regdatain
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
force /pipeline/InstMemIn 0000000000000000 -freeze
echo "inst should be 7, nextPC should be 4"

run 20

echo "EX tests"
echo "Test1, ALUOut will have the sum of ALUInA and ALUInB"
virtual signal {/pipeline/ALUOut == 21} ex_test1
add wave -color white /pipeline/ex_test1

force /pipeline/ALUInA 0000000000001011 -freeze
force /pipeline/ALUInB 0000000000001010 -freeze
force /pipeline/EX_C_In 0000000000000000 -freeze
run 40

force /pipeline/EX_C_In 0000000000000011 -freeze
run 40
echo "ALUOut should be 21"

echo "Test2, ALUOut will have the and of ALUInA and ALUInB"
virtual signal {/pipeline/ALUOut == 10} ex_test2
add wave -color white /pipeline/ex_test2

force /pipeline/ALUInA 0000000000001011 -freeze
force /pipeline/ALUInB 0000000000001010 -freeze
force /pipeline/EX_C_In 0000000000000001 -freeze
run 40

force /pipeline/EX_C_In 0000000000000010 -freeze
run 40
echo "ALUOut should be 10"



echo "WB tests"
echo "Test1, the Regfile will contain the value from the ALU for ADD isntructions"
force /pipeline/pcinstaddr 0000000001000000 -freeze
#/*The inst would be ADD R6, R1, R0  where R1 + R0 = 42*/
virtual signal {/pipeline/dr == 6 && /pipeline/pcinstaddr == 64} wb_test1a
virtual signal {/pipeline/regWrite == 1 && /pipeline/pcinstaddr == 64} wb_test1b
virtual signal {/pipeline/RegDataIn == 42 && /pipeline/pcinstaddr == 64} wb_test1c
virtual signal {/pipeline/ourregfile/ram(6) == 42 && /pipeline/pcinstaddr == 64} wb_test1d
add wave -color white /pipeline/wb_test1a
add wave -color white /pipeline/wb_test1b
add wave -color white /pipeline/wb_test1c
add wave -color white /pipeline/wb_test1d

force /pipeline/ALUOut 0000000000101010 -freeze
#/*wb_c_in is dr = 6, regwrite =1, WBMuxSel = 1*/
force /pipeline/WB_C_In 0000000000011011 -freeze
run 50

force /pipeline/WB_C_In 0000000000000000 -freeze
force /pipeline/pcinstaddr 0000000010000000 -freeze
run 40
echo "R6 & RegDataIn should be 42, and DR should be 6"
