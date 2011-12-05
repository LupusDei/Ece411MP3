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
BEGIN
	PROCESS(instOut)
	variable is_ldisti : std_logic;
	variable predmread_l : std_logic;
	variable predmwritel_l : std_logic;
	variable predmwriteh_l : std_logic;
	variable opcode : lc3b_opcode;
	BEGIN
		is_ldisti := '0';
		opcode := instOut(15 downto 12);
		predmread_l := '1';
		predmwritel_l := '1';
		predmwriteh_l := '1';
		if(opcode = "1010") then
			is_ldisti := '1';
			predmread_l := '0';
		elsif(opcode = "1011") then
			is_ldisti := '1';
			predmwritel_l := '0';
			predmwriteh_l := '0';
		end if;
	mem_c2 <= '0' & is_ldisti & "0000000" & predmwriteh_l & predmwritel_l & predmread_l & "0000" after 4 ns;
	END PROCESS;
END ARCHITECTURE untitled;

