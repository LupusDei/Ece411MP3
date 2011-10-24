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
      im_read_l : OUT    std_logic
   );

-- Declarations

END IF_C_UNIT ;

--
ARCHITECTURE untitled OF IF_C_UNIT IS
BEGIN
  IF_CONTROL_PROCESS : PROCESS (RESET_L, im_resp_h)
		variable if_c_state : lc3b_word;
		variable im_read_state : std_logic;
    BEGIN
			IF (RESET_L'EVENT AND (RESET_L = '1') AND (RESET_L'LAST_VALUE = '0')) THEN
        im_read_state := '0';
				if_c_state := "0000000000000000";
      end if;

		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
				im_read_state := '0';
		END IF;

			if im_resp_h = '1' then
        im_read_state := '1';
				if_c_state := "0000000000000010";
			else
				if_c_state := "0000000000000000";
			end if;

			IF_C_IN <= if_c_state;
			im_read_l <= im_read_state;
    END PROCESS;
END ARCHITECTURE untitled;

