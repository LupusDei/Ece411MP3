echo "--- Executing initialization force file for the Acceptance Tests"

quietly WaveActivateNextPane {} 0
delete wave *

add wave /lrutruth/RESET_L
add wave -unsigned /lrutruth/index
add wave -unsigned /lrutruth/lruout
add wave -unsigned /lrutruth/lu
add wave -unsigned /lrutruth/lumuxsel
add wave /lrutruth/hit
add wave /lrutruth/prehit0
add wave /lrutruth/prehit1
add wave /lrutruth/prehit2
add wave /lrutruth/prehit3
add wave /lrutruth/prehit4
add wave /lrutruth/prehit5
add wave /lrutruth/prehit6
add wave /lrutruth/prehit7
add wave /lrutruth/win0
add wave /lrutruth/win1
add wave /lrutruth/win2
add wave /lrutruth/win3
add wave /lrutruth/win4
add wave /lrutruth/win5
add wave /lrutruth/win6
add wave /lrutruth/win7
add wave -unsigned /lrutruth/unit7/waylrureg/ram

force -freeze /lrutruth/RESET_L 0
force -freeze /lrutruth/hit 0
force -freeze /lrutruth/prehit0 0
force -freeze /lrutruth/prehit1 0
force -freeze /lrutruth/prehit2 0
force -freeze /lrutruth/prehit3 0
force -freeze /lrutruth/prehit4 0
force -freeze /lrutruth/prehit5 0
force -freeze /lrutruth/prehit6 0
force -freeze /lrutruth/prehit7 0
run 50
force -freeze /lrutruth/RESET_L 1
run 50

#/*index = 0, hit on pre 7,6,5,4,3,2,1,0 - LRUOut should be 7 */
force -freeze /lrutruth/index 000
virtual signal {/lrutruth/lruout == 7 && /lrutruth/index == 0} simple1
add wave -color white /lrutruth/simple1

force -freeze /lrutruth/prehit7 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit7 0
force -freeze /lrutruth/prehit6 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit6 0
force -freeze /lrutruth/prehit5 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit5 0
force -freeze /lrutruth/prehit4 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit4 0
force -freeze /lrutruth/prehit3 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit3 0
force -freeze /lrutruth/prehit2 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit2 0
force -freeze /lrutruth/prehit1 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit1 0
force -freeze /lrutruth/prehit0 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit0 0
run 50


#/*index = 1, hit on pre 4,6,2,4,6,3,0,5,1,7 - LRUOut should be 2 */
force -freeze /lrutruth/index 001
virtual signal {/lrutruth/lruout == 2 && /lrutruth/index == 1} complex
add wave -color white /lrutruth/complex

force -freeze /lrutruth/prehit4 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit4 0
force -freeze /lrutruth/prehit6 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit6 0
force -freeze /lrutruth/prehit2 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit2 0
force -freeze /lrutruth/prehit4 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit4 0
force -freeze /lrutruth/prehit6 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit6 0
force -freeze /lrutruth/prehit3 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit3 0
force -freeze /lrutruth/prehit0 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit0 0
force -freeze /lrutruth/prehit5 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit5 0
force -freeze /lrutruth/prehit1 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit1 0
force -freeze /lrutruth/prehit7 1
run 35
force -freeze /lrutruth/hit 1
run 15
force -freeze /lrutruth/hit 0

force -freeze /lrutruth/prehit7 0
run 50

