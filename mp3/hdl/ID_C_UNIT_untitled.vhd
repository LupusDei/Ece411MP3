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
      ID_C_In : OUT    lc3b_word;
      JMP     : OUT    std_logic;
      JSR     : OUT    std_logic
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
		variable trapMuxSel : std_logic;
		variable inactive : std_logic;
		variable pre_jmp : std_logic;
		variable pre_jsr : std_logic;
		variable is_ldi : std_logic;
		variable is_sti : std_logic;
		variable isJSR : std_logic;
		BEGIN 
			opcode := instOut(15 downto 12);
			ALUMuxSel := "000";
			RegBMuxSel := '0';
			InAMuxSel := '0';
			trapMuxSel := '0';
			inactive := '0';
			pre_jmp := '0';
			is_ldi := '0';
			isJSR := '0';
			pre_jsr := '0';
			case opcode is
				when "0000" =>
					ALUMuxSel := "000";
				when "0001" =>
					if (instOut(5) = '0') then
						ALUMuxSel := "000";
					else 
						ALUMuxSel := "010";
					end if;
				when "0011" =>
					ALUMuxSel := "101";
					RegBMuxSel := '1';
				when "0101" =>
					if (instOut(5) = '0') then 
						ALUMuxSel := "000";
					else 
						ALUMuxSel := "010";
					end if;
				when "1101" =>
					ALUMuxSel := "111";
				when "0010" =>
					ALUMuxSel := "101";
				when "0110" =>
					ALUMuxSel := "110";
				when "0111" =>
					ALUMuxSel := "110";
					RegBMuxSel := '1';
				when "1100" =>
					pre_jmp := '1';
				when "0100" =>
					if(instOut(11) = '1') then
						pre_jsr := '1';
						isJSR := '1';
					else pre_jmp := '1';
					end if;
				when "1010" =>
					is_ldi := '1';
					ALUMuxSel := "110";
				when "1110" =>
					InAMuxSel := '1';
				when "1111" =>
					trapMuxSel := '1';
				when others =>
					inactive := '1';
			END case;
					pre_ID_C_IN <= inactive & "000" & "0000" & is_ldi & trapMuxSel & isJSR & InAMuxSel & RegBMuxSel & ALUMuxSel;
					jmp <= pre_jmp after delay_decode3;
					jsr <= pre_jsr after delay_decode3;
		END PROCESS;
	ID_C_IN <= pre_ID_C_IN after delay_decode3;

END ARCHITECTURE untitled;

