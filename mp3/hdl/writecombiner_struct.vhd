-- VHDL Entity ece411.WriteCombiner.symbol
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-18.ews.illinois.edu)
--          at - 23:12:58 11/28/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WriteCombiner IS
   PORT( 
      DataOut    : IN     lc3b_word;
      MWRITEH_L  : IN     std_logic;
      MWRITEL_L  : IN     std_logic;
      WayData    : IN     lc3b_oword;
      offset     : IN     lc3b_c_offset;
      newWayData : OUT    lc3b_oword
   );

-- Declarations

END WriteCombiner ;

--
-- VHDL Architecture ece411.WriteCombiner.struct
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-18.ews.illinois.edu)
--          at - 23:12:58 11/28/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF WriteCombiner IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL newword0 : lc3b_word;
   SIGNAL newword1 : lc3b_word;
   SIGNAL newword2 : lc3b_word;
   SIGNAL newword3 : lc3b_word;
   SIGNAL newword4 : lc3b_word;
   SIGNAL newword5 : lc3b_word;
   SIGNAL newword6 : lc3b_word;
   SIGNAL newword7 : lc3b_word;
   SIGNAL sel0     : std_logic;
   SIGNAL sel1     : std_logic;
   SIGNAL sel2     : std_logic;
   SIGNAL sel3     : std_logic;
   SIGNAL sel4     : std_logic;
   SIGNAL sel5     : std_logic;
   SIGNAL sel6     : std_logic;
   SIGNAL sel7     : std_logic;
   SIGNAL word0    : lc3b_word;
   SIGNAL word1    : lc3b_word;
   SIGNAL word2    : lc3b_word;
   SIGNAL word3    : lc3b_word;
   SIGNAL word4    : lc3b_word;
   SIGNAL word5    : lc3b_word;
   SIGNAL word6    : lc3b_word;
   SIGNAL word7    : lc3b_word;


   -- Component Declarations
   COMPONENT ByteExchanger
   PORT (
      DataOut   : IN     lc3b_word ;
      MWRITEH_L : IN     std_logic ;
      MWRITEL_L : IN     std_logic ;
      Sel       : IN     std_logic ;
      wordIn    : IN     lc3b_word ;
      newWord   : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT Decoder3In8Out
   PORT (
      offset : IN     lc3b_c_offset ;
      sel0   : OUT    std_logic ;
      sel1   : OUT    std_logic ;
      sel2   : OUT    std_logic ;
      sel3   : OUT    std_logic ;
      sel4   : OUT    std_logic ;
      sel5   : OUT    std_logic ;
      sel6   : OUT    std_logic ;
      sel7   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT oWordMerger
   PORT (
      newword0   : IN     lc3b_word ;
      newword1   : IN     lc3b_word ;
      newword2   : IN     lc3b_word ;
      newword3   : IN     lc3b_word ;
      newword4   : IN     lc3b_word ;
      newword5   : IN     lc3b_word ;
      newword6   : IN     lc3b_word ;
      newword7   : IN     lc3b_word ;
      newWayData : OUT    lc3b_oword 
   );
   END COMPONENT;
   COMPONENT oWordSplitter
   PORT (
      WayData : IN     lc3b_oword ;
      word0   : OUT    lc3b_word ;
      word1   : OUT    lc3b_word ;
      word2   : OUT    lc3b_word ;
      word3   : OUT    lc3b_word ;
      word4   : OUT    lc3b_word ;
      word5   : OUT    lc3b_word ;
      word6   : OUT    lc3b_word ;
      word7   : OUT    lc3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ByteExchanger USE ENTITY ece411.ByteExchanger;
   FOR ALL : Decoder3In8Out USE ENTITY ece411.Decoder3In8Out;
   FOR ALL : oWordMerger USE ENTITY ece411.oWordMerger;
   FOR ALL : oWordSplitter USE ENTITY ece411.oWordSplitter;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   WordExchanger0 : ByteExchanger
      PORT MAP (
         DataOut   => DataOut,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         Sel       => sel0,
         wordIn    => word0,
         newWord   => newword0
      );
   WordExchanger1 : ByteExchanger
      PORT MAP (
         DataOut   => DataOut,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         Sel       => sel1,
         wordIn    => word1,
         newWord   => newword1
      );
   WordExchanger2 : ByteExchanger
      PORT MAP (
         DataOut   => DataOut,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         Sel       => sel2,
         wordIn    => word2,
         newWord   => newword2
      );
   WordExchanger3 : ByteExchanger
      PORT MAP (
         DataOut   => DataOut,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         Sel       => sel3,
         wordIn    => word3,
         newWord   => newword3
      );
   WordExchanger4 : ByteExchanger
      PORT MAP (
         DataOut   => DataOut,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         Sel       => sel4,
         wordIn    => word4,
         newWord   => newword4
      );
   WordExchanger5 : ByteExchanger
      PORT MAP (
         DataOut   => DataOut,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         Sel       => sel5,
         wordIn    => word5,
         newWord   => newword5
      );
   WordExchanger6 : ByteExchanger
      PORT MAP (
         DataOut   => DataOut,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         Sel       => sel6,
         wordIn    => word6,
         newWord   => newword6
      );
   WordExchanger7 : ByteExchanger
      PORT MAP (
         DataOut   => DataOut,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         Sel       => sel7,
         wordIn    => word7,
         newWord   => newword7
      );
   decodinator : Decoder3In8Out
      PORT MAP (
         offset => offset,
         sel0   => sel0,
         sel1   => sel1,
         sel2   => sel2,
         sel3   => sel3,
         sel4   => sel4,
         sel5   => sel5,
         sel6   => sel6,
         sel7   => sel7
      );
   merginator : oWordMerger
      PORT MAP (
         newword0   => newword0,
         newword1   => newword1,
         newword2   => newword2,
         newword3   => newword3,
         newword4   => newword4,
         newword5   => newword5,
         newword6   => newword6,
         newword7   => newword7,
         newWayData => newWayData
      );
   splittinator : oWordSplitter
      PORT MAP (
         WayData => WayData,
         word0   => word0,
         word1   => word1,
         word2   => word2,
         word3   => word3,
         word4   => word4,
         word5   => word5,
         word6   => word6,
         word7   => word7
      );

END struct;
