--
-- VHDL Architecture ece411.TransitionReg3.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-32.ews.illinois.edu)
--          at - 14:49:31 10/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TransitionReg3 IS
   PORT( 
      RESET_L : IN     std_logic;
      clk     : IN     std_logic;
      d1      : IN     lc3b_word;
      d2      : IN     lc3b_word;
      d3      : IN     lc3b_word;
      o1      : OUT    lc3b_word;
      o2      : OUT    lc3b_word;
      o3      : OUT    lc3b_word
   );

-- Declarations

END TransitionReg3 ;

--
ARCHITECTURE untitled OF TransitionReg3 IS
TYPE RAMMEMORY IS ARRAY (2 DOWNTO 0) OF LC3B_WORD;
SIGNAL RAM : RAMMEMORY;
BEGIN
	-------------------------------------------------------------------
	READ : PROCESS (RAM)
	BEGIN
		o1 <= RAM(0) AFTER DELAY_REGFILE_READ;
		o2 <= RAM(1) AFTER DELAY_REGFILE_READ;
		o3 <= RAM(2) AFTER DELAY_REGFILE_READ;
	END PROCESS READ;
	-------------------------------------------------------------------
	WRITE: PROCESS(CLK, d1, d2, d3, RESET_L)
	-------------------------------------------------------------------
	BEGIN
		-- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		IF (RESET_L = '0') THEN
			RAM(0) <= "0000000000000000";
			RAM(1) <= "0000000000000000";
			RAM(2) <= "0000000000000000";
		END IF;
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			RAM(0) <= d1;
			RAM(1) <= d2;
			RAM(2) <= d3;
		END IF;
	END PROCESS WRITE;
END ARCHITECTURE untitled;

