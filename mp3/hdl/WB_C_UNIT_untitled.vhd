--
-- VHDL Architecture ece411.WB_C_UNIT.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-26.ews.illinois.edu)
--          at - 20:28:04 10/25/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WB_C_UNIT IS
   PORT( 
      instOut : IN     lc3b_word;
      wb_c    : OUT    lc3b_word
   );

-- Declarations

END WB_C_UNIT ;

--
ARCHITECTURE untitled OF WB_C_UNIT IS
signal pre_DR : lc3b_reg;
signal inactive : lc3b_nibble;
signal pre_WBMuxSel : std_logic;
signal pre_RegWrite : std_logic;
BEGIN
	Process(instOut)
	variable opcode : LC3b_opcode;
		BEGIN 	
			opcode := instOut(15 downto 12);
			pre_DR <= instOut(11 downto 9);
			inactive <= "0000"; --only becomes inactive if the opcode isn't recognized... mostly for testing purposes
			case opcode is
				when "0001" =>
					pre_WBMuxSel <= '1';
					pre_RegWrite <= '1';
				when "0101" =>
					pre_WBMuxSel <= '1';
					pre_RegWrite <= '1';
				when "1001" =>
					pre_WBMuxSel <= '1';
					pre_RegWrite <= '1';
				when "0110" =>
					pre_WBMuxSel <= '0';
					pre_RegWrite <= '1';
				when "0111" =>
					pre_WBMuxSel <= '0';
					pre_RegWrite <= '0';
				when "0000" =>
					pre_WBMuxSel <= '0';
					pre_RegWrite <= '0';
					pre_DR <= "000";
				when others =>
					inactive <= "1111";
					pre_DR <= "000";
					pre_WBMuxSel <= '0';
					pre_RegWrite <= '0';
			END case; 
		END PROCESS;
	wb_c <= inactive & "0000000" & pre_DR & pre_RegWrite & pre_WBMuxSel after delay_decode3;
END ARCHITECTURE untitled;

