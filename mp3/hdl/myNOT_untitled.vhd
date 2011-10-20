--
-- VHDL Architecture ece411.myNOT.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-18.ews.illinois.edu)
--          at - 19:29:42 09/26/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY myNOT IS
   PORT( 
      a     : IN     std_logic;
      a_not : OUT    std_logic
   );

-- Declarations

END myNOT ;

--
ARCHITECTURE untitled OF myNOT IS
BEGIN
	PROCESS (A)
	variable not_a : std_logic;
	BEGIN
		if (A = '1') then
			not_a := '0';
		else
			not_a := '1';
		end if;
		a_not <= not_a after 1 ns;
	END PROCESS;
END ARCHITECTURE untitled;

