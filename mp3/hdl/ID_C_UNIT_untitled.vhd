--
-- VHDL Architecture ece411.ID_C_UNIT.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-16.ews.illinois.edu)
--          at - 22:09:16 10/24/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ID_C_UNIT IS
   PORT( 
      instOut : IN     lc3b_word;
      ID_C_In : OUT    lc3b_word
   );

-- Declarations

END ID_C_UNIT ;

--
ARCHITECTURE untitled OF ID_C_UNIT IS
signal pre_ID_C_In : lc3b_word;
BEGIN
	PROCESS(instOut)
		variable opcode : LC3b_opcode;
		BEGIN 
			opcode := instOut(15 downto 12);
			case opcode is
				when "0001" =>
					if (instOut(5) = '0') then
						pre_ID_C_IN <= "0000000000000000";
					
					else pre_ID_C_IN <= "0000000000000010";
					
					end if;
				when "0101" =>
					if (instOut(5) = '0') then 
						pre_ID_C_IN <= "0000000000000000";

					else pre_ID_C_IN <= "0000000000000010";
					
					end if;
				when others =>
					pre_ID_C_IN <= "1111000000000000";
			END case;
		END PROCESS;
	ID_C_IN <= pre_ID_C_IN after delay_decode3;

END ARCHITECTURE untitled;

