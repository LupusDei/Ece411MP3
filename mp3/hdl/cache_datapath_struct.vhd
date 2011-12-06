-- VHDL Entity ece411.Cache_Datapath.interface
--
-- Created:
--          by - martin43.UNKNOWN (evrt-252-30.ews.illinois.edu)
--          at - 20:04:29 12/05/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Cache_Datapath IS
   PORT( 
      ADDRESS    : IN     LC3b_word;
      DATAOUT    : IN     LC3b_word;
      MREAD_L    : IN     std_logic;
      MWRITEH_L  : IN     std_logic;
      MWRITEL_L  : IN     std_logic;
      RESET_L    : IN     std_logic;
      clk        : IN     std_logic;
      in_IdleHit : IN     std_logic;
      in_Load    : IN     std_logic;
      pmdatain   : IN     lc3b_oword;
      DATAIN     : OUT    LC3b_word;
      Dirty      : OUT    std_logic;
      Hit        : OUT    std_logic;
      MRESP_H    : OUT    std_logic;
      Miss       : OUT    std_logic;
      pmaddress  : OUT    LC3b_word;
      pmdataout  : OUT    lc3b_oword
   );

-- Declarations

END Cache_Datapath ;

--
-- VHDL Architecture ece411.Cache_Datapath.struct
--
-- Created:
--          by - martin43.UNKNOWN (evrt-252-30.ews.illinois.edu)
--          at - 20:04:29 12/05/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF Cache_Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL DataWrite    : std_logic;
   SIGNAL DataWrite1   : std_logic;
   SIGNAL DirtyOut0    : std_logic;
   SIGNAL DirtyOut1    : std_logic;
   SIGNAL DirtyWrite   : std_logic;
   SIGNAL DirtyWrite1  : std_logic;
   SIGNAL LRUOut       : std_logic;
   SIGNAL PreHit0      : std_logic;
   SIGNAL PreHit1      : std_logic;
   SIGNAL TagOut0      : lc3b_c_tag;
   SIGNAL TagOut1      : lc3b_c_tag;
   SIGNAL WayDataOut0  : lc3b_oword;
   SIGNAL WayDataOut1  : lc3b_oword;
   SIGNAL WayoWordData : lc3b_oword;
   SIGNAL WriteAccess  : std_logic;
   SIGNAL a_not        : std_logic;
   SIGNAL a_not1       : std_logic;
   SIGNAL index        : lc3b_c_index;
   SIGNAL newWayData   : lc3b_oword;
   SIGNAL o3           : std_logic;
   SIGNAL offset       : lc3b_c_offset;
   SIGNAL tag          : lc3b_c_tag;
   SIGNAL tagIn        : lc3b_c_tag;
   SIGNAL tagOut       : lc3b_c_tag;
   SIGNAL wayDataIn    : lc3b_oword;

   -- Implicit buffer signal declarations
   SIGNAL Hit_internal : std_logic;


   -- Component Declarations
   COMPONENT Bit2Mux
   PORT (
      a   : IN     std_logic ;
      b   : IN     std_logic ;
      sel : IN     std_logic ;
      o   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT DataWriteCalc
   PORT (
      Hit         : IN     std_logic ;
      PreHit      : IN     std_logic ;
      WaySelect   : IN     std_logic ;
      WriteAccess : IN     std_logic ;
      clk         : IN     std_logic ;
      in_Load     : IN     std_logic ;
      DataWrite   : OUT    std_logic ;
      DirtyWrite  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Hit2InCalc
   PORT (
      PreHit0    : IN     std_logic ;
      PreHit1    : IN     std_logic ;
      active     : IN     std_logic ;
      clk        : IN     std_logic ;
      in_IdleHit : IN     std_logic ;
      Hit        : OUT    std_logic ;
      Miss       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT LRU
   PORT (
      Hit     : IN     std_logic ;
      PreHit0 : IN     std_logic ;
      RESET_L : IN     std_logic ;
      index   : IN     lc3b_c_index ;
      LRUOut  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT MemAddrComb
   PORT (
      index     : IN     lc3b_c_index ;
      tagIn     : IN     lc3b_c_tag ;
      pmaddress : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT Splitter
   PORT (
      ADDRESS : IN     LC3b_word ;
      index   : OUT    lc3b_c_index ;
      offset  : OUT    lc3b_c_offset ;
      tag     : OUT    lc3b_c_tag 
   );
   END COMPONENT;
   COMPONENT Tag2Mux
   PORT (
      sel    : IN     std_logic ;
      tag0   : IN     lc3b_c_tag ;
      tag1   : IN     lc3b_c_tag ;
      tagOut : OUT    lc3b_c_tag 
   );
   END COMPONENT;
   COMPONENT Way
   PORT (
      DataWrite  : IN     std_logic ;
      DirtyWrite : IN     std_logic ;
      RESET_L    : IN     std_logic ;
      WayDataIn  : IN     lc3b_oword ;
      index      : IN     lc3b_c_index ;
      tag        : IN     lc3b_c_tag ;
      DirtyOut   : OUT    std_logic ;
      PreHit     : OUT    std_logic ;
      TagOut     : OUT    lc3b_c_tag ;
      WayDataOut : OUT    lc3b_oword 
   );
   END COMPONENT;
   COMPONENT WriteCombiner
   PORT (
      DataOut    : IN     lc3b_word ;
      MWRITEH_L  : IN     std_logic ;
      MWRITEL_L  : IN     std_logic ;
      WayData    : IN     lc3b_oword ;
      offset     : IN     lc3b_c_offset ;
      newWayData : OUT    lc3b_oword 
   );
   END COMPONENT;
   COMPONENT my2NAND
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      z : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT my3NAND
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      c : IN     std_logic ;
      o : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT myNOT
   PORT (
      a     : IN     std_logic ;
      a_not : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT oWord2Mux
   PORT (
      A   : IN     lc3b_oword ;
      B   : IN     lc3b_oword ;
      Sel : IN     std_logic ;
      O   : OUT    lc3b_oword 
   );
   END COMPONENT;
   COMPONENT oWordMux
   PORT (
      PreWayDataOut : IN     lc3b_oword ;
      offset        : IN     lc3b_c_offset ;
      WayData       : OUT    lc3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Bit2Mux USE ENTITY ece411.Bit2Mux;
   FOR ALL : DataWriteCalc USE ENTITY ece411.DataWriteCalc;
   FOR ALL : Hit2InCalc USE ENTITY ece411.Hit2InCalc;
   FOR ALL : LRU USE ENTITY ece411.LRU;
   FOR ALL : MemAddrComb USE ENTITY ece411.MemAddrComb;
   FOR ALL : Splitter USE ENTITY ece411.Splitter;
   FOR ALL : Tag2Mux USE ENTITY ece411.Tag2Mux;
   FOR ALL : Way USE ENTITY ece411.Way;
   FOR ALL : WriteCombiner USE ENTITY ece411.WriteCombiner;
   FOR ALL : my2NAND USE ENTITY ece411.my2NAND;
   FOR ALL : my3NAND USE ENTITY ece411.my3NAND;
   FOR ALL : myNOT USE ENTITY ece411.myNOT;
   FOR ALL : oWord2Mux USE ENTITY ece411.oWord2Mux;
   FOR ALL : oWordMux USE ENTITY ece411.oWordMux;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   DirtyMux : Bit2Mux
      PORT MAP (
         a   => DirtyOut0,
         b   => DirtyOut1,
         sel => LRUOut,
         o   => Dirty
      );
   Way0WriteCalc : DataWriteCalc
      PORT MAP (
         Hit         => Hit_internal,
         PreHit      => PreHit0,
         WaySelect   => a_not,
         WriteAccess => WriteAccess,
         clk         => clk,
         in_Load     => in_Load,
         DataWrite   => DataWrite,
         DirtyWrite  => DirtyWrite
      );
   Way1WriteCalc : DataWriteCalc
      PORT MAP (
         Hit         => Hit_internal,
         PreHit      => PreHit1,
         WaySelect   => LRUOut,
         WriteAccess => WriteAccess,
         clk         => clk,
         in_Load     => in_Load,
         DataWrite   => DataWrite1,
         DirtyWrite  => DirtyWrite1
      );
   HitMissCalc : Hit2InCalc
      PORT MAP (
         PreHit0    => PreHit0,
         PreHit1    => PreHit1,
         active     => o3,
         clk        => clk,
         in_IdleHit => in_IdleHit,
         Hit        => Hit_internal,
         Miss       => Miss
      );
   aLRU : LRU
      PORT MAP (
         Hit     => Hit_internal,
         PreHit0 => PreHit0,
         RESET_L => RESET_L,
         index   => index,
         LRUOut  => LRUOut
      );
   addrCombiner : MemAddrComb
      PORT MAP (
         index     => index,
         tagIn     => tagIn,
         pmaddress => pmaddress
      );
   aSplitter : Splitter
      PORT MAP (
         ADDRESS => ADDRESS,
         index   => index,
         offset  => offset,
         tag     => tag
      );
   WayTagMux : Tag2Mux
      PORT MAP (
         sel    => LRUOut,
         tag0   => TagOut0,
         tag1   => TagOut1,
         tagOut => tagOut
      );
   pmTagMux : Tag2Mux
      PORT MAP (
         sel    => in_Load,
         tag0   => tagOut,
         tag1   => tag,
         tagOut => tagIn
      );
   Way0 : Way
      PORT MAP (
         DataWrite  => DataWrite,
         DirtyWrite => DirtyWrite,
         RESET_L    => RESET_L,
         WayDataIn  => wayDataIn,
         index      => index,
         tag        => tag,
         DirtyOut   => DirtyOut0,
         PreHit     => PreHit0,
         TagOut     => TagOut0,
         WayDataOut => WayDataOut0
      );
   Way1 : Way
      PORT MAP (
         DataWrite  => DataWrite1,
         DirtyWrite => DirtyWrite1,
         RESET_L    => RESET_L,
         WayDataIn  => wayDataIn,
         index      => index,
         tag        => tag,
         DirtyOut   => DirtyOut1,
         PreHit     => PreHit1,
         TagOut     => TagOut1,
         WayDataOut => WayDataOut1
      );
   WriteCombinator : WriteCombiner
      PORT MAP (
         DataOut    => DATAOUT,
         MWRITEH_L  => MWRITEH_L,
         MWRITEL_L  => MWRITEL_L,
         WayData    => WayoWordData,
         offset     => offset,
         newWayData => newWayData
      );
   writeNAND : my2NAND
      PORT MAP (
         A => MWRITEH_L,
         B => MWRITEL_L,
         z => WriteAccess
      );
   activeAND : my3NAND
      PORT MAP (
         a => MREAD_L,
         b => MWRITEH_L,
         c => MWRITEL_L,
         o => o3
      );
   U_2 : myNOT
      PORT MAP (
         a     => LRUOut,
         a_not => a_not
      );
   U_3 : myNOT
      PORT MAP (
         a     => Hit_internal,
         a_not => a_not1
      );
   U_4 : myNOT
      PORT MAP (
         a     => a_not1,
         a_not => MRESP_H
      );
   WayDataMux : oWord2Mux
      PORT MAP (
         A   => WayDataOut0,
         B   => WayDataOut1,
         Sel => PreHit1,
         O   => WayoWordData
      );
   WayDataMux1 : oWord2Mux
      PORT MAP (
         A   => WayDataOut0,
         B   => WayDataOut1,
         Sel => LRUOut,
         O   => pmdataout
      );
   WayDataMux2 : oWord2Mux
      PORT MAP (
         A   => newWayData,
         B   => pmdatain,
         Sel => in_Load,
         O   => wayDataIn
      );
   oWordSplitter : oWordMux
      PORT MAP (
         PreWayDataOut => WayoWordData,
         offset        => offset,
         WayData       => DATAIN
      );

   -- Implicit buffered output assignments
   Hit <= Hit_internal;

END struct;
