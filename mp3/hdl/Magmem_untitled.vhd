--
-- VHDL Architecture ece411.Magmem.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-10.ews.illinois.edu)
--          at - 23:48:45 10/28/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Magmem IS
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
      imiss        : OUT    std_logic;
      dmiss        : OUT    std_logic;
      im_resp_h    : OUT    std_logic
   );

-- Declarations

END Magmem ;

--
ARCHITECTURE awesome OF Magmem IS
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
					instruction <= "0101110001100111"; 
			elsif (PCInstAddr = "0000000000001000") then
					instruction <= "1001100011111111";
			elsif (PCInstAddr = "0000000000001010") then
					instruction <= "0110111010000110"; -- ldr r7, r2, 6
			elsif (PCInstAddr = "0000000000001100") then
					instruction <= "0000000000000000"; -- NOP
			elsif (PCInstAddr = "0000000000001110") then
					instruction <= "0000000000000000"; -- NOP
			elsif (PCInstAddr = "0000000000010000") then
					instruction <= "0111001011000011"; -- str r1, r3, 3
			elsif (PCInstAddr = "0000000000010010") then
					instruction <= "0000101000001000"; -- brnp 8
			elsif (PCInstAddr = "0000000000100100") then --pc = 36
					instruction <= "1110111000001010"; -- lea r7, 10
			elsif (PCInstAddr = "0000000000100110") then --pc = 38
					instruction <= "1101100011000010"; -- lshf r4, r3, 2
			elsif (PCInstAddr = "0000000000101000") then --pc = 40
					instruction <= "1101100100010010"; -- rshfl r4, r4, 2
			elsif (PCInstAddr = "0000000000101010") then --pc = 42
					instruction <= "1101100001110011"; -- rshfa r4, r1, 3
			elsif (PCInstAddr = "0000000000101100") then
					instruction <= "0000000000000000"; -- NOP
			elsif (PCInstAddr = "0000000000101110") then
					instruction <= "0000000000000000"; -- NOP
			elsif (PCInstAddr = "0000000000110000") then
					instruction <= "0000000000000000"; -- NOP
			elsif (PCInstAddr = "0000000000110010") then
					instruction <= "0000000000000000"; -- NOP
			elsif (PCInstAddr = "0000000000110100") then --pc = 52
					instruction <= "1100000111000000"; --RET
			elsif (PCInstAddr = "0000000000110110") then
					instruction <= "0000000000000000"; -- NOP
			elsif (PCInstAddr = "0000000000111000") then
					instruction <= "0000000000000000"; -- NOP
			elsif (PCInstAddr = "0000000000111010") then -- pc = 58
					instruction <= "0100100000000100"; --JSR 4
			elsif (PCInstAddr = "0000000001000100") then  --pc = 68
					instruction <= "0011101010000111"; -- stb r5, r2, 7
			elsif (PCInstAddr = "0000000001001100") then --pc = 76
					instruction <= "0100000101000000"; -- jsrr r5
			elsif (PCInstAddr = "0000000101010110") then  --pc = 342
					instruction <= "1111000000100000"; -- TRAP 32
			elsif (PCInstAddr = "0000000010100010") then  --pc = 160
					instruction <= "1100000111000000"; --RET
			elsif (PCInstAddr = "0000000101011010") then  --pc = 346
					instruction <= "0011101010011110"; -- stb r5, r2, 30
			elsif (PCInstAddr = "0000000101100000") then  --pc = 352
					instruction <= "0010110010001001"; -- ldb r6, r2, 9
			elsif (PCInstAddr = "0000000101100010") then  --pc = 354
					instruction <= "0010110010011110"; -- ldb r6, r2, 30
			else
					instruction <= "0000000000000000";
			end if;
		else
			im_resp <= '0';
		end if;
	end process inst_stuff;

	data_stuff : PROCESS (dm_read_l, DataAddr, MEMWriteData, dm_writeh_l, dm_writel_l)
	begin
		if (dm_read_l = '0') then
			dm_resp <= '1';
			if (DataAddr = "0000000000010100") then
				magic_data <= "0110000000001101"; --600D
			elsif (DataAddr = "0000000001000000") then
				magic_data <= "0000000010100000"; --00A0 (160) just some random value to check for trap
			elsif (DataAddr = "0000000000010001") then
				magic_data <= "0011110000000000"; --3D00 random value to check for LDB
			elsif (DataAddr = "0000000000100110") then 
				magic_data <= "0000000101010100";
			else
				magic_data <= "0000101110101101"; --0BAD
			end if;
		else
				if (DataAddr = "0000000000001001" or DataAddr = "0000000001011000" or DataAddr = "0000000000001111" or DataAddr = "0000000000100110") then
					dm_resp <= '1';
					if (dm_writeh_l = '0' and dm_writel_l = '0') then
						magic_data <= MEMWriteData;
					elsif (dm_writel_l = '0') then
						magic_data <= magic_data(15 downto 8) & MEMWriteData(7 downto 0);
					elsif (dm_writeh_l = '0') then 
						magic_data <= MEMWriteData(15 downto 8) & magic_data(7 downto 0);
					else
			 			dm_resp <= '0';
					end if;
				end if;
		end if;
	end process data_stuff;
  InstMemIn <= instruction after 3 ns;
		im_resp_h <= im_resp after 3 ns;
		dm_resp_h <= dm_resp after 3 ns;
		DataMemIn <= magic_data after 3 ns;
END ARCHITECTURE awesome;

