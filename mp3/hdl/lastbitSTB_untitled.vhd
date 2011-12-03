--
-- VHDL Architecture ece411.lastbitSTB.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 22:35:31 12/01/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY lastbitSTB IS
   PORT( 
      ALUresult : IN     lc3b_word;
      lastbit   : OUT    std_logic
   );

-- Declarations

END lastbitSTB ;

--
ARCHITECTURE untitled OF lastbitSTB IS
BEGIN
	lastbit <= ALUresult(0);
END ARCHITECTURE untitled;

