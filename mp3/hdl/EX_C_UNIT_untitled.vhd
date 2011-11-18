--
-- VHDL Architecture ece411.EX_C_UNIT.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-16.ews.illinois.edu)
--          at - 23:15:45 10/24/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY EX_C_UNIT IS
   PORT( 
      forwardA : IN     std_logic_vector (1 DOWNTO 0);
      forwardB : IN     std_logic_vector (1 DOWNTO 0);
      instOut  : IN     lc3b_word;
      storeSel : IN     std_logic_vector (1 DOWNTO 0);
      ex_c     : OUT    lc3b_word
   );

-- Declarations

END EX_C_UNIT ;

--
ARCHITECTURE untitled OF EX_C_UNIT IS
signal dr : lc3b_reg;
signal ALUop : lc3b_aluop;
signal pre_EX_C : lc3b_word;
signal reg_write : std_logic;
BEGIN
	PROCESS(instOut, storeSel, forwardA, forwardB)
	variable opcode : LC3b_opcode;
		BEGIN 	
			opcode := instOut(15 downto 12);
			dr <= instOut(11 downto 9);
			case opcode is
				when "0001" =>
					reg_write <= '1';
					ALUop <= "000";
				when "0101" =>
					reg_write <= '1';
					ALUop <= "001";
				when "1001" =>
					reg_write <= '1';
					ALUop <= "010";
				when "0110" =>
					reg_write <= '1';
					ALUop <= "000";
				when "0010" =>
					reg_write <= '1';
					ALUop <= "000";
				when "1010" =>
					reg_write <= '1';
					ALUop <= "000";
				when "1110" =>
					ALUop <= "011";
					reg_write <= '1';
				when "1101" =>
					reg_write <= '1';
					if (instOut(4) = '0') then 
						ALUop <= "100";
					else 
						if (instOut(5) = '0') then
							ALUop <= "110";
						else
							ALUop <= "111";
						end if;
					end if;
				when "0111" =>
					reg_write <= '0';
					ALUop <= "000";
				when "0000" =>
					reg_write <= '0';
					ALUop <= "000";
				when others =>
					reg_write <= '0';
					ALUop <= "000";
			END case; 
		END PROCESS;
			EX_C <= "000" & reg_write & dr & storeSel & forwardA & forwardB & ALUop after delay_decode3;
END ARCHITECTURE untitled;

