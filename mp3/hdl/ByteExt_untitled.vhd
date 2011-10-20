--
-- VHDL Architecture ece411.ByteExt.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-06.ews.illinois.edu)
--          at - 18:54:02 09/14/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteExt IS
   PORT( 
      ADDR_0     : IN     std_logic;
      ByteExtSel : IN     std_logic;
      MDRout     : IN     LC3b_word;
      clk        : IN     std_logic;
      ByteExtout : OUT    LC3b_word
   );

-- Declarations

END ByteExt ;

--
ARCHITECTURE untitled OF ByteExt IS
BEGIN
	PROCESS (ADDR_0, ByteExtSel, MDRout)
		variable byteExtended : LC3b_word;
	BEGIN
		case ByteExtSel is
			when '0' =>
				byteExtended := MDRout;
			when '1' =>
				if ADDR_0 = '0' then
					byteExtended := "00000000" & MDRout(7 downto 0);
				else
					byteExtended := "00000000" & MDRout(15 downto 8);
				end if;
			when others =>
				byteExtended := (OTHERS => 'X');
		end case;
		ByteExtout <= byteExtended after DELAY_MUX2;
	END PROCESS;
END ARCHITECTURE untitled;

