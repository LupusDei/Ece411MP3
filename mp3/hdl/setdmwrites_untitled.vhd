--
-- VHDL Architecture ece411.setdmwrites.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 22:09:52 12/01/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY setdmwrites IS
   PORT( 
      is_byte        : IN     std_logic;
      is_odd         : IN     std_logic;
      predm_writeh_l : IN     std_logic;
      predm_writel_l : IN     std_logic;
      dm_writeh_l    : OUT    std_logic;
      dm_writel_l    : OUT    std_logic
   );

-- Declarations

END setdmwrites ;

--
ARCHITECTURE untitled OF setdmwrites IS
BEGIN
	PROCESS(is_odd, is_byte, predm_writeh_l, predm_writel_l)
	variable tempdm_writeh_l : std_logic; 
	variable tempdm_writel_l : std_logic; 
	BEGIN
		tempdm_writeh_l := predm_writeh_l;
		tempdm_writel_l := predm_writel_l;
		if(is_odd = '1' and is_byte = '1') then
			tempdm_writeh_l := '0';
		elsif(is_byte = '1') then
			tempdm_writel_l := '0';	
		end if;
	dm_writeh_l <= tempdm_writeh_l after delay_mux2;
	dm_writel_l <= tempdm_writel_l after delay_mux2;
	END PROCESS;
END ARCHITECTURE untitled;

