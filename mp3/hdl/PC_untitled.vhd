--
-- VHDL Architecture ece411.PC.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-32.ews.illinois.edu)
--          at - 16:47:20 10/22/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PC IS
   PORT( 
      CLK        : IN     std_logic;
      F          : IN     LC3B_WORD;
      RESET_L    : IN     std_logic;
      loadPC     : IN     std_logic;
      pcinstaddr : OUT    lc3b_word
   );

-- Declarations

END PC ;

--
ARCHITECTURE untitled OF PC IS
signal pre_out : LC3b_word;
  BEGIN
    PROCESS (clk, RESET_L, F)
    BEGIN
    if RESET_L = '0' then
     pre_out <= (others => '0');
    elsif clk'event and clk = '1' then
     if (loadPC = '1') then
      pre_out <= F;
     end if;
    end if;
    end process;
    PCinstAddr <= pre_out after delay_reg;  
END ARCHITECTURE untitled;

