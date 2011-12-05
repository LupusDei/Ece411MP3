echo "--- Executing initialization force file for the LUnit Tests"

quietly WaveActivateNextPane {} 0
delete wave *

add wave -unsigned /lunit/lu
add wave -unsigned /lunit/luOut
add wave /lunit/luSel
add wave /lunit/winner
add wave /lunit/index
add wave /lunit/hit
add wave /lunit/hitSelect
add wave /lunit/RESET_L
add wave /lunit/waylrureg/ram

force -freeze /lunit/RESET_L 0
run 50
force -freeze /lunit/RESET_L 1
run 50

#/*index = 0, lu = 2, ourlu = 7, no hit yet, we should be a winner and luSel should be 0*/
force -freeze /lunit/lu 010
force -freeze /lunit/index 000
force -freeze /lunit/hit 0
force -freeze /lunit/hitSelect 0

virtual signal {/lunit/winner == 1 && /lunit/index == 0} have_winner
virtual signal {/lunit/luSel == 0 && /lunit/index == 0} selectOldLu
add wave -color white /lunit/have_winner
add wave -color white /lunit/selectOldLu
run 50


#/*index = 0, lu = 7, ourlu = 7, hit comes, we get selected, luOut should get set to 0 as we are the most recently used */
virtual signal {/lunit/luOut == 0 && /lunit/index == 0} mru
add wave -color white /lunit/mru

run 25
force -freeze /lunit/lu 111
force -freeze /lunit/hitSelect 1
run 10
force -freeze /lunit/hit 1
run 15
force -freeze /lunit/hit 0

#/*index = 0, lu = 3, ourlu = 0, hit comes, we are not selected, luOut should get set to 1 as we are no longer the most recently used */
virtual signal {/lunit/luOut == 1 && /lunit/index == 0} not_mru
add wave -color white /lunit/not_mru

run 25
force -freeze /lunit/lu 011
force -freeze /lunit/hitSelect 0
run 10
force -freeze /lunit/hit 1
run 15
force -freeze /lunit/hit 0


#/*index = 0, lu = 3, ourlu = 1, hit comes, we are not selected, luOut should get set to 2 as we are no longer the most recently used */
virtual signal {/lunit/luOut == 2 && /lunit/index == 0} not_mru2
add wave -color white /lunit/not_mru2

run 35
force -freeze /lunit/hit 1
run 15
force -freeze /lunit/hit 0

#/*index = 0, lu = 3, ourlu = 2, hit comes, we are not selected, luOut should get set to 3 as we are no longer the most recently used */
virtual signal {/lunit/luOut == 3 && /lunit/lu == 3 &&/lunit/index == 0} not_mru3
add wave -color white /lunit/not_mru3
run 35
force -freeze /lunit/hit 1
run 15
force -freeze /lunit/hit 0

#/*index = 0, lu = 2, ourlu = 3, hit comes, we are not selected, luOut should stay 3 since the current LU is less than ours*/
virtual signal {/lunit/luOut == 3 && /lunit/lu == 2 &&/lunit/index == 0} not_mru4
add wave -color white /lunit/not_mru4

run 20
force -freeze /lunit/lu 010
run 15
force -freeze /lunit/hit 1
run 15
force -freeze /lunit/hit 0

run 50

