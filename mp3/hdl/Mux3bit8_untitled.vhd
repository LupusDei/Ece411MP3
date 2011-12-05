--
-- VHDL Architecture ece411.Mux3bit8.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 06:25:47 12/05/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Mux3bit8 IS
   PORT( 
      a0  : IN     lc3b_8mux_sel;
      a1  : IN     lc3b_8mux_sel;
      a2  : IN     lc3b_8mux_sel;
      a3  : IN     lc3b_8mux_sel;
      a4  : IN     lc3b_8mux_sel;
      a5  : IN     lc3b_8mux_sel;
      a6  : IN     lc3b_8mux_sel;
      a7  : IN     lc3b_8mux_sel;
      sel : IN     lc3b_8mux_sel;
      O   : OUT    lc3b_8mux_sel
   );

-- Declarations

END Mux3bit8 ;

--
ARCHITECTURE untitled OF Mux3bit8 IS
BEGIN
	PROCESS (a0,a1,a2,a3,a4,a5,a6,a7,sel)
		variable state : lc3b_8mux_sel;
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
		O <= state after delay_MUX8;
	END PROCESS;
END ARCHITECTURE untitled;

