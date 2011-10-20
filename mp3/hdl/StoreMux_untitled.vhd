--
-- VHDL Architecture ece411.StoreMux.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-27.ews.illinois.edu)
--          at - 15:21:24 09/01/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY StoreMux IS
   PORT( 
      Dest        : IN     LC3b_reg;
      SrcA        : IN     LC3b_reg;
      StoreSR     : IN     std_logic;
      clk         : IN     std_logic;
      StoreMuxout : OUT    LC3b_reg
   );

-- Declarations

END StoreMux ;

--
ARCHITECTURE untitled OF StoreMux IS
BEGIN
	PROCESS (DEST, SRCA, STORESR)
		variable state : LC3b_reg;
	BEGIN
		case STORESR is
			when '0' =>
				state := DEST;
			when '1' =>
				state := SRCA;
			when others =>
				state := (OTHERS => 'X');
		end case;
		STOREMUXOUT <= state AFTER DELAY_MUX2;
	END PROCESS;
END ARCHITECTURE untitled;

