--
-- VHDL Architecture ece411.delayUNIT.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-23.ews.illinois.edu)
--          at - 21:05:58 12/04/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY delayUNIT IS
   PORT( 
      CLK        : IN     std_logic;
      RESET_L    : IN     std_logic;
      stall      : IN     std_logic;
      wb_c       : IN     lc3b_word;
      preWB_C_in : OUT    lc3b_word
   );

-- Declarations

END delayUNIT ;

--
ARCHITECTURE untitled OF delayUNIT IS
	TYPE WB_C_Mem IS ARRAY (1 DOWNTO 0) OF LC3B_WORD;
SIGNAL mem : WB_C_Mem;
SIGNAL temp : lc3b_word;
BEGIN
	WB_C_LEAVING : PROCESS(mem, wb_c)
	BEGIN
		if(temp(11) = '1') then
			preWB_C_In <= temp(15 downto 2) & '1' & temp(0) after delay_regfile_read;
		else preWB_C_In <= wb_c after delay_regfile_read;
		end if;
	END PROCESS WB_C_LEAVING;

	WB_C_ENTERING : PROCESS(clk, wb_c, RESET_L, stall)
	BEGIN
		if RESET_L = '0' then
			mem(0) <= "0000000000000000";
		end if;
		
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0') and wb_c(11) = '1' and stall = '0') THEN
			mem(0) <= wb_c;
			temp <= wb_c;
		else temp <= "0000000000000000";
		end if;
	END PROCESS WB_C_ENTERING;

END ARCHITECTURE untitled;

