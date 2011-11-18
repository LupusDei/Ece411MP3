--
-- VHDL Architecture ece411.writeLow.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-20.ews.illinois.edu)
--          at - 23:33:43 11/17/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY writeHigh IS
   PORT( 
      im_writeh_l : OUT    std_logic;
      im_writel_l : OUT    std_logic
   );

-- Declarations

END writeHigh ;

--
ARCHITECTURE untitled OF writeHigh IS
BEGIN
	im_writeh_l <= '1';
	im_writel_l <= '1';
END ARCHITECTURE untitled;

