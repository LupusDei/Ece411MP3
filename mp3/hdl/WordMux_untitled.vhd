--
-- VHDL Architecture ece411.WordMux.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-06.ews.illinois.edu)
--          at - 22:21:49 09/25/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY oWordMux IS
   PORT( 
      PreWayDataOut : IN     lc3b_oword;
      offset        : IN     lc3b_c_offset;
      WayData       : OUT    lc3b_word
   );

-- Declarations

END oWordMux ;

--
ARCHITECTURE untitled OF oWordMux IS
BEGIN
	PROCESS(PreWayDataOut, offset)
		variable dataOut : LC3b_word;
	BEGIN
		case offset(3 downto 1) is
			when "000" =>
				dataOut := PreWayDataOut(15 downto 0);
			when "001" =>
				dataOut := PreWayDataOut(31 downto 16);
			when "010" =>
				dataOut := PreWayDataOut(47 downto 32);
			when "011" =>
				dataOut := PreWayDataOut(63 downto 48);
			when "100" =>
				dataOut := PreWayDataOut(79 downto 64);
			when "101" =>
				dataOut := PreWayDataOut(95 downto 80);
			when "110" =>
				dataOut := PreWayDataOut(111 downto 96);
			when "111" =>
				dataOut := PreWayDataOut(127 downto 112);
			when others =>
				dataOut := (OTHERS => 'X');
		end case;
		WayData <= dataOut after delay_MUX8;
	END PROCESS;
END ARCHITECTURE untitled;

