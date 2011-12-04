--
-- VHDL Architecture ece411.MEM_C_UNIT2.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-13.ews.illinois.edu)
--          at - 22:08:20 12/03/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MEM_C_UNIT2 IS
   PORT( 
      instOut : IN     lc3b_word;
      mem_c2  : OUT    lc3b_word
   );

-- Declarations

END MEM_C_UNIT2 ;

--
ARCHITECTURE untitled OF MEM_C_UNIT2 IS
	signal check : std_logic;
	signal regwrite : std_logic;
	signal predmread_l : std_logic;
BEGIN
	PROCESS(instOut)
	BEGIN
		check <= '0';
		predmread_l <= '1';
		regwrite <= '0';
		if(instOut = "0000000000000001") then
			check <= '1';
			predmread_l <= '0';
			regwrite <= '1';
		end if;
	END PROCESS;
	mem_c2 <= '0' & check & '0' & regwrite & "0000000" & predmread_l & "0000" after 4 ns;
END ARCHITECTURE untitled;

