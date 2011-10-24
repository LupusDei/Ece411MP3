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
      RESET_L   : IN     std_logic;
      clk       : IN     std_logic;
      im_resp_h : IN     std_logic;
      IF_C_In   : OUT    lc3b_word;
      im_read_l : INOUT    std_logic
   );

-- Declarations

END IF_C_UNIT ;

--
ARCHITECTURE untitled OF IF_C_UNIT IS
signal pre_read_out : std_logic;
signal pre_if_c_out : lc3b_word;
BEGIN
  IF_CONTROL_PROCESS : PROCESS (CLK, RESET_L, im_resp_h)
    BEGIN
						IF (RESET_L'EVENT AND (RESET_L = '1') AND (RESET_L'LAST_VALUE = '0')) THEN
        pre_read_out <= '0';
				    pre_if_c_out <= "0000000000000000";
						else

					  	IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
					  			pre_read_out <= '0';
										pre_if_c_out <= "0000000000000000";
								else
					  	  if ((im_resp_h = '1') and (im_read_l = '0')) then
            pre_read_out <= '1';
					  	  		pre_if_c_out <= "0000000000000010"; --increment the pc
					  	  end if;
					  	end if;
						end if;
    END PROCESS;
				IF_C_In <= pre_if_c_out after delay_control_unit;
				im_read_l <= pre_read_out after delay_control_unit;
END ARCHITECTURE untitled;

