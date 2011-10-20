echo "--- Executing initialization force file for ../testcode/mp2-JMPTest.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp2-JMPTest.asm program code."
run 5
change /mp2_cpu/dram/vhdl_memory/mem(0) X"04"
change /mp2_cpu/dram/vhdl_memory/mem(1) X"E2"
change /mp2_cpu/dram/vhdl_memory/mem(2) X"40"
change /mp2_cpu/dram/vhdl_memory/mem(3) X"C0"
change /mp2_cpu/dram/vhdl_memory/mem(4) X"41"
change /mp2_cpu/dram/vhdl_memory/mem(5) X"14"
change /mp2_cpu/dram/vhdl_memory/mem(6) X"41"
change /mp2_cpu/dram/vhdl_memory/mem(7) X"16"
change /mp2_cpu/dram/vhdl_memory/mem(8) X"41"
change /mp2_cpu/dram/vhdl_memory/mem(9) X"18"
change /mp2_cpu/dram/vhdl_memory/mem(10) X"67"
change /mp2_cpu/dram/vhdl_memory/mem(11) X"1E"
change /mp2_cpu/dram/vhdl_memory/mem(12) X"C0"
change /mp2_cpu/dram/vhdl_memory/mem(13) X"C1"
change /mp2_cpu/dram/vhdl_memory/mem(14) X"41"
change /mp2_cpu/dram/vhdl_memory/mem(15) X"1A"
change /mp2_cpu/dram/vhdl_memory/mem(16) X"28"
change /mp2_cpu/dram/vhdl_memory/mem(17) X"1C"
change /mp2_cpu/dram/vhdl_memory/mem(18) X"00"
change /mp2_cpu/dram/vhdl_memory/mem(19) X"0E"
change /mp2_cpu/dram/vhdl_memory/mem(20) X"FF"
change /mp2_cpu/dram/vhdl_memory/mem(21) X"0F"
run 5
echo "Done loading ../testcode/mp2-JMPTest.asm program code."
