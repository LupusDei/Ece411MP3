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
signal pre_offsetMuxSel : std_logic;
BEGIN
	PROCESS(instOut)
		variable opcode : LC3b_opcode;
		variable ALUMuxSel : LC3b_reg;
		variable RegBMuxSel : std_logic;
		variable InAMuxSel : std_logic;
		variable inactive : std_logic;
		BEGIN 
			opcode := instOut(15 downto 12);
			ALUMuxSel := "000";
			RegBMuxSel := '0';
			InAMuxSel := '0';
			inactive := '0';
			case opcode is
				when "0000" =>
					ALUMuxSel := "000";
				when "0001" =>
					if (instOut(5) = '0') then
						ALUMuxSel := "000";
					else 
						ALUMuxSel := "010";
					end if;
				when "0101" =>
					if (instOut(5) = '0') then 
						ALUMuxSel := "000";
					else 
						ALUMuxSel := "010";
					end if;
				when "1101" =>
					ALUMuxSel := "111";
				when "0110" =>
					ALUMuxSel := "110";
				when "0111" =>
					ALUMuxSel := "110";
					RegBMuxSel := '1';
				when "1110" =>
					InAMuxSel := '1';
				when others =>
					inactive := '1';
			END case;
					pre_ID_C_IN <= inactive & "000" & "0000" & "000" & InAMuxSel & RegBMuxSel & ALUMuxSel;
		END PROCESS;
	ID_C_IN <= pre_ID_C_IN after delay_decode3;

END ARCHITECTURE untitled;

