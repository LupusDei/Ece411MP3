--
-- VHDL Architecture ece411.LRU.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-31.ews.illinois.edu)
--          at - 17:38:04 09/27/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRU IS
   PORT( 
      Hit     : IN     std_logic;
      PreHit0 : IN     std_logic;
      RESET_L : IN     std_logic;
      index   : IN     lc3b_c_index;
      LRUOut  : OUT    std_logic
   );

-- Declarations

END LRU ;

--
ARCHITECTURE untitled OF LRU IS

	TYPE LRUArray IS array (7 downto 0) of std_logic;
	SIGNAL lru : LRUArray;

	BEGIN

		ReadRecentBit : PROCESS (lru, index)

			VARIABLE HitIndex : integer;
			BEGIN
				HitIndex := to_integer(unsigned(index));
				LRUOut <= lru(HitIndex) after 20 ns;
		END PROCESS ReadRecentBit;

		SetRecentBit : PROCESS (RESET_L, index, lru, PreHit0, Hit)

			VARIABLE HitIndex : integer;
			BEGIN
				HitIndex := to_integer(unsigned(index));
			IF RESET_L = '0' THEN
				lru(0) <= '0';
				lru(1) <= '0';
				lru(2) <= '0';
				lru(3) <= '0';
				lru(4) <= '0';
				lru(5) <= '0';
				lru(6) <= '0';
				lru(7) <= '0';
			END IF;

			if Hit = '1' then
				lru(HitIndex) <= PreHit0;
			end if;
		END PROCESS SetRecentBit;

END ARCHITECTURE untitled;

