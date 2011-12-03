--
-- VHDL Architecture ece411.theNZPsplit.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-31.ews.illinois.edu)
--          at - 14:29:55 10/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY theNZPsplit IS
   PORT( 
      CLK     : IN     std_logic;
      DestReg : IN     lc3b_cc;
      CheckN  : OUT    std_logic;
      CheckP  : OUT    std_logic;
      CheckZ  : OUT    std_logic
   );

-- Declarations

END theNZPsplit ;

--
ARCHITECTURE untitled OF theNZPsplit IS
BEGIN
	CHECKN <= DestReg(2);
	CHECKZ <= DestReg(1);
	CHECKP <= DestReg(0);
END ARCHITECTURE untitled;

