--
-- VHDL Architecture ece411.Worthless.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-12.ews.illinois.edu)
--          at - 20:27:53 10/23/11
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
      In0  : IN     LC3b_word;
      Out0 : OUT    LC3b_word
   );

-- Declarations

END Worthless ;

--
ARCHITECTURE untitled OF Worthless IS
BEGIN
  Out0 <= In0;
END ARCHITECTURE untitled;

