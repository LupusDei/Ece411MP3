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
      dm_read_l    : IN     std_logic;
      dm_writeh_l  : IN     std_logic;
      dm_writel_l  : IN     std_logic;
      im_read_l    : IN     std_logic;
      im_writeh_l  : IN     std_logic;
      im_writel_l  : IN     std_logic;
      DataMemIn    : OUT    lc3b_word;
      InstMemIn    : OUT    lc3b_word;
      dm_resp_h    : OUT    std_logic;
      im_resp_h    : OUT    std_logic
   );

-- Declarations

END MagicMemory ;

--
ARCHITECTURE awesome OF MagicMemory IS
signal instruction : lc3b_word;
signal im_resp : std_logic;
BEGIN
	PROCESS (im_read_l, PCInstAddr)
	Begin
		if (im_read_l = '0') then
			im_resp <= '1';
			if (PCInstAddr = "0000000000000000") then
					instruction <= "0001111001000010";
			elsif (PCInstAddr = "0000000000000010") then 
					instruction <= "0001000001101011";
			elsif (PCInstAddr = "0000000000000100") then
					instruction <= "0101110001000010";
			elsif (PCInstAddr = "0000000000000110") then 
					instruction <= "0101101010100101"; 
			elsif (PCInstAddr = "0000000000001000") then
					instruction <= "1001100011111111";
			else
					instruction <= "0000000000000000";
			end if;
		else
			im_resp <= '0';
		end if;
	end process;

  InstMemIn <= instruction after 3 ns;
		im_resp_h <= im_resp after 3 ns;
END ARCHITECTURE awesome;

