-- VHDL Entity ece411.WBStage.interface
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-14.ews.illinois.edu)
--          at - 01:55:37 10/27/11
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
      ALUresult  : IN     lc3b_word;
      MEMDataOut : IN     lc3b_word;
      WB_C_In    : IN     lc3b_word;
      DR         : OUT    lc3b_reg;
      RegDataIn  : OUT    lc3b_word;
      RegWrite   : OUT    std_logic
   );

-- Declarations

END WBStage ;

--
-- VHDL Architecture ece411.WBStage.struct
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-14.ews.illinois.edu)
--          at - 01:55:37 10/27/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;
LIBRARY mp3lib;

ARCHITECTURE struct OF WBStage IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL WBMuxSel : STD_LOGIC;


   -- Component Declarations
   COMPONENT WB_C_Decode
   PORT (
      WB_C_In  : IN     lc3b_word ;
      DR       : OUT    lc3b_reg ;
      RegWrite : OUT    std_logic ;
      WBMuxSel : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT MUX2_16
   PORT (
      A   : IN     LC3B_WORD ;
      B   : IN     LC3B_WORD ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    LC3B_WORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : WB_C_Decode USE ENTITY ece411.WB_C_Decode;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   decodinator : WB_C_Decode
      PORT MAP (
         WB_C_In  => WB_C_In,
         DR       => DR,
         RegWrite => RegWrite,
         WBMuxSel => WBMuxSel
      );
   WBMux : MUX2_16
      PORT MAP (
         A   => MEMDataOut,
         B   => ALUresult,
         SEL => WBMuxSel,
         F   => RegDataIn
      );

END struct;
