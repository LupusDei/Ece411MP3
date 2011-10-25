-- VHDL Entity ece411.WBStage.generatedInstance
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-16.ews.illinois.edu)
--          at - 02:51:36 10/25/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WBStage IS
   PORT( 
      MEMDataOut : IN     lc3b_word;
      WB_C_In    : IN     lc3b_word;
      DR         : OUT    lc3b_reg;
      RegDataIn  : OUT    lc3b_word;
      RegWrite   : OUT    std_logic;
      ALUOut     : IN     lc3b_word
   );

END WBStage ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF WBStage IS 
BEGIN


END generatedInstance;
