--
-- VHDL Architecture ece411.oWordSplitter.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-25.ews.illinois.edu)
--          at - 15:09:35 09/30/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY oWordSplitter IS
   PORT( 
      WayData : IN     lc3b_oword;
      word0   : OUT    lc3b_word;
      word1   : OUT    lc3b_word;
      word2   : OUT    lc3b_word;
      word3   : OUT    lc3b_word;
      word4   : OUT    lc3b_word;
      word5   : OUT    lc3b_word;
      word6   : OUT    lc3b_word;
      word7   : OUT    lc3b_word
   );

-- Declarations

END oWordSplitter ;

--
ARCHITECTURE untitled OF oWordSplitter IS
BEGIN
				word0 <= WayData(15 downto 0);
				word1 <= WayData(31 downto 16);
				word2 <= WayData(47 downto 32);
				word3 <= WayData(63 downto 48);
				word4 <= WayData(79 downto 64);
				word5 <= WayData(95 downto 80);
				word6 <= WayData(111 downto 96);
				word7 <= WayData(127 downto 112);
END ARCHITECTURE untitled;

