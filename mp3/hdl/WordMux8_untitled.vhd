--
-- VHDL Architecture ece411.WordMux8.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-06.ews.illinois.edu)
--          at - 21:34:20 09/14/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordMux8 IS
   PORT( 
      A   : IN     LC3b_word;
      B   : IN     LC3b_word;
      C   : IN     LC3b_word;
      D   : IN     LC3b_word;
      E   : IN     LC3b_word;
      F   : IN     LC3b_word;
      G   : IN     LC3b_word;
      H   : IN     LC3b_word;
      Sel : IN     LC3b_8MUX_SEL;
      O   : OUT    LC3b_word
   );

-- Declarations

END WordMux8 ;

--
ARCHITECTURE untitled OF WordMux8 IS
BEGIN
	PROCESS (A, B, C, D, E, F, G, H, Sel)
		variable state : LC3b_word;
	BEGIN
		case Sel is
			when "000" =>
				state := A;
			when "001" =>
				state := B;
			when "010" =>
				state := C;
			when "011" =>
				state := D;
			when "100" =>
				state := E;
			when "101" =>
				state := F;
			when "110" =>
				state := G;
			when "111" =>
				state := H;
			when others =>
				state := (OTHERS => 'X');
		end case;
		O <= state after delay_MUX8;
	END PROCESS;
END ARCHITECTURE untitled;

