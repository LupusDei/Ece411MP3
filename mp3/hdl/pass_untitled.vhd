--
-- VHDL Architecture ece411.pass.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 15:25:37 12/05/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY pass IS
   PORT( 
      mDataIn   : IN     LC3b_oword;
      dpmdatain : OUT    lc3b_oword;
      ipmdatain : OUT    lc3b_oword
   );

-- Declarations

END pass ;

--
ARCHITECTURE untitled OF pass IS
BEGIN
	dpmdatain <= mDataIn;
	ipmdatain <= mDataIn;
END ARCHITECTURE untitled;

