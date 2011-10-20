--
-- VHDL Architecture ece411.WriteKillClock.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-28.ews.illinois.edu)
--          at - 19:22:53 09/30/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WriteKillClock IS
   PORT( 
      clk     : IN     std_logic;
      killClk : OUT    std_logic
   );

-- Declarations

END WriteKillClock ;

--
ARCHITECTURE untitled OF WriteKillClock IS
BEGIN
	killClk <= clk'delayed(24 ns) AND (NOT clk);
END ARCHITECTURE untitled;

