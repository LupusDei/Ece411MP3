--
-- VHDL Architecture ece411.zero.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 01:08:29 12/05/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY zero IS
   PORT( 
      zero : OUT    lc3b_8mux_sel
   );

-- Declarations

END zero ;

--
ARCHITECTURE untitled OF zero IS
BEGIN
	zero <= "000";
END ARCHITECTURE untitled;

