--
-- VHDL Architecture ece411.ByteMerger.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-25.ews.illinois.edu)
--          at - 14:55:08 09/30/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteMerger IS
   PORT( 
      HighByte : IN     lc3b_byte;
      LowByte  : IN     lc3b_byte;
      newWord  : OUT    lc3b_word
   );

-- Declarations

END ByteMerger ;

--
ARCHITECTURE untitled OF ByteMerger IS
BEGIN
	newWord <= HighByte & LowByte;
END ARCHITECTURE untitled;

