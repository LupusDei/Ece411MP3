--
-- VHDL Architecture ece411.Stripper.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 21:56:37 12/01/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Stripper IS
   PORT( 
      Mem_C_In  : IN     lc3b_word;
      Mem_C_Out : IN     lc3b_word;
      is_byte   : OUT    std_logic;
      is_odd    : OUT    std_logic
   );

-- Declarations

END Stripper ;

--
ARCHITECTURE untitled OF Stripper IS
BEGIN
	is_byte <= Mem_C_In(13);
	is_odd <= Mem_C_Out(2);
END ARCHITECTURE untitled;

