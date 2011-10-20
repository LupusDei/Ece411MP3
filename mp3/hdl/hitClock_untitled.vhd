--
-- VHDL Architecture ece411.hitClock.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-31.ews.illinois.edu)
--          at - 20:55:16 09/27/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY hitClock IS
   PORT( 
      clk        : IN     std_logic;
      delayClock : OUT    std_logic
   );

-- Declarations

END hitClock ;

--
ARCHITECTURE untitled OF hitClock IS
BEGIN
		delayClock <= clk'delayed(34 ns) AND (NOT clk);
END ARCHITECTURE untitled;

