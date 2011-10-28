--
-- VHDL Architecture ece411.GenCondCodes.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-31.ews.illinois.edu)
--          at - 14:22:54 10/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY GenCondCodes IS
   PORT( 
      gencc_in : IN     lc3b_word;
      GenCCout : OUT    lc3b_cc
   );

-- Declarations

END GenCondCodes ;

--
ARCHITECTURE untitled OF GenCondCodes IS
BEGIN
	VHDL_GENCC : PROCESS (gencc_in)
	BEGIN    
		IF (gencc_in = "0000000000000000") THEN
			GENCCOUT <= "010" AFTER DELAY_GENCC;
		ELSIF (gencc_in(15) = '1') THEN
			GENCCOUT <= "100" AFTER DELAY_GENCC;
		ELSE
			GENCCOUT <= "001" AFTER DELAY_GENCC;
		END IF;
	END PROCESS VHDL_GENCC;
END ARCHITECTURE untitled;

