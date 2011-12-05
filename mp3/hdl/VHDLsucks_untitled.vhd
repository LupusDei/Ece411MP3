--
-- VHDL Architecture ece411.VHDLsucks.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (linux4.ews.illinois.edu)
--          at - 16:48:18 12/04/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY VHDLsucks IS
   PORT( 
      count   : IN     integer;
      mycount : OUT    integer
   );

-- Declarations

END VHDLsucks ;

--
ARCHITECTURE untitled OF VHDLsucks IS
BEGIN
	mycount <= count;
END ARCHITECTURE untitled;

