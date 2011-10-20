--
-- VHDL Architecture ece411.AdjTrap.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-06.ews.illinois.edu)
--          at - 22:45:08 09/14/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AdjTrap IS
   PORT( 
      TrapVect   : IN     LC3b_trapvect8;
      clk        : IN     std_logic;
      AdjTrapout : OUT    LC3b_word
   );

-- Declarations

END AdjTrap ;

--
ARCHITECTURE untitled OF AdjTrap IS
BEGIN
	 AdjTrapout <= "0000000" & TrapVect & '0' AFTER DELAY_MUX2;
END ARCHITECTURE untitled;

