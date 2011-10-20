--
-- VHDL Architecture ece411.BRadd.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-27.ews.illinois.edu)
--          at - 14:50:53 09/01/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BRadd IS
   PORT( 
      ADJ9out : IN     LC3b_word;
      PCout   : IN     LC3b_word;
      clk     : IN     std_logic;
      Adj9PC  : OUT    LC3b_word
   );

-- Declarations

END BRadd ;

--
ARCHITECTURE untitled OF BRadd IS
BEGIN
	VHDL_BR_ADD : PROCESS (PCOUT, ADJ9OUT)
	BEGIN
		Adj9PC <= STD_LOGIC_VECTOR(UNSIGNED(PCOUT) + UNSIGNED(ADJ9OUT)) AFTER DELAY_ADDER;
	END PROCESS;
END ARCHITECTURE untitled;

