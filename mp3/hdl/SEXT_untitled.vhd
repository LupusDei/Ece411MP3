--
-- VHDL Architecture ece411.SEXT.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-09.ews.illinois.edu)
--          at - 19:55:37 09/07/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mp2_SEXT IS
   PORT( 
      clk     : IN     std_logic;
      imm5    : IN     LC3b_imm5;
      SEXTout : OUT    LC3b_word
   );

-- Declarations

END mp2_SEXT ;

--
ARCHITECTURE untitled OF mp2_SEXT IS
BEGIN
	SEXTout <= imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5 AFTER DELAY_MUX2;
END ARCHITECTURE untitled;

