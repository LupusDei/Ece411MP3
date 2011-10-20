--
-- VHDL Architecture ece411.Compare.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-06.ews.illinois.edu)
--          at - 22:49:11 09/25/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Compare IS
   PORT( 
      addr_tag : IN     lc3b_c_tag;
      data_tag : IN     lc3b_c_tag;
      match    : OUT    std_logic
   );

-- Declarations

END Compare ;

--
ARCHITECTURE untitled OF Compare IS
BEGIN
	COMPARING : PROCESS (addr_tag, data_tag)
	variable positive_match : std_logic;

	BEGIN
		if (addr_tag = data_tag) then
			positive_match := '1';
		else
			positive_match := '0';
		end if;
		match <= positive_match after delay_compare9;
	END PROCESS;
END ARCHITECTURE untitled;

