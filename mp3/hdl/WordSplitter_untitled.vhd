--
-- VHDL Architecture ece411.WordSplitter.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-25.ews.illinois.edu)
--          at - 14:38:48 09/30/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordSplitter IS
   PORT( 
      wordIn   : IN     lc3b_word;
      wordOutH : OUT    lc3b_byte;
      wordOutL : OUT    lc3b_byte
   );

-- Declarations

END WordSplitter ;

--
ARCHITECTURE untitled OF WordSplitter IS
BEGIN
	wordOutH <= wordIn(15 downto 8);
	wordOutL <= wordIn(7 downto 0);
END ARCHITECTURE untitled;

