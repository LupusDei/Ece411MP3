--
-- VHDL Architecture ece411.EX_C_UNIT.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-16.ews.illinois.edu)
--          at - 23:15:45 10/24/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY EX_C_UNIT IS
   PORT( 
      instOut : IN     lc3b_word;
      ex_c    : OUT    lc3b_word
   );

-- Declarations

END EX_C_UNIT ;

--
ARCHITECTURE untitled OF EX_C_UNIT IS
signal pre_EX_C : lc3b_word;
BEGIN
	PROCESS(instOut)
		BEGIN 	
			IF(instOut(15 downto 12) = "0001") THEN
				pre_EX_C <= "0000000000000000";
			else 
				pre_EX_C <= "1111000000000000";
			END IF; 
		END PROCESS;
	EX_C <= pre_EX_C after delay_decode3;

END ARCHITECTURE untitled;

