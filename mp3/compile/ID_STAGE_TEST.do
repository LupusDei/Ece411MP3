echo "--- Executing initialization force file for ID_STAGE_TEST"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /idstage/id_c_in
add wave -hex /idstage/id_c_out
add wave -hex /idstage/inst
add wave -hex /idstage/aluina
add wave -hex /idstage/aluinb
add wave -hex /idstage/outa
add wave -hex /idstage/outb
add wave /idstage/ra
add wave /idstage/rb
add wave /idstage/ALUMuxSel

echo "First test, it splits the instruction for the source registers."

virtual signal {/idstage/ra == 1} test1a
virtual signal {/idstage/rb == 2} test1b
add wave -color white /idstage/test1a
add wave -color white /idstage/test1b

run 10
force /idstage/inst 0001111001000010 -freeze
run 10

force /idstage/inst 0000000000000000 -freeze
echo "ra should be 001, rb should be 010"
run 10

echo "Second test, it splits ID_C_In into ALUMuxSel."

virtual signal {/idstage/ALUMuxSel == 5} test2a
add wave -color white /idstage/test2a

run 10
force /idstage/ID_C_In 0001001000000101 -freeze
run 10

echo "ALUMuxSel should be 101"
run 10
