--
-- VHDL Architecture ece411.Decoder3In8Out.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-25.ews.illinois.edu)
--          at - 15:24:48 09/30/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Decoder3In8Out IS
   PORT( 
      offset : IN     lc3b_c_offset;
      sel0   : OUT    std_logic;
      sel1   : OUT    std_logic;
      sel2   : OUT    std_logic;
      sel3   : OUT    std_logic;
      sel4   : OUT    std_logic;
      sel5   : OUT    std_logic;
      sel6   : OUT    std_logic;
      sel7   : OUT    std_logic
   );

-- Declarations

END Decoder3In8Out ;

--
ARCHITECTURE untitled OF Decoder3In8Out IS
BEGIN
	PROCESS(offset)
		variable sel : lc3b_byte;
	BEGIN
		case offset(3 downto 1) is
			when "000" =>
				sel := "00000001";
			when "001" =>
				sel := "00000010";
			when "010" =>
				sel := "00000100";
			when "011" =>
				sel := "00001000";
			when "100" =>
				sel := "00010000";
			when "101" =>
				sel := "00100000";
			when "110" =>
				sel := "01000000";
			when "111" =>
				sel := "10000000";
			when others =>
				sel := "00000001";
		end case;
  sel0 <= sel(0) after delay_logic3;
  sel1 <= sel(1) after delay_logic3;
  sel2 <= sel(2) after delay_logic3;
  sel3 <= sel(3) after delay_logic3;
  sel4 <= sel(4) after delay_logic3;
  sel5 <= sel(5) after delay_logic3;
  sel6 <= sel(6) after delay_logic3;
  sel7 <= sel(7) after delay_logic3;
	END PROCESS;
END ARCHITECTURE untitled;

