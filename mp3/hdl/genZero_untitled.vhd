--
-- VHDL Architecture ece411.genZero.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 15:09:44 12/05/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY genZero IS
   PORT( 
      zeroSignal : OUT    std_logic
   );

-- Declarations

END genZero ;

--
ARCHITECTURE untitled OF genZero IS
BEGIN
	zeroSignal <= '0';
END ARCHITECTURE untitled;

