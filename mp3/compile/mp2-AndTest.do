echo "--- Executing initialization force file for ../testcode/mp2-AndTest.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp2-AndTest.asm program code."
run 5
change /mp2_cpu/dram/vhdl_memory/mem(0) X"27"
change /mp2_cpu/dram/vhdl_memory/mem(1) X"1E"
change /mp2_cpu/dram/vhdl_memory/mem(2) X"C7"
change /mp2_cpu/dram/vhdl_memory/mem(3) X"5F"
change /mp2_cpu/dram/vhdl_memory/mem(4) X"E6"
change /mp2_cpu/dram/vhdl_memory/mem(5) X"53"
change /mp2_cpu/dram/vhdl_memory/mem(6) X"E3"
change /mp2_cpu/dram/vhdl_memory/mem(7) X"55"
change /mp2_cpu/dram/vhdl_memory/mem(8) X"42"
change /mp2_cpu/dram/vhdl_memory/mem(9) X"56"
change /mp2_cpu/dram/vhdl_memory/mem(10) X"00"
change /mp2_cpu/dram/vhdl_memory/mem(11) X"0E"
change /mp2_cpu/dram/vhdl_memory/mem(12) X"40"
change /mp2_cpu/dram/vhdl_memory/mem(13) X"12"
run 5
echo "Done loading ../testcode/mp2-AndTest.asm program code."
