--
-- VHDL Architecture ece411.oWordMerger.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-25.ews.illinois.edu)
--          at - 15:21:09 09/30/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY oWordMerger IS
   PORT( 
      newword0   : IN     lc3b_word;
      newword1   : IN     lc3b_word;
      newword2   : IN     lc3b_word;
      newword3   : IN     lc3b_word;
      newword4   : IN     lc3b_word;
      newword5   : IN     lc3b_word;
      newword6   : IN     lc3b_word;
      newword7   : IN     lc3b_word;
      newWayData : OUT    lc3b_oword
   );

-- Declarations

END oWordMerger ;

--
ARCHITECTURE untitled OF oWordMerger IS
BEGIN
	newWayData <= newword7 & newword6 & newword5 & newword4 & newword3 & newword2 & newword1 & newword0;
END ARCHITECTURE untitled;

