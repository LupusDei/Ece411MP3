--
-- VHDL Architecture ece411.wanna_branch.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-31.ews.illinois.edu)
--          at - 14:45:04 10/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY wanna_branch IS
   PORT( 
      CheckN      : IN     std_logic;
      CheckP      : IN     std_logic;
      CheckZ      : IN     std_logic;
      TrapDecider : IN     std_logic;
      brInst      : IN     std_logic;
      lastbit     : IN     std_logic;
      n           : IN     std_logic;
      p           : IN     std_logic;
      z           : IN     std_logic;
      Mem_C_Out   : OUT    lc3b_word
   );

-- Declarations

END wanna_branch ;

--
ARCHITECTURE untitled OF wanna_branch IS
BEGIN
	MEM_C_OUT <= "0000000000000" & lastbit & TrapDecider & (brInst and ((CheckN and n) or (CheckP and p) or (CheckZ and z))) after delay_logic3;
END ARCHITECTURE untitled;

