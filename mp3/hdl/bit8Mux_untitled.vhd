--
-- VHDL Architecture ece411.bit8Mux.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 20:35:01 12/04/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY bit8Mux IS
   PORT( 
      a0  : IN     std_logic;
      a1  : IN     std_logic;
      a2  : IN     std_logic;
      a3  : IN     std_logic;
      a4  : IN     std_logic;
      a5  : IN     std_logic;
      a6  : IN     std_logic;
      a7  : IN     std_logic;
      sel : IN     lc3b_8mux_sel;
      O   : OUT    std_logic
   );

-- Declarations

END bit8Mux ;

--
ARCHITECTURE untitled OF bit8Mux IS
BEGIN
	PROCESS (a0,a1,a2,a3,a4,a5,a6,a7,sel)
		variable state : std_logic;
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

