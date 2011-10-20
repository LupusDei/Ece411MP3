--
-- VHDL Architecture ece411.myAND.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-06.ews.illinois.edu)
--          at - 23:16:52 09/25/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY myAND IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      O : OUT    std_logic
   );

-- Declarations

END myAND ;

--
ARCHITECTURE untitled OF myAND IS
BEGIN
	PROCESS (A, B)
	variable match : std_logic;
	BEGIN
		if ((A = '1') AND (B = '1')) then
			match := '1';
		else
			match := '0';
		end if;
		O <= match after delay_logic2;
	END PROCESS;
END ARCHITECTURE untitled;

