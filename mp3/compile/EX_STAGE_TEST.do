echo "--- Executing initialization force file for EX_STAGE_TEST"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /exstage/ex_c_in
add wave -hex /exstage/inA
add wave -hex /exstage/inB
add wave /exstage/aluop
add wave -hex /exstage/aluout
virtual signal {/exstage/aluout == 50} test1
add wave -color white /exstage/test1

echo "First test, ADD 42, 8"
force /exstage/ex_c_in 0000000000000000 -freeze
force /exstage/inA 0000000000101010 -freeze
force /exstage/inB 0000000000001000 -freeze

echo "Run for 20ns"

run 20;

echo "Check aluout  50"

echo "Second test, AND 42, 8"

force -freeze sim:/exstage/ex_c_in 0000000000000001
virtual signal {/exstage/aluout == 8} test2
add wave -color white /exstage/test2

run 20;
run 20;

echo "Check aluout  8"

echo "Third test, NOT 1"

force -freeze sim:/exstage/ex_c_in 0000000000000010
force /exstage/inA 0000000000000001 -freeze
virtual signal {/exstage/aluout == -2} test3
add wave -color white /exstage/test3

run 20;
run 20;

echo "Check aluout -2"
run 100;
run 100;
