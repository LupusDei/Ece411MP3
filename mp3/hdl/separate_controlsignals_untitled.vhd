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

ENTITY separate_controlsignals IS
   PORT( 
      IF_C_In  : IN     LC3b_word;
      PCMuxSel : OUT    LC3b_word
   );

-- Declarations

END separate_controlsignals ;

--
ARCHITECTURE untitled OF separate_controlsignals IS

BEGIN
  PCMuxSel <= IF_C_In(0);

END ARCHITECTURE untitled;

