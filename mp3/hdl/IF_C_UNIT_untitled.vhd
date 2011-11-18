--
-- VHDL Architecture ece411.IF_C_UNIT.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-12.ews.illinois.edu)
--          at - 23:21:54 10/23/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IF_C_UNIT IS
   PORT( 
      CLK       : IN     std_logic;
      JMP       : IN     std_logic;
      JSR       : IN     std_logic;
      MEM_C_Out : IN     lc3b_word;
      RESET_L   : IN     std_logic;
      im_resp_h : IN     std_logic;
      stall     : IN     std_logic;
      IF_C_In   : OUT    lc3b_word;
      im_read_l : INOUT  std_logic
   );

-- Declarations

END IF_C_UNIT ;

--
ARCHITECTURE untitled OF IF_C_UNIT IS
signal pre_read_out : std_logic;
signal pre_load_pc : std_logic;
signal pre_PCMuxSel : std_logic;
signal jmp_sel : std_logic_vector(1 downto 0);
BEGIN
  IF_CONTROL_PROCESS : PROCESS (CLK, RESET_L, im_resp_h, im_read_l, stall, JMP, JSR)
    BEGIN
  	jmp_sel <= "00";
	IF (RESET_L = '0') THEN
  		pre_read_out <= '1';
  		pre_load_pc <= '0';
  		pre_PCMuxSel <= '0';
	else
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			pre_read_out <= '0';
			pre_load_pc <= '0';
			pre_PCMuxSel <= '0';
		else
			if (im_resp_h = '1') then
				pre_read_out <= '1';
				pre_load_pc <= '1';
			end if;
			if (MEM_C_Out = "0000000000000001") then
				pre_PCMuxSel <= '1';
				pre_load_pc <= '1';
			end if;
			if(JMP = '1') then 
				jmp_sel <= "01";
				pre_load_pc <= '1';
			end if;	
			if(JSR = '1') then 
				jmp_sel <= "10";
				pre_load_pc <= '1';
			end if;	
		end if;
	end if;
	if (stall = '1') then
		pre_load_pc <= '0';
	end if;
	END PROCESS;
	IF_C_In <= "000000000000" & jmp_sel & pre_load_pc & pre_PCMuxSel after delay_decode3;
--	im_read_l <= pre_read_out after delay_decode3;
	im_read_l <= '0' after delay_decode3;
END ARCHITECTURE untitled;

