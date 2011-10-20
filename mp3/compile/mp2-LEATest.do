echo "--- Executing initialization force file for ../testcode/mp2-LEATest.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp2-LEATest.asm program code."
run 5
change /mp2_cpu/dram/vhdl_memory/mem(0) X"04"
change /mp2_cpu/dram/vhdl_memory/mem(1) X"E2"
change /mp2_cpu/dram/vhdl_memory/mem(2) X"6A"
change /mp2_cpu/dram/vhdl_memory/mem(3) X"54"
change /mp2_cpu/dram/vhdl_memory/mem(4) X"00"
change /mp2_cpu/dram/vhdl_memory/mem(5) X"0E"
change /mp2_cpu/dram/vhdl_memory/mem(6) X"40"
change /mp2_cpu/dram/vhdl_memory/mem(7) X"12"
run 5
echo "Done loading ../testcode/mp2-LEATest.asm program code."
