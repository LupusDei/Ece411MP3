--
-- VHDL Architecture ece411.MEM_C_REG2.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-13.ews.illinois.edu)
--          at - 20:38:26 12/03/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MEM_C_REG2 IS
   PORT( 
      CLK             : IN     std_logic;
      RESET_L         : IN     std_logic;
      mem_c2          : IN     lc3b_word;
      preMem_C_In2    : OUT    lc3b_word;
      predm_read2_l   : OUT    std_logic;
      predm_write2h_l : OUT    std_logic;
      predm_write2l_l : OUT    std_logic
   );

-- Declarations

END MEM_C_REG2 ;

--
ARCHITECTURE untitled OF MEM_C_REG2 IS
TYPE MEM_C_Mem IS ARRAY (1 DOWNTO 0) OF LC3B_WORD;
SIGNAL mem : MEM_C_Mem;
signal control : lc3b_word;
BEGIN
	MEM_C_LEAVING : PROCESS(mem)
	BEGIN
		control <= mem(1);
		preMEM_C_In2 <= control(15 downto 7) & "000" & control(3 downto 0) after delay_regfile_read;
		predm_write2h_l <= control(6) after delay_reg;
		predm_write2l_l <= control(5) after delay_reg;
		predm_read2_l <= control(4) after delay_reg;
	END PROCESS MEM_C_LEAVING;

	MEM_C_ENTERING : PROCESS(clk, mem_c2, RESET_L)
	BEGIN
		if RESET_L = '0' then
			mem(0) <= "0000000001110000";
			mem(1) <= "0000000001110000";
		end if;

		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			mem(1) <= mem(0);
			mem(0) <= mem_c2;
		end if;
	END PROCESS MEM_C_ENTERING;
END ARCHITECTURE untitled;

