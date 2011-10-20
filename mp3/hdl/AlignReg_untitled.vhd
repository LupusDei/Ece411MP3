--
-- VHDL Architecture ece411.AlignReg.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-09.ews.illinois.edu)
--          at - 23:39:19 09/07/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AlignReg IS
   PORT( 
      RFAout        : IN     LC3b_word;
      clk           : IN     std_logic;
      JmpAlignedAdr : OUT    LC3b_word
   );

-- Declarations

END AlignReg ;

--
ARCHITECTURE untitled OF AlignReg IS
BEGIN
	JmpAlignedAdr <= RFAout(15 DOWNTO 1) & '0' AFTER DELAY_MUX2;
END ARCHITECTURE untitled;

