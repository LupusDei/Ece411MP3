--
-- VHDL Architecture ece411.ForwardingUnit.untitled
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-20.ews.illinois.edu)
--          at - 21:10:25 11/15/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ForwardingUnit IS
   PORT( 
      EX_C_In  : IN     lc3b_word;
      ID_C_Out : IN     lc3b_word;
      Mem_C_In : IN     lc3b_word;
      forwardA : OUT    std_logic_vector (1 DOWNTO 0);
      forwardB : OUT    std_logic_vector (1 DOWNTO 0);
      storeSel : OUT    std_logic_vector (1 DOWNTO 0)
   );

-- Declarations

END ForwardingUnit ;

--
ARCHITECTURE untitled OF ForwardingUnit IS
	signal srcBits : std_logic_vector(1 downto 0);
	signal idsrcReg1 : lc3b_reg;
	signal idsrcReg2 : lc3b_reg;
	signal idsrcRegSt : lc3b_reg;
	signal idbaseRegSt : lc3b_reg;
	signal exdestReg : lc3b_reg;
	signal memdestReg : lc3b_reg;
BEGIN
	srcBits <= id_c_out(4 downto 3); 
	idsrcReg1 <= id_c_out(8 downto 6); 
	idsrcReg2 <= id_c_out(2 downto 0);
	idsrcRegSt <= id_c_out(11 downto 9); 
	idbaseRegSt <= id_c_out(8 downto 6);
	exdestReg <= ex_c_in(11 downto 9);
	memdestReg <= mem_c_in(11 downto 9);
	PROCESS(ex_c_in, id_c_out, mem_c_in, srcBits, idsrcReg1, idsrcReg2, idsrcRegSt, idbaseRegSt, exdestReg, memdestReg)
	BEGIN
		forwardA <= "00";
		forwardB <= "00";
		storeSel <= "00";
		if(srcBits = "01") then -- ADD/AND
			if (mem_c_in(12) = '1') then
				if(idsrcReg1 = memdestReg) then 
					forwardA <= "10" ;
				end if;
				if(idsrcReg2 = memdestReg) then
					forwardB <= "10";
				end if; 
			end if; 
			if (ex_c_in(12) = '1') then
				if(idsrcReg1 = exdestReg) then 
					forwardA <= "01";
				end if;
				if(idsrcReg2 = exdestReg) then
					forwardB <= "01";
				end if; 
			end if; 
		elsif(srcBits = "00") then
			if(idsrcReg1 = memdestReg and mem_c_in(12) = '1') then 
				forwardA <= "10";
			end if;
			if(idsrcReg1 = exdestReg and ex_c_in(12) = '1') then
				forwardA <= "01";
			end if;
		elsif(srcBits = "10") then
			if(idbaseRegSt = memdestReg and mem_c_in(12) = '1') then 
				forwardA <= "10";
			end if;
			if(idbaseRegSt = exdestReg and ex_c_in(12) = '1') then
				forwardA <= "01";
			end if;
			if(idsrcRegSt = memdestReg and mem_c_in(12) = '1') then	
				storeSel <= "10";      	 
			end if;                        
		 	if(idsrcRegSt = exdestReg and ex_c_in(12) = '1') then
				storeSel <= "01";
			end if; 
		end if;
	END PROCESS;
END ARCHITECTURE untitled;

