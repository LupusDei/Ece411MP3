--
-- VHDL Architecture ece411.mycounter.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (linux4.ews.illinois.edu)
--          at - 16:41:27 12/04/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mycounter IS
   PORT( 
      isldisti   : IN     STD_LOGIC;
      mycount    : IN     integer;
      count      : OUT    integer;
      kill_mread : OUT    std_logic;
      muxsel     : OUT    std_logic
   );

-- Declarations

END mycounter ;

--
ARCHITECTURE untitled OF mycounter IS
BEGIN
	PROCESS(isldisti, mycount)
	variable precount :integer; 
	variable presel : std_logic;
	variable mread : std_logic;
	BEGIN
		if(isldisti = '1') then
			precount := mycount + 1;
		else 
			precount := 0;
		end if;
		if(precount > 0 and precount <= 2) then
			presel := '1';
		elsif(precount > 2) then
			mread := '1';
		else presel := '0';
		     mread := '0';
		end if;
	count <= precount after delay_logic3;
	muxsel <= presel after delay_logic3;
	kill_mread <= mread after delay_logic3;
END PROCESS;
END ARCHITECTURE untitled;

