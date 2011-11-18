--
-- VHDL Architecture ece411.MEM_C_REG.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-16.ews.illinois.edu)
--          at - 03:14:00 10/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MEM_C_REG IS
   PORT( 
      CLK         : IN     std_logic;
      RESET_L     : IN     std_logic;
      mem_c       : IN     lc3b_word;
      stall       : IN     std_logic;
      MEM_C_In    : OUT    lc3b_word;
      dm_read_l   : OUT    std_logic := '1';
      dm_writeh_l : OUT    std_logic := '1';
      dm_writel_l : OUT    std_logic := '1'
   );

-- Declarations

END MEM_C_REG ;

--
ARCHITECTURE untitled OF MEM_C_REG IS
TYPE MEM_C_Mem IS ARRAY (1 DOWNTO 0) OF LC3B_WORD;
SIGNAL mem : MEM_C_Mem;
BEGIN
	MEM_C_LEAVING : PROCESS(mem)
	variable control : lc3b_word;
	BEGIN
		control := mem(1);
		MEM_C_In <= control(15 downto 7) & "000" & control(3 downto 0) after delay_regfile_read;
		dm_writeh_l <= control(6) after delay_reg;
		dm_writel_l <= control(5) after delay_reg;
		dm_read_l <= control(4) after delay_reg;
	END PROCESS MEM_C_LEAVING;

	MEM_C_ENTERING : PROCESS(clk, mem_c, RESET_L, stall)
	BEGIN
		if RESET_L = '0' then
			mem(0) <= "0000000001110000";
			mem(1) <= "0000000001110000";
		end if;

		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0') and stall = '0') THEN
			mem(1) <= mem(0);
			mem(0) <= mem_c;
		end if;
	END PROCESS MEM_C_ENTERING;
END ARCHITECTURE untitled;

