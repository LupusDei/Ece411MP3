--
-- VHDL Architecture ece411.Staller.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-20.ews.illinois.edu)
--          at - 00:16:23 11/18/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Staller IS
   PORT( 
      DM_RESP_H : IN     std_logic;
      RESET_L   : IN     std_logic;
      dMiss     : IN     std_logic;
      stall     : OUT    std_logic
   );

-- Declarations

END Staller ;

--
ARCHITECTURE untitled OF Staller IS
	signal was_miss : std_logic := '0';
BEGIN
	PROCESS(was_miss, RESET_L, dMiss, DM_RESP_H)
	begin
		if RESET_L = '0' then
			was_miss <= '0';
		end if;

		if (dMiss = '1' and DM_RESP_H = '0') then
			was_miss <= '1';
		end if;
		if (DM_RESP_H = '1') then
			was_miss <= '0';
		end if;
		stall <= was_miss after delay_reg;
	END PROCESS;
END ARCHITECTURE untitled;

