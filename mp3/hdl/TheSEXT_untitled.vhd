--
-- VHDL Architecture ece411.TheSEXT.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-32.ews.illinois.edu)
--          at - 19:28:45 10/27/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TheSEXT IS
   PORT( 
      instr11 : IN     std_logic;
      instr5  : IN     lc3b_word;
      instr6  : IN     std_logic;
      instr9  : IN     std_logic;
      Imm5    : OUT    std_logic;
      sig1    : OUT    std_logic;
      sig2    : OUT    std_logic;
      sig3    : OUT    std_logic;
      sig4    : OUT    std_logic
   );

-- Declarations

END TheSEXT ;

--
ARCHITECTURE untitled OF TheSEXT IS
BEGIN
END ARCHITECTURE untitled;

