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
echo "Test setup.... preload R1 = 42,R2 = 8 R6 = 37"

force /pipeline/regdatain 0000000000101010 -freeze
force /pipeline/dr 001 -freeze
run 5
force /pipeline/regwrite 1 -freeze
run 20

force /pipeline/regwrite 0 -freeze
run 10

force /pipeline/regdatain 0000000000001000 -freeze
force /pipeline/dr 010 -freeze
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
noforce /pipeline/dr
run 10

echo "IF tests"
echo "Test1, the IF stage will increment the pc when the CU instructs it to"
virtual signal {/pipeline/inst == 7} if_test1a
virtual signal {/pipeline/nextPC == 4} if_test1b
add wave -color white /pipeline/if_test1a
add wave -color white /pipeline/if_test1b

force /pipeline/IF_C_In 0000000000000000 -freeze
run 1
force /pipeline/InstMemIn 0000000000000111 -freeze
run 10
force /pipeline/IF_C_In 0000000000000010 -freeze
run 40
force /pipeline/InstMemIn 0000000000000000 -freeze
echo "inst should be 7, nextPC should be 4"

run 20

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

echo "Test3, ALUOut will have the not of ALUInA"
virtual signal {/pipeline/ALUOut == -11} ex_test3
add wave -color white /pipeline/ex_test3

force /pipeline/ALUInA 0000000000001010 -freeze
force /pipeline/EX_C_In 0000000000000010 -freeze
run 40

force /pipeline/EX_C_In 0000000000000011 -freeze
run 40
echo "ALUOut should be -11"

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



#/**********************************************/
echo "Full Instruction Tests"
add wave -noupdate -divider -height 32 InstructionTests

echo "ADD R7, R1, R2 :  R7 <= 42 + 8    Followed by a dummy instruction"
force /pipeline/pcinstaddr 0000000010000000 -freeze
noforce /pipeline/ALUOut
noforce /pipeline/ALUInA
noforce /pipeline/ALUInB
noforce /pipeline/inst
noforce /pipeline/clk
virtual signal {/pipeline/ourregfile/ram(7) == 50 && /pipeline/pcinstaddr == 128} ADD_test1
add wave -color orange /pipeline/ADD_test1

#/*Begin in IF w/ an input instruction*/
force /pipeline/clk 0 -freeze
run 25
force /pipeline/clk 1 -freeze
#/*clk goes high, pc is incremented, new instruction is fetched*/
run 10
force /pipeline/InstMemIn 0001111001000010 -freeze
#/*we can ignore the if_c_in for now, since it wont affect the instruction*/
run 15
force /pipeline/clk 0 -freeze
run 25

#/*the instruction should get loaded into the fetchReg as we transition into the ID stage*/
force /pipeline/clk 1 -freeze
run 5
#/*a new instruction is loaded from IF, thus the fetchReg must preserve the old one*/
force /pipeline/InstMemIn 1111111011000111 -freeze
run 5
#/*the inst goes to the CU and ID_C_In returns 0, instructing ALUMux to use OutB for ALUInB*/
#/*the inst is split into source regs and selects R1 for OutA and R2 for OutB*/
force /pipeline/ID_C_In 0000000000000000 -freeze
run 15
force /pipeline/clk 0 -freeze
run 25

#/*the idReg loads ALUInA and ALUInB as we transition to EX*/
force /pipeline/clk 1 -freeze
run 10
#/*new ALUInA & ALUInB values will be coming from the IDstage now,so idReg needs to be working*/
#/*ex_c_in gets transmitted out of the EX_C_Reg. The ALUOp is 0, for ADD*/
force /pipeline/EX_C_In 0000000000000000 -freeze
run 15
force /pipeline/clk 0 -freeze
#/*the ALU delay is 15, so ALUout should be steady at 50*/
run 25

#/*the exReg loads ALUOut as we enter the MEM/WB phase*/
force /pipeline/clk 1 -freeze
run 10
#/*we skip MEM and go right to WB as WB_C_In for the ADD leaves the WB_C_Reg 1 cycle early */
#/*DR = 111, RegWrite = 1, WBMuxSel = 1 for ALUOut*/
force /pipeline/WB_C_In 0000000000011111 -freeze
run 15
#/*a new value will be coming from ALUOut will be coming from EX now, so the EXReg needs to save ours*/
force /pipeline/clk 0 -freeze
run 25

#/*when the clk's rising edge come, 50 should be written into R7*/
force /pipeline/clk 1 -freeze
run 10
force /pipeline/pcinstaddr 0000000010000010 -freeze
#/*130 is put on pcinstaddr, bringing this test to a close*/
run 10


run 50


