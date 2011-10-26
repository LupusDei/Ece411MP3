--
-- VHDL Architecture ece411.regExtractor.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-12.ews.illinois.edu)
--          at - 19:18:56 10/23/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY regExtractor IS
   PORT( 
      instIn : IN     lc3b_word;
      RA     : OUT    lc3b_reg;
      RB     : OUT    lc3b_reg
   );

-- Declarations

END regExtractor ;

--
ARCHITECTURE untitled OF regExtractor IS
BEGIN
  RA <= instIn(8 downto 6); 
  RB <= instIn(2 downto 0); 
END ARCHITECTURE untitled;

