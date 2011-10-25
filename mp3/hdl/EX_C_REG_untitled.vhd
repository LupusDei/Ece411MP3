--
-- VHDL Architecture ece411.EX_C_REG.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-16.ews.illinois.edu)
--          at - 23:22:16 10/24/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY EX_C_REG IS
   PORT( 
      RESET_L : IN     std_logic;
      clk     : IN     std_logic;
      ex_c    : IN     lc3b_word;
      EX_C_In : OUT    lc3b_word
   );

-- Declarations

END EX_C_REG ;

--
ARCHITECTURE untitled OF EX_C_REG IS
TYPE EX_C_Mem IS ARRAY (1 DOWNTO 0) OF LC3B_WORD;
SIGNAL mem : EX_C_Mem;
BEGIN
	EX_C_LEAVING : PROCESS(mem)
	BEGIN
		EX_C_In <= mem(1) after delay_regfile_read;
	END PROCESS EX_C_LEAVING;

	EX_C_ENTERING : PROCESS(clk, ex_c, RESET_L, mem)
	BEGIN
		if RESET_L = '0' then
			mem(0) <= "0000000000000000";
			mem(1) <= "0000000000000000";
		end if;

		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			mem(1) <= mem(0);
			mem(0) <= ex_c;
		end if;
	END PROCESS EX_C_ENTERING;
END ARCHITECTURE untitled;

