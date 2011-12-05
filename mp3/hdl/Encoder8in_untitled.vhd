--
-- VHDL Architecture ece411.Encoder8in.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 19:07:44 12/04/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Encoder8in IS
   PORT( 
      PreHit0 : IN     std_logic;
      PreHit1 : IN     std_logic;
      PreHit2 : IN     std_logic;
      PreHit3 : IN     std_logic;
      PreHit4 : IN     std_logic;
      PreHit5 : IN     std_logic;
      PreHit6 : IN     std_logic;
      PreHit7 : IN     std_logic;
      dataSel : OUT    lc3b_8MUX_Sel
   );

-- Declarations

END Encoder8in ;

--
ARCHITECTURE untitled OF Encoder8in IS
BEGIN
	PROCESS (PreHit0, PreHit1, PreHit2, PreHit3, PreHit4, PreHit5, PreHit6, PreHit7)
	variable match : std_logic_vector(2 downto 0);
	BEGIN
		if (PreHit7 = '1') then
			match := "111";
		elsif (PreHit6 = '1') then
			match := "110";
		elsif (PreHit5 = '1') then
			match := "101";
		elsif (PreHit4 = '1') then
			match := "100";
		elsif (PreHit3 = '1') then
			match := "011";
		elsif (PreHit2 = '1') then
			match := "010";
		elsif (PreHit1 = '1') then
			match := "001";
		elsif (PreHit0 = '1') then
			match := "000";
		else
			match := "000";
		end if;
		
		dataSel <= match after delay_decode3;
	END PROCESS;
END ARCHITECTURE untitled;

