--
-- VHDL Architecture ece411.dm_wrtr.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-20.ews.illinois.edu)
--          at - 16:17:26 11/18/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY dm_wrtr IS
   PORT( 
      MEM_C_Out       : IN     lc3b_word;
      pre_dm_writeh_l : IN     std_logic;
      pre_dm_writel_l : IN     std_logic;
      dm_writeh_l     : OUT    std_logic;
      dm_writel_l     : OUT    std_logic
   );

-- Declarations

END dm_wrtr ;

--
ARCHITECTURE untitled OF dm_wrtr IS
BEGIN
	dm_writeh_l <= pre_dm_writeh_l;
	dm_writel_l <= pre_dm_writel_l;
END ARCHITECTURE untitled;

