--
-- VHDL Architecture ece411.parseMemCIn2.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-13.ews.illinois.edu)
--          at - 22:06:15 12/03/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY parseMemCIn2 IS
   PORT( 
      preMem_C_In2 : IN     lc3b_word;
      is_ldisti    : OUT    STD_LOGIC
   );

-- Declarations

END parseMemCIn2 ;

--
ARCHITECTURE untitled OF parseMemCIn2 IS
BEGIN
	is_ldisti <= preMem_C_In2(14);
END ARCHITECTURE untitled;

