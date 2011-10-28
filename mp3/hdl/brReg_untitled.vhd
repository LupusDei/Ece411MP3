--
-- VHDL Architecture ece411.brReg.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-32.ews.illinois.edu)
--          at - 17:40:44 10/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY brReg IS
   PORT( 
      RESET_L : IN     std_logic;
      clk     : IN     std_logic;
      newPC   : IN     lc3b_word;
      newPCIn : OUT    lc3b_word
   );

-- Declarations

END brReg ;

--
ARCHITECTURE untitled OF brReg IS
TYPE RAMMEMORY IS ARRAY (1 DOWNTO 0) OF LC3B_WORD;
SIGNAL RAM : RAMMEMORY;
BEGIN
	-------------------------------------------------------------------
	READ : PROCESS (RAM)
	BEGIN
		newPCIn <= RAM(1) AFTER DELAY_REGFILE_READ;
	END PROCESS READ;
	-------------------------------------------------------------------
	WRITE: PROCESS(CLK, newPC, RESET_L)
	-------------------------------------------------------------------
	BEGIN
		-- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		IF (RESET_L = '0') THEN
			RAM(0) <= "0000000000000000";
			RAM(1) <= "0000000000000000";
		END IF;
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			RAM(1) <= RAM(0);
			RAM(0) <= newPC;
		END IF;
	END PROCESS WRITE;
END ARCHITECTURE untitled;

