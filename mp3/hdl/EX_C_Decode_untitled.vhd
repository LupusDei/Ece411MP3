--
-- VHDL Architecture ece411.EX_C_Decode.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-34.ews.illinois.edu)
--          at - 19:17:00 10/21/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY EX_C_Decode IS
   PORT( 
      EX_C_In : IN     lc3b_word;
      ALUOP   : OUT    LC3B_ALUOP
   );

-- Declarations

END EX_C_Decode ;

--
ARCHITECTURE untitled OF EX_C_Decode IS
BEGIN
	ALUOP <= EX_C_IN(2 downto 0);
END ARCHITECTURE untitled;

