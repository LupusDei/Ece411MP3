--
-- VHDL Architecture ece411.ADJ9.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-27.ews.illinois.edu)
--          at - 14:58:47 09/01/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ9 IS
   PORT( 
      clk     : IN     std_logic;
      offset9 : IN     LC3b_offset9;
      ADJ9out : OUT    LC3b_word
   );

-- Declarations

END ADJ9 ;

--
ARCHITECTURE untitled OF ADJ9 IS
BEGIN
	ADJ9OUT <= OFFSET9(8) & OFFSET9(8) & OFFSET9(8) & OFFSET9(8) & OFFSET9(8) & OFFSET9(8) & OFFSET9 & '0' AFTER DELAY_MUX2;
END ARCHITECTURE untitled;
