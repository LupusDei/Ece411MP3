--
-- VHDL Architecture ece411.InstrRipper.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-15.ews.illinois.edu)
--          at - 20:26:00 10/27/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY InstrRipper IS
   PORT( 
      instIn      : IN     lc3b_word;
      Instr11     : OUT    lc3b_offset11;
      Instr5      : OUT    lc3b_imm5;
      Instr6      : OUT    lc3b_index6;
      Instr9      : OUT    lc3b_offset9;
      imm4        : OUT    LC3b_word;
      trapvector8 : OUT    lc3b_word
   );

-- Declarations

END InstrRipper ;

--
ARCHITECTURE untitled OF InstrRipper IS
BEGIN
	Instr11 <= instIn(10 downto 0);
	imm4 <= "000000000000" & instIn(3 downto 0); 
	Instr5 <= instIn(4 downto 0); 
	Instr6 <= instIn(5 downto 0);
	Instr9 <= instIn(8 downto 0);
	trapvector8 <= "00000000" & instIn(7 downto 0);	
END ARCHITECTURE untitled;

