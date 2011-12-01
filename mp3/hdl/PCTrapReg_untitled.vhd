--
-- VHDL Architecture ece411.PCTrapReg.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-24.ews.illinois.edu)
--          at - 06:01:17 11/30/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PCTrapReg IS
   PORT( 
      CLK     : IN     std_logic;
      RESET_L : IN     std_logic;
      STALL   : IN     std_logic;
      Src     : IN     lc3b_word;
      PCValue : OUT    lc3b_word
   );

-- Declarations

END PCTrapReg ;

--
ARCHITECTURE untitled OF PCTrapReg IS
TYPE RAMMEMORY IS ARRAY (1 DOWNTO 0) OF LC3B_WORD;
SIGNAL RAM : RAMMEMORY;
BEGIN
	-------------------------------------------------------------------
	READ : PROCESS (RAM)
	BEGIN
		PCValue <= RAM(1) AFTER DELAY_REGFILE_READ;
	END PROCESS READ;
	-------------------------------------------------------------------
	WRITE: PROCESS(CLK, Src, RESET_L, stall)
	-------------------------------------------------------------------
	BEGIN
		-- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		IF (RESET_L = '0') THEN
			RAM(0) <= "0000000000000000";
			RAM(1) <= "0000000000000000";
		END IF;
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0') and stall = '0') THEN
			RAM(1) <= RAM(0);
			RAM(0) <= Src;
		END IF;
	END PROCESS WRITE;
END ARCHITECTURE untitled;

