--
-- VHDL Architecture ece411.ZEXT4.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-06.ews.illinois.edu)
--          at - 21:48:58 09/14/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ZEXT4 IS
   PORT( 
      clk      : IN     std_logic;
      imm4     : IN     LC3b_imm4;
      ZEXT4out : OUT    lc3b_word
   );

-- Declarations

END ZEXT4 ;

--
ARCHITECTURE untitled OF ZEXT4 IS
BEGIN
	ZEXT4out <= "000000000000" & imm4;
END ARCHITECTURE untitled;

