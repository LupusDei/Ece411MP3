--
-- VHDL Architecture ece411.WB_C_Decode.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-26.ews.illinois.edu)
--          at - 20:13:56 10/25/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WB_C_Decode IS
   PORT( 
      WB_C_In  : IN     lc3b_word;
      DR       : OUT    lc3b_reg;
      RegWrite : OUT    std_logic;
      WBMuxSel : OUT    STD_LOGIC
   );

-- Declarations

END WB_C_Decode ;

--
ARCHITECTURE untitled OF WB_C_Decode IS
BEGIN
	DR <= WB_C_IN(4 downto 2);
	RegWrite <= WB_C_IN(1);
	WBMuxSel <= WB_C_IN(0);
END ARCHITECTURE untitled;

