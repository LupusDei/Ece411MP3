-- VHDL Entity ece411.MEMStage.generatedInstance
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-12.ews.illinois.edu)
--          at - 22:18:43 10/23/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MEMStage IS
   PORT( 
      MEM_C_In     : IN     lc3b_word;
      MEM_C_Out    : OUT    lc3b_word;
      DataAddr     : OUT    lc3b_word;
      MEMWriteData : OUT    lc3b_word;
      DataMemIn    : IN     lc3b_word;
      ALUOut       : IN     lc3b_word;
      MEMDataOut   : OUT    lc3b_word;
      MEMAddrOut   : OUT    lc3b_word
   );

END MEMStage ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF MEMStage IS 
BEGIN


END generatedInstance;
