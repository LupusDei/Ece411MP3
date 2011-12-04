--
-- VHDL Architecture ece411.shiftbytedata.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-08.ews.illinois.edu)
--          at - 22:16:30 12/02/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY shiftbytedata IS
   PORT( 
      is_byte       : IN     std_logic;
      lastbit       : IN     std_logic;
      preMEMDataOut : IN     lc3b_word;
      MEMDataOut    : OUT    lc3b_word
   );

-- Declarations

END shiftbytedata ;

--
ARCHITECTURE untitled OF shiftbytedata IS
BEGIN
	PROCESS(lastbit, prememdataout, is_byte) 
	variable tempdataout : lc3b_word;
	BEGIN
		if(lastbit = '1' and is_byte = '1') then
			tempdataout := "00000000" & prememdataout(15 downto 8); 
		elsif(is_byte = '1') then 
			tempdataout := "00000000" & prememdataout(7 downto 0);
		else tempdataout := prememdataout;
		end if;
	memdataout <= tempdataout after delay_mux2;
	END PROCESS;
END ARCHITECTURE untitled;

