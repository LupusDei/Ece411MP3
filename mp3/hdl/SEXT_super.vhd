--
-- VHDL Architecture ECE411.SEXT.super
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-17.ews.illinois.edu)
--          at - 22:23:02 11/03/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SEXT IS
   PORT( 
      Instr11    : IN     lc3b_offset11;
      Instr5     : IN     lc3b_imm5;
      Instr6     : IN     lc3b_index6;
      Instr9     : IN     lc3b_offset9;
      Imm5       : OUT    LC3b_word;
      Offset6    : OUT    LC3b_word;
      PCOffset11 : OUT    LC3b_word;
      PCOffset9  : OUT    LC3b_word
   );

-- Declarations

END SEXT ;

--
ARCHITECTURE super OF SEXT IS
BEGIN
	Offset6 <= Instr6(5) & Instr6(5) & Instr6(5) & Instr6(5) & Instr6(5) & Instr6(5) & Instr6(5) & Instr6(5) & Instr6(5) & Instr6(5) & Instr6 AFTER DELAY_MUX2;
	Imm5 <= Instr5(4) & Instr5(4) & Instr5(4) & Instr5(4) & Instr5(4) & Instr5(4) & Instr5(4) & Instr5(4) & Instr5(4) & Instr5(4) & Instr5(4) & Instr5 AFTER DELAY_MUX2;

	PCOffset9 <= Instr9(8) & Instr9(8) & Instr9(8) & Instr9(8) & Instr9(8) & Instr9(8) & Instr9(8) & Instr9 AFTER DELAY_MUX2;
	PCOffset11 <= Instr11(10) & Instr11(10) & Instr11(10) & Instr11(10) & Instr11(10) & Instr11 AFTER DELAY_MUX2;
END ARCHITECTURE super;

