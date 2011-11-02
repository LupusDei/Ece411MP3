-- VHDL Entity ece411.IFStage.interface
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-10.ews.illinois.edu)
--          at - 02:01:46 10/29/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IFStage IS
   PORT( 
      IF_C_In    : IN     lc3b_word;
      InstMemIn  : IN     lc3b_word;
      RESET_L    : IN     std_logic;
      clk        : IN     std_logic;
      newPCIn    : IN     lc3b_word;
      PCinstAddr : OUT    lc3b_word;
      inst       : OUT    lc3b_word;
      nextPC     : OUT    lc3b_word
   );

-- Declarations

END IFStage ;

--
-- VHDL Architecture ece411.IFStage.struct
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-10.ews.illinois.edu)
--          at - 02:01:46 10/29/11
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

ARCHITECTURE struct OF IFStage IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL PCMuxOut : LC3b_word;
   SIGNAL PCMuxSel : std_logic;
   SIGNAL loadPC   : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL nextPC_internal     : lc3b_word;
   SIGNAL PCinstAddr_internal : lc3b_word;


   -- Component Declarations
   COMPONENT IF_C_Decode
   PORT (
      IF_C_In  : IN     lc3b_word ;
      PCMuxSel : OUT    std_logic ;
      loadPC   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT PC
   PORT (
      PCMuxOut   : IN     LC3b_word ;
      RESET_L    : IN     std_logic ;
      clk        : IN     std_logic ;
      loadPC     : IN     std_logic ;
      PCinstAddr : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT PCPlus2
   PORT (
      PCinstAddr : IN     lc3b_word ;
      nextPC     : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT Worthless
   PORT (
      In0  : IN     LC3b_word ;
      Out0 : OUT    LC3b_word 
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
   FOR ALL : IF_C_Decode USE ENTITY ece411.IF_C_Decode;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : PC USE ENTITY ece411.PC;
   FOR ALL : PCPlus2 USE ENTITY ece411.PCPlus2;
   FOR ALL : Worthless USE ENTITY ece411.Worthless;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   IF_C_decodinator : IF_C_Decode
      PORT MAP (
         IF_C_In  => IF_C_In,
         PCMuxSel => PCMuxSel,
         loadPC   => loadPC
      );
   myPC : PC
      PORT MAP (
         PCMuxOut   => PCMuxOut,
         RESET_L    => RESET_L,
         clk        => clk,
         loadPC     => loadPC,
         PCinstAddr => PCinstAddr_internal
      );
   myPCPlus2 : PCPlus2
      PORT MAP (
         PCinstAddr => PCinstAddr_internal,
         nextPC     => nextPC_internal
      );
   poppycock : Worthless
      PORT MAP (
         In0  => InstMemIn,
         Out0 => inst
      );
   PCMux : MUX2_16
      PORT MAP (
         A   => nextPC_internal,
         B   => newPCIn,
         SEL => PCMuxSel,
         F   => PCMuxOut
      );

   -- Implicit buffered output assignments
   nextPC     <= nextPC_internal;
   PCinstAddr <= PCinstAddr_internal;

END struct;
