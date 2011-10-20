--
-- VHDL Architecture ece411.my3NAND.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-18.ews.illinois.edu)
--          at - 19:16:53 09/26/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY my3NAND IS
   PORT( 
      a : IN     std_logic;
      b : IN     std_logic;
      c : IN     std_logic;
      o : OUT    std_logic
   );

-- Declarations

END my3NAND ;

--
ARCHITECTURE untitled OF my3NAND IS
BEGIN
	PROCESS (A, B, C)
	variable match : std_logic;
	BEGIN
		if ((A = '1') AND (B = '1') AND (C = '1')) then
			match := '0';
		else
			match := '1';
		end if;
		O <= match after delay_logic3;
	END PROCESS;
END ARCHITECTURE untitled;

