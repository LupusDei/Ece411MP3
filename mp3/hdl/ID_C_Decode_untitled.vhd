--
-- VHDL Architecture ece411.ID_C_Decode.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-12.ews.illinois.edu)
--          at - 19:41:54 10/23/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ID_C_Decode IS
   PORT( 
      ID_C_In    : IN     lc3b_word;
      ALUMuxSel  : OUT    LC3b_8MUX_SEL;
      InAMuxSel  : OUT    std_logic;
      RegBMuxSel : OUT    STD_LOGIC;
      is_ldi     : OUT    std_logic;
      jsrSel     : OUT    std_logic;
      trapSel    : OUT    STD_LOGIC
   );

-- Declarations

END ID_C_Decode ;

--
ARCHITECTURE untitled OF ID_C_Decode IS
BEGIN
  ALUMuxSel <= ID_C_In(2 downto 0); 
		RegBMuxSel <= ID_C_In(3);
		InAMuxSel <= ID_C_In(4);
		jsrSel <= ID_C_In(5);
		trapSel <= ID_C_In(6);
		is_ldi <= ID_C_In(7);
END ARCHITECTURE untitled;

