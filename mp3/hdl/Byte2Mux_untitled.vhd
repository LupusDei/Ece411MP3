--
-- VHDL Architecture ece411.Byte2Mux.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-25.ews.illinois.edu)
--          at - 14:47:45 09/30/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Byte2Mux IS
   PORT( 
      Byte0   : IN     lc3b_byte;
      Byte1   : IN     lc3b_byte;
      Sel     : IN     std_logic;
      ByteOut : OUT    lc3b_byte
   );

-- Declarations

END Byte2Mux ;

--
ARCHITECTURE untitled OF Byte2Mux IS
BEGIN
 PROCESS (Byte0, Byte1, Sel)
  variable state : LC3b_byte;
 BEGIN
  case Sel is
   when '0' =>
  		state := Byte0;
			when '1' =>
				state := Byte1;
			when others =>
				state := (OTHERS => 'X');
		end case;
		ByteOut <= state after delay_MUX2;
	END PROCESS;
END ARCHITECTURE untitled;

