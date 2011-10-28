--
-- VHDL Architecture ece411.shift.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-16.ews.illinois.edu)
--          at - 03:47:11 10/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY shift IS
   PORT( 
      Offset6     : IN     LC3b_word;
      off6shifted : OUT    LC3b_word
   );

-- Declarations

END shift ;

--
ARCHITECTURE untitled OF shift IS
BEGIN
	off6shifted <= Offset6(14 downto 0) & '0';
END ARCHITECTURE untitled;

