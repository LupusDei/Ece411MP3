--
-- VHDL Architecture ece411.Bit2Mux.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-28.ews.illinois.edu)
--          at - 18:30:45 09/30/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Bit2Mux IS
   PORT( 
      a   : IN     std_logic;
      b   : IN     std_logic;
      sel : IN     std_logic;
      o   : OUT    std_logic
   );

-- Declarations

END Bit2Mux ;

--
ARCHITECTURE untitled OF Bit2Mux IS
BEGIN
 PROCESS (a, b, sel)
  variable state : std_logic;
 BEGIN
  case sel is
   when '0' =>
  		state := a;
			when '1' =>
				state := b;
			when others =>
				state := 'X';
		end case;
		o <= state after delay_MUX2;
	END PROCESS;
END ARCHITECTURE untitled;

