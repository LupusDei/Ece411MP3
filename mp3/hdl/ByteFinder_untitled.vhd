--
-- VHDL Architecture ece411.ByteFinder.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-20.ews.illinois.edu)
--          at - 16:08:35 11/18/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteFinder IS
   PORT( 
      ALUresult     : IN     lc3b_word;
      pre_MEM_C_Out : IN     lc3b_word;
      MEM_C_Out     : OUT    lc3b_word
   );

-- Declarations

END ByteFinder ;

--
ARCHITECTURE untitled OF ByteFinder IS
BEGIN
	MEM_C_Out <= "00000000000000" & ALUresult(0) & pre_MEM_C_Out(0);
END ARCHITECTURE untitled;

