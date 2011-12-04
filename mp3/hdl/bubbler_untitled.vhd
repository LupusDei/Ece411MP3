--
-- VHDL Architecture ece411.bubbler.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-08.ews.illinois.edu)
--          at - 01:47:55 12/03/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY bubbler IS
   PORT( 
      ID_C_Out : IN     lc3b_word;
      kill     : OUT    std_logic
   );

-- Declarations

END bubbler ;

--
ARCHITECTURE untitled OF bubbler IS
BEGIN
	kill <= ID_C_Out(12);
END ARCHITECTURE untitled;

