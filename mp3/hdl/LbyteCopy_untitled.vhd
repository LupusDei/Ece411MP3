--
-- VHDL Architecture ece411.LbyteCopy.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-06.ews.illinois.edu)
--          at - 20:18:28 09/14/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LbyteCopy IS
   PORT( 
      ALUout      : IN     LC3b_word;
      ByteExtSel  : IN     std_logic;
      clk         : IN     std_logic;
      ByteCopyout : OUT    LC3b_word
   );

-- Declarations

END LbyteCopy ;

--
ARCHITECTURE untitled OF LbyteCopy IS
BEGIN
	PROCESS (ALUout, ByteExtSel)
		variable copy : LC3b_word;
	BEGIN
		case ByteExtSel is
			when '0' =>
				copy := ALUout;
			when '1' =>
				copy := ALUout(7 downto 0) & ALUout(7 downto 0);
			when others =>
				copy := (OTHERS => 'X');
		end case;
		ByteCopyout <= copy after DELAY_MUX2;
	END PROCESS;
END ARCHITECTURE untitled;

