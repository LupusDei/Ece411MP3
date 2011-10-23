--
-- VHDL Architecture ece411.Worthless.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-33.ews.illinois.edu)
--          at - 20:58:10 10/22/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Worthless IS
   PORT( 
      InstMemIn : IN     lc3b_word;
      inst      : OUT    lc3b_word
   );

-- Declarations

END Worthless ;

--
ARCHITECTURE untitled OF Worthless IS
BEGIN
	inst <= InstMemIn;
END ARCHITECTURE untitled;

