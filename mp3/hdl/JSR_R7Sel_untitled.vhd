--
-- VHDL Architecture ece411.JSR_R7Sel.untitled
--
-- Created:
--          by - martin43.UNKNOWN (evrt-252-09.ews.illinois.edu)
--          at - 17:17:38 09/12/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY JSR_R7Sel IS
   PORT( 
      Dest    : IN     LC3b_reg;
      R7Sel_H : IN     std_logic;
      clk     : IN     std_logic;
      DestReg : OUT    LC3b_reg
   );

-- Declarations

END JSR_R7Sel ;

--
ARCHITECTURE untitled OF JSR_R7Sel IS
BEGIN
	PROCESS (Dest, R7Sel_H)
		variable destination : LC3b_reg;
	BEGIN
		case R7Sel_H is
			when '0' =>
				destination := Dest;
			when '1' =>
				destination := "111";
			when others =>
				destination := (OTHERS => 'X');
		end case;
		DestReg <= destination after DELAY_MUX2;
	END PROCESS;
END ARCHITECTURE untitled;

