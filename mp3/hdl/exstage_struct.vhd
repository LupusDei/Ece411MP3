-- VHDL Entity ece411.EXStage.interface
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 12:07:46 12/05/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY EXStage IS
   PORT( 
      ALUdata   : IN     lc3b_word;
      ALUresult : IN     lc3b_word;
      EX_C_In   : IN     lc3b_word;
      SrcRegIn  : IN     lc3b_word;
      inA       : IN     lc3b_word;
      inB       : IN     lc3b_word;
      ALUOut    : OUT    lc3b_word;
      EX_C_Out  : OUT    lc3b_word;
      Src       : OUT    lc3b_word
   );

-- Declarations

END EXStage ;

--
-- VHDL Architecture ece411.EXStage.struct
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 12:07:46 12/05/11
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

ARCHITECTURE struct OF EXStage IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ALUOP  : LC3B_ALUOP;
   SIGNAL F      : LC3B_WORD;
   SIGNAL aluInA : LC3B_WORD;
   SIGNAL aluInB : LC3B_WORD;
   SIGNAL fwdA   : std_logic_vector(1 DOWNTO 0);
   SIGNAL fwdB   : std_logic_vector(1 DOWNTO 0);
   SIGNAL strSel : STD_LOGIC_VECTOR(1 DOWNTO 0);


   -- Component Declarations
   COMPONENT EX_C_Decode
   PORT (
      EX_C_In : IN     lc3b_word ;
      ALUOP   : OUT    LC3B_ALUOP ;
      fwdA    : OUT    std_logic_vector (1 DOWNTO 0);
      fwdB    : OUT    std_logic_vector (1 DOWNTO 0);
      strSel  : OUT    STD_LOGIC_VECTOR (1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT Worthless
   PORT (
      In0  : IN     LC3b_word ;
      Out0 : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ALU
   PORT (
      A     : IN     LC3B_WORD ;
      ALUOP : IN     LC3B_ALUOP ;
      B     : IN     LC3B_WORD ;
      F     : OUT    LC3B_WORD 
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
   FOR ALL : ALU USE ENTITY mp3lib.ALU;
   FOR ALL : EX_C_Decode USE ENTITY ece411.EX_C_Decode;
   FOR ALL : MUX4_16 USE ENTITY mp3lib.MUX4_16;
   FOR ALL : Worthless USE ENTITY ece411.Worthless;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   EX_decoder : EX_C_Decode
      PORT MAP (
         EX_C_In => EX_C_In,
         ALUOP   => ALUOP,
         fwdA    => fwdA,
         fwdB    => fwdB,
         strSel  => strSel
      );
   SrcPass : Worthless
      PORT MAP (
         In0  => F,
         Out0 => Src
      );
   EXALU : ALU
      PORT MAP (
         A     => aluInA,
         ALUOP => ALUOP,
         B     => aluInB,
         F     => ALUOut
      );
   U_0 : MUX4_16
      PORT MAP (
         A   => inA,
         B   => ALUresult,
         C   => ALUdata,
         D   => ALUdata,
         SEL => fwdA,
         F   => aluInA
      );
   U_1 : MUX4_16
      PORT MAP (
         A   => inB,
         B   => ALUresult,
         C   => ALUdata,
         D   => ALUdata,
         SEL => fwdB,
         F   => aluInB
      );
   U_2 : MUX4_16
      PORT MAP (
         A   => SrcRegIn,
         B   => ALUresult,
         C   => ALUdata,
         D   => ALUdata,
         SEL => strSel,
         F   => F
      );

END struct;
