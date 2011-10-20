--
-- VHDL Architecture ece411.Splitter.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-09.ews.illinois.edu)
--          at - 21:17:23 09/22/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Splitter IS
   PORT( 
      ADDRESS : IN     LC3b_word;
      index   : OUT    lc3b_c_index;
      offset  : OUT    lc3b_c_offset;
      tag     : OUT    lc3b_c_tag
   );

-- Declarations

END Splitter ;

--
ARCHITECTURE untitled OF Splitter IS
BEGIN
	tag <= ADDRESS(15 downto 7);
	index <= ADDRESS(6 downto 4);
	offset <= ADDRESS(3 downto 0);
END ARCHITECTURE untitled;

