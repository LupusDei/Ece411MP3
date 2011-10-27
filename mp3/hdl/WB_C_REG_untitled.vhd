--
-- VHDL Architecture ece411.WB_C_REG.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-26.ews.illinois.edu)
--          at - 21:16:06 10/25/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WB_C_REG IS
   PORT( 
      RESET_L : IN     std_logic;
      clk     : IN     std_logic;
      wb_c    : IN     lc3b_word;
      WB_C_In : OUT    lc3b_word
   );

-- Declarations

END WB_C_REG ;

--
ARCHITECTURE untitled OF WB_C_REG IS
TYPE WB_C_Mem IS ARRAY (1 DOWNTO 0) OF LC3B_WORD;
SIGNAL mem : WB_C_Mem;
BEGIN
	WB_C_LEAVING : PROCESS(mem)
	BEGIN
		WB_C_In <= mem(1) after delay_regfile_read;
	END PROCESS WB_C_LEAVING;

	WB_C_ENTERING : PROCESS(clk, wb_c, RESET_L)
	BEGIN
		if RESET_L = '0' then
			mem(0) <= "0000000000000000";
			mem(1) <= "0000000000000000";
		end if;

		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			mem(1) <= mem(0);
			mem(0) <= wb_c;
		end if;
	END PROCESS WB_C_ENTERING;
END ARCHITECTURE untitled;
