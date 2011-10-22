--
-- VHDL Architecture ece411.PCPlus2.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-32.ews.illinois.edu)
--          at - 16:46:13 10/22/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PCPlus2 IS
   PORT( 
      PCinstAddr : IN     lc3b_word;
      nextPC     : OUT    lc3b_word
   );

-- Declarations

END PCPlus2 ;

--
ARCHITECTURE untitled OF PCPlus2 IS

BEGIN
    VHDL_ADD_2 : PROCESS (PCinstAddr)
	  BEGIN  -- PROCESS
		  nextPC <= STD_LOGIC_VECTOR(UNSIGNED(PCinstAddr) + 2 ) AFTER DELAY_ADDER;
	  END PROCESS;
  
END ARCHITECTURE untitled;

