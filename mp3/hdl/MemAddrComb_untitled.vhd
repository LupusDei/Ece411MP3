--
-- VHDL Architecture ece411.MemAddrComb.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-18.ews.illinois.edu)
--          at - 20:34:23 09/26/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MemAddrComb IS
   PORT( 
      index     : IN     lc3b_c_index;
      tagIn     : IN     lc3b_c_tag;
      pmaddress : OUT    LC3b_word
   );

-- Declarations

END MemAddrComb ;

--
ARCHITECTURE untitled OF MemAddrComb IS
BEGIN
	pmaddress <= tagIn & index & "0000" after delay_mux2;
END ARCHITECTURE untitled;

