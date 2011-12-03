--
-- VHDL Architecture ece411.mem_C_decode.untitled
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-32.ews.illinois.edu)
--          at - 17:57:30 10/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mem_C_decode IS
   PORT( 
      Mem_C_In    : IN     lc3b_word;
      DestReg     : OUT    lc3b_cc;
      GENMuxSel   : OUT    STD_LOGIC;
      TrapDecider : OUT    std_logic;
      brInst      : OUT    std_logic;
      is_byte     : OUT    std_logic;
      loadNZP     : OUT    std_logic
   );

-- Declarations

END mem_C_decode ;

--
ARCHITECTURE untitled OF mem_C_decode IS
BEGIN
	DestReg <= MEM_C_In(3 downto 1);
	loadNZP <= MEM_C_In(0);
	GENMuxSel <= MEM_C_In(9);
	brInst <= MEM_C_In(7);
	TrapDecider <= MEM_C_In(8);
	is_byte <= MEM_C_In(13);
END ARCHITECTURE untitled;

