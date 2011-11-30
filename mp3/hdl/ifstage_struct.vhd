-- VHDL Entity ece411.IFStage.interface
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-20.ews.illinois.edu)
--          at - 20:07:13 11/29/11
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
      CLK        : IN     std_logic;
      IF_C_In    : IN     lc3b_word;
      RESET_L    : IN     std_logic;
      aluInA     : IN     lc3b_word;
      instmemin  : IN     lc3b_word;
      newPC      : IN     lc3b_word;
      newPCIn    : IN     lc3b_word;
      trapvect8  : IN     LC3b_word;
      inst       : OUT    lc3b_word;
      nextPC     : OUT    lc3b_word;
      pcinstaddr : OUT    lc3b_word
   );

-- Declarations

END IFStage ;

--
-- VHDL Architecture ece411.IFStage.struct
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-20.ews.illinois.edu)
--          at - 20:07:13 11/29/11
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
   SIGNAL F        : LC3B_WORD;
   SIGNAL F1       : LC3B_WORD;
   SIGNAL PCMuxSel : std_logic;
   SIGNAL jmp_sel  : lc3b_4mux_sel;
   SIGNAL loadPC   : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL nextPC_internal     : lc3b_word;
   SIGNAL pcinstaddr_internal : lc3b_word;


   -- Component Declarations
   COMPONENT IF_C_Decode
   PORT (
      IF_C_In  : IN     lc3b_word ;
      PCMuxSel : OUT    std_logic ;
      jmp_sel  : OUT    lc3b_4mux_sel ;
      loadPC   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT PC
   PORT (
      CLK        : IN     std_logic ;
      F          : IN     LC3B_WORD ;
      RESET_L    : IN     std_logic ;
      loadPC     : IN     std_logic ;
      pcinstaddr : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT PCPlus2
   PORT (
      pcinstaddr : IN     lc3b_word ;
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
   COMPONENT MUX4_16
   PORT (
      A   : IN     LC3B_WORD ;
      B   : IN     LC3B_WORD ;
      C   : IN     LC3B_WORD ;
      D   : IN     LC3B_WORD ;
      SEL : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      F   : OUT    LC3B_WORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : IF_C_Decode USE ENTITY ece411.IF_C_Decode;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : MUX4_16 USE ENTITY mp3lib.MUX4_16;
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
         jmp_sel  => jmp_sel,
         loadPC   => loadPC
      );
   myPC : PC
      PORT MAP (
         CLK        => CLK,
         F          => F,
         RESET_L    => RESET_L,
         loadPC     => loadPC,
         pcinstaddr => pcinstaddr_internal
      );
   myPCPlus2 : PCPlus2
      PORT MAP (
         pcinstaddr => pcinstaddr_internal,
         nextPC     => nextPC_internal
      );
   poppycock : Worthless
      PORT MAP (
         In0  => instmemin,
         Out0 => inst
      );
   PCMux : MUX2_16
      PORT MAP (
         A   => nextPC_internal,
         B   => newPCIn,
         SEL => PCMuxSel,
         F   => F1
      );
   U_0 : MUX4_16
      PORT MAP (
         A   => F1,
         B   => aluInA,
         C   => newPC,
         D   => trapvect8,
         SEL => jmp_sel,
         F   => F
      );

   -- Implicit buffered output assignments
   nextPC     <= nextPC_internal;
   pcinstaddr <= pcinstaddr_internal;

END struct;
