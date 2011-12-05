--
-- VHDL Architecture ece411.gen_nops.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-13.ews.illinois.edu)
--          at - 22:54:33 12/03/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY gen_nops IS
   PORT( 
      kill : IN     std_logic;
      NOP  : OUT    lc3b_word
   );

-- Declarations

END gen_nops ;

--
ARCHITECTURE untitled OF gen_nops IS
BEGIN
	PROCESS(kill)
	variable tempnop : lc3b_word;
	BEGIN
		if(kill = '1') then
			tempnop := "0000000000000000";
		end if;
	NOP <= tempnop after delay_mux2;	
	END PROCESS;
END ARCHITECTURE untitled;

