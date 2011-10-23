echo "--- Executing initialization force file for IF_STAGE_TEST"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -hex /ifstage/nextpc
add wave -hex /ifstage/newpc
add wave -hex /ifstage/pcmuxout
add wave -hex /ifstage/pcinstaddr
add wave -hex /ifstage/inst
add wave -hex /ifstage/if_c_in
add wave /ifstage/clk
add wave /ifstage/loadpc
add wave /ifstage/pcmuxsel
add wave /ifstage/reset_l
virtual signal {/ifstage/pcinstaddr == 0} test1
add wave -color white /ifstage/test1

force -freeze /ifstage/clk 0 -repeat 20
force -freeze /ifstage/clk 1 10 -repeat 20

echo "First test, PC gets addr 0000 after a RESET_L"
force /ifstage/reset_l 0 -freeze
force /ifstage/loadpc 0 -freeze
run 5

force /ifstage/reset_l 1 -freeze
echo "Run for 5ns"
run 5
run 5

echo "pcinstaddr should be 0000"

run 10;

echo "Second test, PC can increment 2 on loadpc = 1"
virtual signal {/ifstage/pcinstaddr == 2} test2
add wave -color white /ifstage/test2

force /ifstage/pcmuxsel 0 -freeze
run 2
run 2
force /ifstage/loadpc 1 -freeze
run 18
run 18
force /ifstage/loadpc 0 -freeze

echo "pcinstaddr should be 0002"

run 10


echo "Third test, newPC changes and it should reflect in PCInstAddr"
virtual signal {/ifstage/pcinstaddr == 5} test3
add wave -color white /ifstage/test3

force /ifstage/newpc 0000000000000101 -freeze
force /ifstage/pcmuxsel 1 -freeze
run 5
run 5

force /ifstage/loadpc 1 -freeze 
run 15
run 15

force /ifstage/loadpc 0 -freeze

echo "pcinstAddr should be 0005"

noforce /ifstage/pcmuxsel 
noforce /ifstage/loadpc 
run 10



echo "Fourth test, ensure that a new pc can be loaded using only if_c_in control"
virtual signal {/ifstage/pcinstaddr == 39} test4
add wave -color white /ifstage/test4


force /ifstage/newpc 0000000000100111 -freeze
force /ifstage/IF_C_In 0000000000000011 -freeze
run 10
run 10
force /ifstage/IF_C_In 0000000000000000 -freeze


echo "pcinstaddr should be 0027"
run 20


