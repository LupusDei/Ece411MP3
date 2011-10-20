--
-- VHDL Architecture ece411.Addr_0.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-06.ews.illinois.edu)
--          at - 20:32:03 09/14/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Address_0 IS
   PORT( 
      ADDRESS : IN     LC3b_word;
      clk     : IN     std_logic;
      ADDR_0  : OUT    std_logic
   );

-- Declarations

END Address_0 ;

--
ARCHITECTURE untitled OF Address_0 IS
BEGIN
	ADDR_0 <= ADDRESS(0);
END ARCHITECTURE untitled;

