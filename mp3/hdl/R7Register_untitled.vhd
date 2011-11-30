--
-- VHDL Architecture ece411.R7Register.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-24.ews.illinois.edu)
--          at - 04:54:40 11/30/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY R7Register IS
   PORT( 
      CLK     : IN     std_logic;
      RESET_L : IN     std_logic;
      STALL   : IN     std_logic;
      SrcIn   : IN     lc3b_word;
      PCvalue : OUT    lc3b_word
   );

-- Declarations

END R7Register ;

--
ARCHITECTURE untitled OF R7Register IS
TYPE RAMMEMORY IS ARRAY (1 DOWNTO 0) OF LC3B_WORD;
SIGNAL RAM : RAMMEMORY;
BEGIN
	-------------------------------------------------------------------
	READ : PROCESS (RAM)
	BEGIN
		PCvalue <= RAM(1) AFTER DELAY_REGFILE_READ;
	END PROCESS READ;
	-------------------------------------------------------------------
	WRITE: PROCESS(CLK, srcIn, RESET_L, stall)
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
			RAM(0) <= srcIn;
		END IF;
	END PROCESS WRITE;
END ARCHITECTURE untitled;

