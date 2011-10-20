--
-- VHDL Architecture ece411.JSRadd.untitled
--
-- Created:
--          by - martin43.UNKNOWN (evrt-252-09.ews.illinois.edu)
--          at - 15:59:15 09/12/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY JSRadd IS
   PORT( 
      ADJ11out : IN     LC3b_word;
      PCout    : IN     LC3b_word;
      clk      : IN     std_logic;
      Adj11PC  : OUT    LC3b_word
   );

-- Declarations

END JSRadd ;

--
ARCHITECTURE untitled OF JSRadd IS
BEGIN
	VHDL_JSR_ADD : PROCESS (PCOUT, ADJ11OUT)
	BEGIN
		Adj11PC <= STD_LOGIC_VECTOR(UNSIGNED(PCOUT) + UNSIGNED(ADJ11OUT)) AFTER DELAY_ADDER;
	END PROCESS;
END ARCHITECTURE untitled;

