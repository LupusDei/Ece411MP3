--
-- VHDL Architecture ece411.CreateSrcReg.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-20.ews.illinois.edu)
--          at - 01:38:59 11/15/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CreateSrcReg IS
   PORT( 
      instIn   : IN     lc3b_word;
      ID_C_Out : OUT    lc3b_word
   );

-- Declarations

END CreateSrcReg ;

--
ARCHITECTURE untitled OF CreateSrcReg IS
	BEGIN
		PROCESS (instIn)
			variable opcode : lc3b_opcode;
			variable preID_C_Out : LC3b_word;
		BEGIN
		opcode := instIn(15 downto 12);
		case opcode is
			when "0001" =>		
				preID_C_Out := "0000" & "000" & instIn(8 downto 6) & "001" & instIn(2 downto 0);
			when "0101" =>		
				preID_C_Out := "0000" & "000" & instIn(8 downto 6) & "001" & instIn(2 downto 0);
			when "1100" =>		
				preID_C_Out := "0000000" & instIn(8 downto 6) & "000000";
			when "0100" =>			
				preID_C_Out := "0000000" & instIn(8 downto 6) & "000000";
			when "0010" =>		
				preID_C_Out := "0000000" & instIn(8 downto 6) & "000000";
			when "1010" =>		
				preID_C_Out := "0000000" & instIn(8 downto 6) & "000000";
			when "0110" =>		 
				preID_C_Out := "0000000" & instIn(8 downto 6) & "000000";
			when "1001" =>		
				preID_C_Out := "0000000" & instIn(8 downto 6) & "000000";
			when "1101" =>		
				preID_C_Out := "0000000" & instIn(8 downto 6) & "000000";
			when "0011" =>		    
				preID_C_Out := "0000" & instIn(11 downto 6) & "010000";
			when "1011" =>		
				preID_C_Out := "0000" & instIn(11 downto 6) & "010000";
			when "0111"=>		
				preID_C_Out := "0000" & instIn(11 downto 6) & "010000";
			when others =>		
				preID_C_Out := "0000000000011000";
		end case;
		ID_C_Out <= preID_C_Out;
	END PROCESS;
END ARCHITECTURE untitled;

