--
-- VHDL Architecture ece411.LRUplusone.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 00:43:27 12/05/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRUplusone IS
   PORT( 
      LRUin      : IN     lc3b_8mux_sel;
      LRUplusOne : OUT    lc3b_8mux_sel
   );

-- Declarations

END LRUplusone ;

--
ARCHITECTURE untitled OF LRUplusone IS
BEGIN
	process (lruin)
	begin
		if (lruin = "111") then
			LRUplusone <= lruin after 5 ns;
		else
			LRUplusone <= std_logic_vector(unsigned(lruin) + 1) after 5 ns;
		end if;
	end process;
END ARCHITECTURE untitled;

