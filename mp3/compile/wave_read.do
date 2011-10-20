onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -radix binary /mp2_cpu/controlunit/opcode
add wave -noupdate -format Literal /mp2_cpu/dram/cache_dp/alru/lru
add wave -noupdate -format Logic /mp2_cpu/dram/cache_dp/lruout
add wave -noupdate -format Literal /mp2_cpu/dram/cache_dp/way0/index
add wave -noupdate -format Literal /mp2_cpu/dram/pmdatain
add wave -noupdate -format Literal /mp2_cpu/dram/address
add wave -noupdate -format Literal /mp2_cpu/dram/pmaddress
add wave -noupdate -format Literal /mp2_cpu/dram/cache_dp/datain
add wave -noupdate -format Logic /mp2_cpu/dram/mread_l
add wave -noupdate -format Logic /mp2_cpu/dram/mwriteh_l
add wave -noupdate -format Logic /mp2_cpu/dram/mresp_h
add wave -noupdate -format Logic /mp2_cpu/dram/cache_dp/way0/prehit
add wave -noupdate -format Logic /mp2_cpu/dram/cache_dp/way1/prehit
add wave -noupdate -format Logic /mp2_cpu/dram/hit
add wave -noupdate -format Logic /mp2_cpu/dram/miss
add wave -noupdate -format Logic /mp2_cpu/dram/in_idlehit
add wave -noupdate -format Logic /mp2_cpu/dram/in_load
add wave -noupdate -format Logic /mp2_cpu/dram/pmread_l
add wave -noupdate -format Logic /mp2_cpu/dram/pmresp_h
add wave -noupdate -format Literal -expand /mp2_cpu/thedatapath/aregfile/ram
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9534 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ns} {1 us}
