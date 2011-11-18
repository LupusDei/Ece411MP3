echo "--- Executing initialization force file for ../testcode/addforwarding.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
-- force /start_h 0 @0
-- force /start_h 1 @10

force -freeze /mp3_cpu/clk 0 -repeat 50
force -freeze /mp3_cpu/clk 1 25 -repeat 50
-- Test case: lowering start_h should not impact the function of the processor
-- force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/addforwarding.asm program code."
run 5
change /mp3_cpu/L1Cache/IPRAM/vhdl_memory/mem(0) X"22"
change /mp3_cpu/L1Cache/IPRAM/vhdl_memory/mem(1) X"12"
change /mp3_cpu/L1Cache/IPRAM/vhdl_memory/mem(2) X"40"
change /mp3_cpu/L1Cache/IPRAM/vhdl_memory/mem(3) X"16"
change /mp3_cpu/L1Cache/IPRAM/vhdl_memory/mem(4) X"40"
change /mp3_cpu/L1Cache/IPRAM/vhdl_memory/mem(5) X"1A"
change /mp3_cpu/L1Cache/IPRAM/vhdl_memory/mem(6) X"C0"
change /mp3_cpu/L1Cache/IPRAM/vhdl_memory/mem(7) X"77"
change /mp3_cpu/L1Cache/IPRAM/vhdl_memory/mem(8) X"C0"
change /mp3_cpu/L1Cache/IPRAM/vhdl_memory/mem(9) X"6D"
change /mp3_cpu/L1Cache/DPRAM/vhdl_memory/mem(0) X"22"
change /mp3_cpu/L1Cache/DPRAM/vhdl_memory/mem(1) X"12"
change /mp3_cpu/L1Cache/DPRAM/vhdl_memory/mem(2) X"40"
change /mp3_cpu/L1Cache/DPRAM/vhdl_memory/mem(3) X"16"
change /mp3_cpu/L1Cache/DPRAM/vhdl_memory/mem(4) X"40"
change /mp3_cpu/L1Cache/DPRAM/vhdl_memory/mem(5) X"1A"
change /mp3_cpu/L1Cache/DPRAM/vhdl_memory/mem(6) X"C0"
change /mp3_cpu/L1Cache/DPRAM/vhdl_memory/mem(7) X"77"
change /mp3_cpu/L1Cache/DPRAM/vhdl_memory/mem(8) X"C0"
change /mp3_cpu/L1Cache/DPRAM/vhdl_memory/mem(9) X"6D"
run 5
echo "Done loading ../testcode/addforwarding.asm program code."
