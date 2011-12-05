--
-- VHDL Architecture ece411.LRUReg3bit8.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 23:01:11 12/04/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRUReg3bit8 IS
   PORT( 
      RESET_L : IN     std_logic;
      hit     : IN     std_logic;
      index   : IN     lc3b_c_index;
      newLU   : IN     lc3b_8mux_sel;
      LUout   : OUT    lc3b_8mux_sel
   );

-- Declarations

END LRUReg3bit8 ;

--
ARCHITECTURE untitled OF LRUReg3bit8 IS
TYPE LRURAM is array (7 downto 0) of lc3b_8mux_sel;
signal ram : LRURAM;
BEGIN
	LRUREG_READ : PROCESS (index, ram)
	variable lru_index : integer range 0 to 7;
	begin
		lru_index := to_integer(unsigned('0' & index));

		LUout <= ram(lru_index) after delay_regfile_read;
	end process LRUREG_READ;

	LRUREG_WRITE : PROCESS(hit, RESET_L, index, newLU)
	variable lru_index : integer range 0 to 7;
	begin
		if (RESET_L = '0') THEN
			ram(0) <= "111";
			ram(1) <= "111";
			ram(2) <= "111";
			ram(3) <= "111";
			ram(4) <= "111";
			ram(5) <= "111";
			ram(6) <= "111";
			ram(7) <= "111";
		end if;

		lru_index := to_integer(unsigned('0' & index));
		if (hit = '1') then
			ram(lru_index) <= newLU;
		end if;
	end process LRUREG_WRITE;
END ARCHITECTURE untitled;

