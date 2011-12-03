--
-- VHDL Architecture ece411.theNZP.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-31.ews.illinois.edu)
--          at - 14:35:07 10/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY theNZP IS
   PORT( 
      CLK      : IN     std_logic;
      GenCCout : IN     lc3b_cc;
      loadNZP  : IN     std_logic;
      n        : OUT    std_logic;
      p        : OUT    std_logic;
      z        : OUT    std_logic
   );

-- Declarations

END theNZP ;

--
ARCHITECTURE untitled OF theNZP IS
SIGNAL PRE_NZP : lc3b_cc;
BEGIN
	------------------------------
	VHDL_NZP : PROCESS (CLK, GenCCout)
	------------------------------
	BEGIN
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (LOADNZP = '1') THEN
				PRE_NZP <= GenCCout;
			END IF;
		END IF;
	END PROCESS VHDL_NZP;
	N <= PRE_NZP(2) AFTER DELAY_REG;
	Z <= PRE_NZP(1) AFTER DELAY_REG;
	P <= PRE_NZP(0) AFTER DELAY_REG;
END ARCHITECTURE untitled;

