--
-- VHDL Architecture ece411.littlehack.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (linux4.ews.illinois.edu)
--          at - 16:12:39 12/04/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY littlehack IS
   PORT( 
      isldisti : IN     STD_LOGIC;
      muxsel   : OUT    std_logic
   );

-- Declarations

END littlehack ;

--
ARCHITECTURE untitled OF littlehack IS
BEGIN
	PROCESS(isldisti)
	BEGIN
		muxsel <= '0';
		if(isldisti = '1') then
			muxsel <= isldisti and (not (muxsel));
		else muxsel <= '0';
	end if;
	END PROCESS
END ARCHITECTURE untitled;

