--
-- VHDL Architecture ece411.Worthless2.worthless
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 20:55:34 12/04/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Worthless2 IS
   PORT( 
      Hit     : IN     std_logic;
      MRESP_H : OUT    std_logic
   );

-- Declarations

END Worthless2 ;

--
ARCHITECTURE worthless OF Worthless2 IS
BEGIN
	MRESP_H <= Hit;
END ARCHITECTURE worthless;

