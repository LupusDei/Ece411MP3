--
-- VHDL Architecture ece411.compare3bits.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 00:33:38 12/05/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY compare3bits IS
   PORT( 
      LU      : IN     lc3b_8mux_sel;
      LUother : IN     lc3b_8mux_sel;
      result  : OUT    std_logic
   );

-- Declarations

END compare3bits ;

--
ARCHITECTURE untitled OF compare3bits IS
BEGIN
	PROCESS (LU, LUother)
	variable lu1 : integer range 0 to 7;
	variable lu2 : integer range 0 to 7;
	begin
		lu1 := to_integer(unsigned('0' & LU));
		lu2 := to_integer(unsigned('0' & LUother));

		if (lu1 > lu2) then
			result <= '1';
		else
			result <= '0';
		end if;
	end process;
END ARCHITECTURE untitled;

