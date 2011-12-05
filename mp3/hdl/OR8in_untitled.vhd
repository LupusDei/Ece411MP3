--
-- VHDL Architecture ece411.OR8in.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-18.ews.illinois.edu)
--          at - 23:12:27 12/01/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OR8in IS
   PORT( 
      A     : IN     std_logic;
      B     : IN     std_logic;
      C     : IN     std_logic;
      D     : IN     std_logic;
      E     : IN     std_logic;
      F     : IN     std_logic;
      G     : IN     std_logic;
      H     : IN     std_logic;
      OROUT : OUT    std_logic
   );

-- Declarations

END OR8in ;

--
ARCHITECTURE untitled OF OR8in IS
BEGIN
	PROCESS (A, B,C,D,E,F,G,H)
	variable match : std_logic;
	BEGIN
		if ((A = '1') OR (B = '1') OR (C = '1') OR (D = '1') OR (E = '1') OR (F = '1') OR (G = '1') OR (H = '1')) then
			match := '1';
		else
			match := '0';
		end if;
		OROUT <= match after 3ns;
	END PROCESS;
END ARCHITECTURE untitled;

