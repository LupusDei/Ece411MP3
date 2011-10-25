-- VHDL Entity ece411.Pipeline.interface
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-16.ews.illinois.edu)
--          at - 22:07:37 10/24/11
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
--          by - bhatia9.UNKNOWN (gelib-057-16.ews.illinois.edu)
--          at - 22:07:37 10/24/11
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
   SIGNAL DR         : lc3b_reg;
   SIGNAL MEMAddrOut : lc3b_word;
   SIGNAL MEMDataOut : lc3b_word;
   SIGNAL OutA       : lc3b_word;
   SIGNAL OutB       : lc3b_word;
   SIGNAL RA         : lc3b_reg;
   SIGNAL RB         : lc3b_reg;
   SIGNAL RegDataIn  : lc3b_word;
   SIGNAL RegWrite   : std_logic;
   SIGNAL inst       : lc3b_word;
   SIGNAL newPC      : lc3b_word;
   SIGNAL nextPC     : lc3b_word;


   -- Component Declarations
   COMPONENT EXStage
   PORT (
      ALUInA   : IN     lc3b_word ;
      ALUInB   : IN     lc3b_word ;
      EX_C_In  : IN     lc3b_word ;
      ALUOut   : OUT    lc3b_word ;
      EX_C_Out : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT IDStage
   PORT (
      ID_C_In  : IN     lc3b_word ;
      OutA     : IN     lc3b_word ;
      OutB     : IN     lc3b_word ;
      inst     : IN     lc3b_word ;
      nextPC   : IN     lc3b_word ;
      ALUInA   : OUT    lc3b_word ;
      ALUInB   : OUT    lc3b_word ;
      ID_C_Out : OUT    lc3b_word ;
      RA       : OUT    lc3b_reg ;
      RB       : OUT    lc3b_reg ;
      instOut  : OUT    lc3b_word ;
      newPC    : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT IFStage
   PORT (
      IF_C_In    : IN     lc3b_word ;
      InstMemIn  : IN     lc3b_word ;
      RESET_L    : IN     std_logic ;
      clk        : IN     std_logic ;
      newPC      : IN     lc3b_word ;
      PCinstAddr : OUT    lc3b_word ;
      inst       : OUT    lc3b_word ;
      nextPC     : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT MEMStage
   PORT (
      ALUOut       : IN     lc3b_word;
      DataMemIn    : IN     lc3b_word;
      MEM_C_In     : IN     lc3b_word;
      DataAddr     : OUT    lc3b_word;
      MEMAddrOut   : OUT    lc3b_word;
      MEMDataOut   : OUT    lc3b_word;
      MEMWriteData : OUT    lc3b_word;
      MEM_C_Out    : OUT    lc3b_word
   );
   END COMPONENT;
   COMPONENT WBStage
   PORT (
      MEMAddrOut : IN     lc3b_word;
      MEMDataOut : IN     lc3b_word;
      WB_C_In    : IN     lc3b_word;
      DR         : OUT    lc3b_reg;
      RegDataIn  : OUT    lc3b_word;
      RegWrite   : OUT    std_logic
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
   FOR ALL : WBStage USE ENTITY ece411.WBStage;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   Execution : EXStage
      PORT MAP (
         ALUInA   => ALUInA,
         ALUInB   => ALUInB,
         EX_C_In  => EX_C_In,
         ALUOut   => ALUOut,
         EX_C_Out => EX_C_Out
      );
   InstructionDecode : IDStage
      PORT MAP (
         ID_C_In  => ID_C_In,
         OutA     => OutA,
         OutB     => OutB,
         inst     => inst,
         nextPC   => nextPC,
         ALUInA   => ALUInA,
         ALUInB   => ALUInB,
         ID_C_Out => ID_C_Out,
         RA       => RA,
         RB       => RB,
         instOut  => instOut,
         newPC    => newPC
      );
   InstructionFetch : IFStage
      PORT MAP (
         IF_C_In    => IF_C_In,
         InstMemIn  => InstMemIn,
         RESET_L    => RESET_L,
         clk        => clk,
         newPC      => newPC,
         PCinstAddr => PCinstAddr,
         inst       => inst,
         nextPC     => nextPC
      );
   MemoryAccess : MEMStage
      PORT MAP (
         ALUOut       => ALUOut,
         DataMemIn    => DataMemIn,
         MEM_C_In     => MEM_C_In,
         DataAddr     => DataAddr,
         MEMAddrOut   => MEMAddrOut,
         MEMDataOut   => MEMDataOut,
         MEMWriteData => MEMWriteData,
         MEM_C_Out    => MEM_C_Out
      );
   WriteBack : WBStage
      PORT MAP (
         MEMAddrOut => MEMAddrOut,
         MEMDataOut => MEMDataOut,
         WB_C_In    => WB_C_In,
         DR         => DR,
         RegDataIn  => RegDataIn,
         RegWrite   => RegWrite
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
