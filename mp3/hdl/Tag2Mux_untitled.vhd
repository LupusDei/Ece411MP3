--
-- VHDL Architecture ece411.Tag2Mux.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-09.ews.illinois.edu)
--          at - 21:38:34 09/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Tag2Mux IS
   PORT( 
      sel    : IN     std_logic;
      tag0   : IN     lc3b_c_tag;
      tag1   : IN     lc3b_c_tag;
      tagOut : OUT    lc3b_c_tag
   );

-- Declarations

END Tag2Mux ;

--
ARCHITECTURE untitled OF Tag2Mux IS
BEGIN
 PROCESS (tag0, tag1, sel)
  variable state : LC3b_c_tag;
 BEGIN
  case sel is
   when '0' =>
  		state := tag0;
			when '1' =>
				state := tag1;
			when others =>
				state := (OTHERS => 'X');
		end case;
		tagOut <= state after delay_MUX2;
	END PROCESS;
END ARCHITECTURE untitled;

