--
-- VHDL Architecture ece411.separate_controlsignals.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-32.ews.illinois.edu)
--          at - 16:51:32 10/22/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IF_C_Decode IS
   PORT( 
      IF_C_In  : IN     lc3b_word;
      PCMuxSel : OUT    std_logic;
      loadPC   : OUT    std_logic
   );

-- Declarations

END IF_C_Decode ;

--
ARCHITECTURE untitled OF IF_C_Decode IS

BEGIN
  PCMuxSel <= IF_C_In(0);
		loadPC <= IF_C_In(1);
END ARCHITECTURE untitled;

