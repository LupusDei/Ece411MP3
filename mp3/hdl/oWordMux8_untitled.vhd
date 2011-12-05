--
-- VHDL Architecture ece411.oWordMux8.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 19:22:25 12/04/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY oWordMux8 IS
   PORT( 
      a0       : IN     lc3b_oword;
      a1       : IN     lc3b_oword;
      a2       : IN     lc3b_oword;
      a3       : IN     lc3b_oword;
      a4       : IN     lc3b_oword;
      a5       : IN     lc3b_oword;
      a6       : IN     lc3b_oword;
      a7       : IN     lc3b_oword;
      sel      : IN     lc3b_8Mux_sel;
      oWordOut : OUT    lc3b_oword
   );

-- Declarations

END oWordMux8 ;

--
ARCHITECTURE untitled OF oWordMux8 IS
BEGIN
	PROCESS (a0,a1,a2,a3,a4,a5,a6,a7,sel)
		variable state : lc3b_oword;
 BEGIN
  case sel is
   when "000" =>
  		state := a0;
			when "001" =>
				state := a1;
   when "010" =>
  		state := a2;
			when "011" =>
				state := a3;
   when "100" =>
  		state := a4;
			when "101" =>
				state := a5;
   when "110" =>
  		state := a6;
			when "111" =>
				state := a7;
			when others =>
				state := (OTHERS => 'X');
		end case;
		oWordOut <= state after delay_MUX8;
	END PROCESS;
END ARCHITECTURE untitled;

