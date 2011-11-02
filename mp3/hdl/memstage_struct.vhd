-- VHDL Entity ece411.MEMStage.interface
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-10.ews.illinois.edu)
--          at - 00:35:51 10/29/11
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
      ALUresult    : IN     lc3b_word;
      DataMemIn    : IN     lc3b_word;
      MEM_C_In     : IN     lc3b_word;
      SrcIn        : IN     lc3b_word;
      clk          : IN     std_logic;
      DataAddr     : OUT    lc3b_word;
      MEMDataOut   : OUT    lc3b_word;
      MEMWriteData : OUT    lc3b_word;
      MEM_C_Out    : OUT    lc3b_word
   );

-- Declarations

END MEMStage ;

--
-- VHDL Architecture ece411.MEMStage.struct
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-10.ews.illinois.edu)
--          at - 00:35:51 10/29/11
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

ARCHITECTURE struct OF MEMStage IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL CheckN    : std_logic;
   SIGNAL CheckP    : std_logic;
   SIGNAL CheckZ    : std_logic;
   SIGNAL DestReg   : lc3b_cc;
   SIGNAL GENMuxSel : STD_LOGIC;
   SIGNAL GenCCout  : lc3b_cc;
   SIGNAL brInst    : std_logic;
   SIGNAL gencc_in  : lc3b_word;
   SIGNAL loadNZP   : std_logic;
   SIGNAL n         : std_logic;
   SIGNAL p         : std_logic;
   SIGNAL z         : std_logic;


   -- Component Declarations
   COMPONENT GenCondCodes
   PORT (
      gencc_in : IN     lc3b_word ;
      GenCCout : OUT    lc3b_cc 
   );
   END COMPONENT;
   COMPONENT Worthless
   PORT (
      In0  : IN     LC3b_word ;
      Out0 : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT mem_C_decode
   PORT (
      MEM_C_In  : IN     lc3b_word ;
      DestReg   : OUT    lc3b_cc ;
      GENMuxSel : OUT    STD_LOGIC ;
      brInst    : OUT    std_logic ;
      loadNZP   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT theNZP
   PORT (
      GenCCout : IN     lc3b_cc ;
      clk      : IN     std_logic ;
      loadNZP  : IN     std_logic ;
      n        : OUT    std_logic ;
      p        : OUT    std_logic ;
      z        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT theNZPsplit
   PORT (
      DestReg : IN     lc3b_cc ;
      clk     : IN     std_logic ;
      CheckN  : OUT    std_logic ;
      CheckP  : OUT    std_logic ;
      CheckZ  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT wanna_branch
   PORT (
      CheckN    : IN     std_logic ;
      CheckP    : IN     std_logic ;
      CheckZ    : IN     std_logic ;
      brInst    : IN     std_logic ;
      n         : IN     std_logic ;
      p         : IN     std_logic ;
      z         : IN     std_logic ;
      MEM_C_Out : OUT    lc3b_word 
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
   FOR ALL : GenCondCodes USE ENTITY ece411.GenCondCodes;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : Worthless USE ENTITY ece411.Worthless;
   FOR ALL : mem_C_decode USE ENTITY ece411.mem_C_decode;
   FOR ALL : theNZP USE ENTITY ece411.theNZP;
   FOR ALL : theNZPsplit USE ENTITY ece411.theNZPsplit;
   FOR ALL : wanna_branch USE ENTITY ece411.wanna_branch;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   GenCC : GenCondCodes
      PORT MAP (
         gencc_in => gencc_in,
         GenCCout => GenCCout
      );
   Chillin : Worthless
      PORT MAP (
         In0  => DataMemIn,
         Out0 => MEMDataOut
      );
   Just : Worthless
      PORT MAP (
         In0  => ALUresult,
         Out0 => DataAddr
      );
   Man : Worthless
      PORT MAP (
         In0  => SrcIn,
         Out0 => MEMWriteData
      );
   decodin : mem_C_decode
      PORT MAP (
         MEM_C_In  => MEM_C_In,
         DestReg   => DestReg,
         GENMuxSel => GENMuxSel,
         brInst    => brInst,
         loadNZP   => loadNZP
      );
   NZPinator : theNZP
      PORT MAP (
         GenCCout => GenCCout,
         clk      => clk,
         loadNZP  => loadNZP,
         n        => n,
         p        => p,
         z        => z
      );
   splititator : theNZPsplit
      PORT MAP (
         DestReg => DestReg,
         clk     => clk,
         CheckN  => CheckN,
         CheckP  => CheckP,
         CheckZ  => CheckZ
      );
   I_wanna_branch : wanna_branch
      PORT MAP (
         CheckN    => CheckN,
         CheckP    => CheckP,
         CheckZ    => CheckZ,
         brInst    => brInst,
         n         => n,
         p         => p,
         z         => z,
         MEM_C_Out => MEM_C_Out
      );
   U_0 : MUX2_16
      PORT MAP (
         A   => ALUresult,
         B   => DataMemIn,
         SEL => GENMuxSel,
         F   => gencc_in
      );

END struct;
