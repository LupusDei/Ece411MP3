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
signal magic_data : lc3b_word;
signal im_resp : std_logic;
signal dm_resp : std_logic;
BEGIN
	inst_stuff : PROCESS (im_read_l, PCInstAddr)
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
					instruction <= "0101101001100111"; 
			elsif (PCInstAddr = "0000000000001000") then
					instruction <= "1001100011111111";
			elsif (PCInstAddr = "0000000000001010") then
					instruction <= "0110111010000110"; -- ldr r7, r2, 6
			elsif (PCInstAddr = "0000000000001100") then
					instruction <= "1111000000000000"; -- NOP
			elsif (PCInstAddr = "0000000000001110") then
					instruction <= "1111000000000000"; -- NOP
			elsif (PCInstAddr = "0000000000010000") then
					instruction <= "0111001011000011"; -- str r1, r3, 3
			else
					instruction <= "0000000000000000";
			end if;
		else
			im_resp <= '0';
		end if;
	end process inst_stuff;

	data_stuff : PROCESS (dm_read_l, DataAddr, MEMWriteData)
	begin
		if (dm_read_l = '0') then
			dm_resp <= '1';
			if (DataAddr = "0000000000010100") then
				magic_data <= "0110000000001101"; --600D
			else
				magic_data <= "0000101110101101"; --0BAD
			end if;
		else
			if (dm_writeh_l = '0' or dm_writel_l = '0') then
				if (DataAddr = "0000000000001001") then
					dm_resp <= '1';
					magic_data <= MEMWriteData;
				end if;
			else
			 dm_resp <= '0';
			end if;
		end if;
	end process data_stuff;
  InstMemIn <= instruction after 3 ns;
		im_resp_h <= im_resp after 3 ns;
		dm_resp_h <= dm_resp after 3 ns;
		DataMemIn <= magic_data after 3 ns;
END ARCHITECTURE awesome;

