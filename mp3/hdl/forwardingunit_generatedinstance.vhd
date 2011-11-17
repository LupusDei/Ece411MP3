-- VHDL Entity ece411.ForwardingUnit.generatedInstance
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-20.ews.illinois.edu)
--          at - 21:02:32 11/15/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ForwardingUnit IS
   PORT( 
      ID_C_Out : IN     lc3b_word;
      EX_C_In  : IN     lc3b_word;
      MEM_C_In : IN     lc3b_word;
      forwardA : OUT    std_logic;
      forwardB : OUT    std_logic
   );

END ForwardingUnit ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF ForwardingUnit IS 
BEGIN


END generatedInstance;