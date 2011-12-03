--
-- VHDL Architecture ece411.srcRegshifter.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 22:47:52 12/01/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY srcRegshifter IS
   PORT( 
      is_byte         : IN     std_logic;
      lastbit         : IN     std_logic;
      preMEMWriteData : IN     lc3b_word;
      memwritedata    : OUT    lc3b_word
   );

-- Declarations

END srcRegshifter ;

--
ARCHITECTURE untitled OF srcRegshifter IS
BEGIN
	PROCESS(lastbit, preMEMWriteData, is_byte) 
	variable tempwritedata : lc3b_word;
	BEGIN
		if(lastbit = '1' and is_byte = '1') then
			tempwritedata := preMEMWriteData(7 downto 0) & "00000000";
		else tempwritedata := preMEMWriteData;
		end if;
	memwritedata <= tempwritedata after delay_mux2;
	END PROCESS;
END ARCHITECTURE untitled;

