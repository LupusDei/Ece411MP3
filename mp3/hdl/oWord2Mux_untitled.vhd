--
-- VHDL Architecture ece411.oWord2Mux.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-09.ews.illinois.edu)
--          at - 18:28:42 09/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY oWord2Mux IS
   PORT( 
      A   : IN     lc3b_oword;
      B   : IN     lc3b_oword;
      Sel : IN     std_logic;
      O   : OUT    lc3b_oword
   );

-- Declarations

END oWord2Mux ;

--
ARCHITECTURE untitled OF oWord2Mux IS
BEGIN
 PROCESS (A, B, Sel)
  variable state : LC3b_oword;
 BEGIN
  case Sel is
   when '0' =>
  		state := A;
			when '1' =>
				state := B;
			when others =>
				state := (OTHERS => 'X');
		end case;
		O <= state after delay_MUX2;
	END PROCESS;
END ARCHITECTURE untitled;

