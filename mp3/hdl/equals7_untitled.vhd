--
-- VHDL Architecture ece411.equals7.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 01:18:27 12/05/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY equals7 IS
   PORT( 
      LU     : IN     lc3b_8mux_sel;
      equals : OUT    std_logic
   );

-- Declarations

END equals7 ;

--
ARCHITECTURE untitled OF equals7 IS
BEGIN
	process (LU)
	begin
		if (LU = "111") then
			equals <= '1' after delay_logic3;
		else
			equals <= '0' after delay_logic3;
		end if;
	end process;
END ARCHITECTURE untitled;

