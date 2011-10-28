-- VHDL Entity ece411.Pipeline.interface
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-32.ews.illinois.edu)
--          at - 18:24:24 10/28/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Pipeline IS
   PORT( 
      DataMemIn    : IN     lc3b_word;
      EX_C_In      : IN     lc3b_word;
      ID_C_In      : IN     lc3b_word;
      IF_C_In      : IN     lc3b_word;
      InstMemIn    : IN     lc3b_word;
      MEM_C_In     : IN     lc3b_word;
      RESET_L      : IN     std_logic;
      WB_C_In      : IN     lc3b_word;
      clk          : IN     std_logic;
      DataAddr     : OUT    lc3b_word;
      EX_C_Out     : OUT    lc3b_word;
      ID_C_Out     : OUT    lc3b_word;
      MEMWriteData : OUT    lc3b_word;
      MEM_C_Out    : OUT    lc3b_word;
      PCinstAddr   : OUT    lc3b_word;
      instOut      : OUT    lc3b_word
   );

-- Declarations

END Pipeline ;

--
-- VHDL Architecture ece411.Pipeline.struct
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-32.ews.illinois.edu)
--          at - 18:24:24 10/28/11
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

ARCHITECTURE struct OF Pipeline IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ALUInA     : lc3b_word;
   SIGNAL ALUInB     : lc3b_word;
   SIGNAL ALUOut     : lc3b_word;
   SIGNAL ALUdata    : lc3b_word;
   SIGNAL ALUresult  : lc3b_word;
   SIGNAL DR         : lc3b_reg;
   SIGNAL MEMData    : lc3b_word;
   SIGNAL MEMDataOut : lc3b_word;
   SIGNAL OutA       : lc3b_word;
   SIGNAL OutB       : lc3b_word;
   SIGNAL RA         : lc3b_reg;
   SIGNAL RB         : lc3b_reg;
   SIGNAL RegDataIn  : lc3b_word;
   SIGNAL RegWrite   : std_logic;
   SIGNAL Src        : lc3b_word;
   SIGNAL SrcIn      : lc3b_word;
   SIGNAL SrcRegData : lc3b_word;
   SIGNAL SrcRegIn   : lc3b_word;
   SIGNAL inA        : lc3b_word;
   SIGNAL inB        : lc3b_word;
   SIGNAL inst       : lc3b_word;
   SIGNAL instIn     : lc3b_word;
   SIGNAL newPC      : lc3b_word;
   SIGNAL newPCIn    : lc3b_word;
   SIGNAL nextPC     : lc3b_word;
   SIGNAL nextPCin   : lc3b_word;


   -- Component Declarations
   COMPONENT EXStage
   PORT (
      EX_C_In  : IN     lc3b_word ;
      SrcRegIn : IN     lc3b_word ;
      inA      : IN     lc3b_word ;
      inB      : IN     lc3b_word ;
      ALUOut   : OUT    lc3b_word ;
      EX_C_Out : OUT    lc3b_word ;
      Src      : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT IDStage
   PORT (
      ID_C_In    : IN     lc3b_word ;
      OutA       : IN     lc3b_word ;
      OutB       : IN     lc3b_word ;
      instIn     : IN     lc3b_word ;
      nextPCin   : IN     lc3b_word ;
      ALUInA     : OUT    lc3b_word ;
      ALUInB     : OUT    lc3b_word ;
      ID_C_Out   : OUT    lc3b_word ;
      RA         : OUT    lc3b_reg ;
      RB         : OUT    lc3b_reg ;
      SrcRegData : OUT    lc3b_word ;
      instOut    : OUT    lc3b_word ;
      newPC      : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT IFStage
   PORT (
      IF_C_In    : IN     lc3b_word ;
      InstMemIn  : IN     lc3b_word ;
      RESET_L    : IN     std_logic ;
      clk        : IN     std_logic ;
      newPCIn    : IN     lc3b_word ;
      PCinstAddr : OUT    lc3b_word ;
      inst       : OUT    lc3b_word ;
      nextPC     : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT MEMStage
   PORT (
      ALUresult    : IN     lc3b_word ;
      DataMemIn    : IN     lc3b_word ;
      MEM_C_In     : IN     lc3b_word ;
      SrcIn        : IN     lc3b_word ;
      clk          : IN     std_logic ;
      DataAddr     : OUT    lc3b_word ;
      MEMDataOut   : OUT    lc3b_word ;
      MEMWriteData : OUT    lc3b_word ;
      MEM_C_Out    : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT TransitionReg
   PORT (
      RESET_L : IN     std_logic ;
      clk     : IN     std_logic ;
      d1      : IN     lc3b_word ;
      d2      : IN     lc3b_word ;
      o1      : OUT    lc3b_word ;
      o2      : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT TransitionReg3
   PORT (
      RESET_L : IN     std_logic ;
      clk     : IN     std_logic ;
      d1      : IN     lc3b_word ;
      d2      : IN     lc3b_word ;
      d3      : IN     lc3b_word ;
      o1      : OUT    lc3b_word ;
      o2      : OUT    lc3b_word ;
      o3      : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT WBStage
   PORT (
      ALUdata   : IN     lc3b_word ;
      MEMData   : IN     lc3b_word ;
      WB_C_In   : IN     lc3b_word ;
      DR        : OUT    lc3b_reg ;
      RegDataIn : OUT    lc3b_word ;
      RegWrite  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT brReg
   PORT (
      RESET_L : IN     std_logic ;
      clk     : IN     std_logic ;
      newPC   : IN     lc3b_word ;
      newPCIn : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT REGFILE
   PORT (
      CLK      : IN     STD_LOGIC ;
      DEST     : IN     LC3B_REG ;
      DIN      : IN     LC3B_WORD ;
      RESET_L  : IN     STD_LOGIC ;
      REGWRITE : IN     STD_LOGIC ;
      SRCA     : IN     LC3B_REG ;
      SRCB     : IN     LC3B_REG ;
      A        : OUT    LC3B_WORD ;
      B        : OUT    LC3B_WORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : EXStage USE ENTITY ece411.EXStage;
   FOR ALL : IDStage USE ENTITY ece411.IDStage;
   FOR ALL : IFStage USE ENTITY ece411.IFStage;
   FOR ALL : MEMStage USE ENTITY ece411.MEMStage;
   FOR ALL : REGFILE USE ENTITY mp3lib.REGFILE;
   FOR ALL : TransitionReg USE ENTITY ece411.TransitionReg;
   FOR ALL : TransitionReg3 USE ENTITY ece411.TransitionReg3;
   FOR ALL : WBStage USE ENTITY ece411.WBStage;
   FOR ALL : brReg USE ENTITY ece411.brReg;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   Execution : EXStage
      PORT MAP (
         EX_C_In  => EX_C_In,
         SrcRegIn => SrcRegIn,
         inA      => inA,
         inB      => inB,
         ALUOut   => ALUOut,
         EX_C_Out => EX_C_Out,
         Src      => Src
      );
   Decode : IDStage
      PORT MAP (
         ID_C_In    => ID_C_In,
         OutA       => OutA,
         OutB       => OutB,
         instIn     => instIn,
         nextPCin   => nextPCin,
         ALUInA     => ALUInA,
         ALUInB     => ALUInB,
         ID_C_Out   => ID_C_Out,
         RA         => RA,
         RB         => RB,
         SrcRegData => SrcRegData,
         instOut    => instOut,
         newPC      => newPC
      );
   InstructionFetch : IFStage
      PORT MAP (
         IF_C_In    => IF_C_In,
         InstMemIn  => InstMemIn,
         RESET_L    => RESET_L,
         clk        => clk,
         newPCIn    => newPCIn,
         PCinstAddr => PCinstAddr,
         inst       => inst,
         nextPC     => nextPC
      );
   memaccess : MEMStage
      PORT MAP (
         ALUresult    => ALUresult,
         DataMemIn    => DataMemIn,
         MEM_C_In     => MEM_C_In,
         SrcIn        => SrcIn,
         clk          => clk,
         DataAddr     => DataAddr,
         MEMDataOut   => MEMDataOut,
         MEMWriteData => MEMWriteData,
         MEM_C_Out    => MEM_C_Out
      );
   EXReg : TransitionReg
      PORT MAP (
         RESET_L => RESET_L,
         clk     => clk,
         d1      => ALUOut,
         d2      => Src,
         o1      => ALUresult,
         o2      => SrcIn
      );
   FetchReg : TransitionReg
      PORT MAP (
         RESET_L => RESET_L,
         clk     => clk,
         d1      => nextPC,
         d2      => inst,
         o1      => nextPCin,
         o2      => instIn
      );
   WBReg : TransitionReg
      PORT MAP (
         RESET_L => RESET_L,
         clk     => clk,
         d1      => ALUresult,
         d2      => MEMDataOut,
         o1      => ALUdata,
         o2      => MEMData
      );
   IDReg : TransitionReg3
      PORT MAP (
         RESET_L => RESET_L,
         clk     => clk,
         d1      => ALUInA,
         d2      => ALUInB,
         d3      => SrcRegData,
         o1      => inA,
         o2      => inB,
         o3      => SrcRegIn
      );
   WriteBack : WBStage
      PORT MAP (
         ALUdata   => ALUdata,
         MEMData   => MEMData,
         WB_C_In   => WB_C_In,
         DR        => DR,
         RegDataIn => RegDataIn,
         RegWrite  => RegWrite
      );
   branchReg : brReg
      PORT MAP (
         RESET_L => RESET_L,
         clk     => clk,
         newPC   => newPC,
         newPCIn => newPCIn
      );
   ourRegFile : REGFILE
      PORT MAP (
         CLK      => clk,
         DEST     => DR,
         DIN      => RegDataIn,
         RESET_L  => RESET_L,
         REGWRITE => RegWrite,
         SRCA     => RA,
         SRCB     => RB,
         A        => OutA,
         B        => OutB
      );

END struct;
