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
      ALUOP   : OUT    LC3B_ALUOP;
      fwdA    : OUT    std_logic_vector (1 DOWNTO 0);
      fwdB    : OUT    std_logic_vector (1 DOWNTO 0);
      strSel  : OUT    STD_LOGIC_VECTOR (1 DOWNTO 0)
   );

-- Declarations

END EX_C_Decode ;

--
ARCHITECTURE untitled OF EX_C_Decode IS
BEGIN
	ALUOP <= EX_C_IN(2 downto 0);
	strSel <= EX_C_IN(8 downto 7);
	fwdA <= EX_C_IN(6 downto 5);
	fwdB <= EX_C_IN(4 downto 3);
END ARCHITECTURE untitled;

