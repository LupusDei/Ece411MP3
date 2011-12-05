--
-- VHDL Architecture ece411.Splitter1.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-18.ews.illinois.edu)
--          at - 22:18:40 12/01/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Splitter1 IS
   PORT( 
      ADDRESS : IN     LC3b_word;
      index   : OUT    lc3b_c_index;
      tag     : OUT    lc3b_c_tag
   );

-- Declarations

END Splitter1 ;

--
ARCHITECTURE untitled OF Splitter1 IS
BEGIN
	tag <= ADDRESS(15 downto 7);
	index <= ADDRESS(6 downto 4);
END ARCHITECTURE untitled;

