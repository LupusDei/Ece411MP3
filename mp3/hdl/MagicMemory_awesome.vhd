--
-- VHDL Architecture ece411.MagicMemory.awesome
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-12.ews.illinois.edu)
--          at - 22:17:46 10/23/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MagicMemory IS
   PORT( 
      DataAddr     : IN     lc3b_word;
      MEMWriteData : IN     lc3b_word;
      PCinstAddr   : IN     lc3b_word;
      RESET_L      : IN     std_logic;
      clk          : IN     std_logic;
      im_read_l    : IN     std_logic;
      im_writeh_l  : IN     std_logic;
      im_writel_l  : IN     std_logic;
      DataMemIn    : OUT    lc3b_word;
      InstMemIn    : OUT    lc3b_word;
      im_resp_h    : OUT    std_logic
   );

-- Declarations

END MagicMemory ;

--
ARCHITECTURE awesome OF MagicMemory IS
BEGIN
  
END ARCHITECTURE awesome;

