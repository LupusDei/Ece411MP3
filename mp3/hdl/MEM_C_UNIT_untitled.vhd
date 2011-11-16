--
-- VHDL Architecture ece411.MEM_C_UNIT.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-16.ews.illinois.edu)
--          at - 03:06:20 10/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MEM_C_UNIT IS
   PORT( 
      instOut : IN     lc3b_word;
      mem_c   : OUT    lc3b_word
   );

-- Declarations

END MEM_C_UNIT ;

--
ARCHITECTURE untitled OF MEM_C_UNIT IS
signal inactive : lc3b_nibble;
signal pre_loadNZP : std_logic;
signal pre_checkNZP : lc3b_cc;
signal pre_brInst : std_logic;
signal pre_GENMuxSel : std_logic;
signal pre_dm_read_l : std_logic;
signal pre_dm_writel_l : std_logic;
signal pre_dm_writeh_l : std_logic;
signal dest_reg : lc3b_reg;
signal dest : lc3b_reg;
signal reg_write : std_logic;
BEGIN
	PROCESS(instOut)
		variable opcode : LC3b_opcode;
		BEGIN 	
			opcode := instOut(15 downto 12);
			pre_dm_read_l <= '1';
			pre_dm_writel_l <= '1';
			pre_dm_writeh_l <= '1';
			inactive <= "0000"; --only becomes inactive if the opcode isn't recognized... mostly for testing purposes
	  		pre_brInst <= '0';
	  		pre_GENMuxSel <= '0';
	  		pre_loadNZP <= '0';
			pre_checkNZP <= "000";
			dest_reg <= instOut(11 downto 9);
			case opcode is
				when "0001" =>
	    				pre_loadNZP <= '1';
					dest <= dest_reg;	
					reg_write <= '1';		
				when "0101" =>
				    	pre_loadNZP <= '1';
					dest <= dest_reg;
					reg_write <= '1'; 
				when "1001" =>
				    	pre_loadNZP <= '1';
					dest <= dest_reg;
					reg_write <= '1'; 
				when "0110" => 
	    				pre_loadNZP <= '1';
					pre_dm_read_l <= '0';
					dest <= dest_reg;
					reg_write <= '1';
				when "0111" =>
				 	pre_dm_writel_l <= '0';
				 	pre_dm_writeh_l <= '0';
					reg_write <= '0';
				when "0000" =>
					pre_brInst <= '1';
	    				pre_GENMuxSel <= '1';
					pre_checkNZP <= instOut(11 downto 9);
					reg_write <= '0';
				when others =>
					inactive <= "1111";
	    				pre_brInst <= '0';
		  			pre_checkNZP <= "000";
	    				pre_loadNZP <= '0';
					reg_write <= '0';
			END case; 
	END PROCESS;
	MEM_C <= "000" & reg_write & dest & '0' & pre_brInst & pre_dm_writeh_l & pre_dm_writel_l & pre_dm_read_l & pre_checkNZP & pre_loadNZP after delay_decode3;
END ARCHITECTURE untitled;

