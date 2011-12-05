--
-- VHDL Architecture ece411.hitClock8.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-18.ews.illinois.edu)
--          at - 23:24:44 12/01/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY hitClock8 IS
   PORT( 
      clk : IN     std_logic;
      B   : OUT    std_logic
   );

-- Declarations

END hitClock8 ;

--
ARCHITECTURE untitled OF hitClock8 IS
BEGIN
		B <= clk'delayed(36 ns) AND (NOT clk);
END ARCHITECTURE untitled;

