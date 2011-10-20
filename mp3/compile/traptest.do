echo "--- Executing initialization force file for ../testcode/traptest.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/traptest.asm program code."
run 5
change /mp2_cpu/dram/vhdl_memory/mem(0) X"A5"
change /mp2_cpu/dram/vhdl_memory/mem(1) X"14"
change /mp2_cpu/dram/vhdl_memory/mem(2) X"05"
change /mp2_cpu/dram/vhdl_memory/mem(3) X"F0"
change /mp2_cpu/dram/vhdl_memory/mem(4) X"E6"
change /mp2_cpu/dram/vhdl_memory/mem(5) X"16"
change /mp2_cpu/dram/vhdl_memory/mem(6) X"83"
change /mp2_cpu/dram/vhdl_memory/mem(7) X"18"
change /mp2_cpu/dram/vhdl_memory/mem(8) X"FF"
change /mp2_cpu/dram/vhdl_memory/mem(9) X"0F"
change /mp2_cpu/dram/vhdl_memory/mem(10) X"0E"
change /mp2_cpu/dram/vhdl_memory/mem(11) X"00"
change /mp2_cpu/dram/vhdl_memory/mem(12) X"23"
change /mp2_cpu/dram/vhdl_memory/mem(13) X"1A"
change /mp2_cpu/dram/vhdl_memory/mem(14) X"A3"
change /mp2_cpu/dram/vhdl_memory/mem(15) X"12"
change /mp2_cpu/dram/vhdl_memory/mem(16) X"C0"
change /mp2_cpu/dram/vhdl_memory/mem(17) X"C1"
run 5
echo "Done loading ../testcode/traptest.asm program code."
