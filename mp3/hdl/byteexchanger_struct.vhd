-- VHDL Entity ece411.ByteExchanger.symbol
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-28.ews.illinois.edu)
--          at - 19:54:16 09/30/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteExchanger IS
   PORT( 
      DataOut   : IN     lc3b_word;
      MWRITEH_L : IN     std_logic;
      MWRITEL_L : IN     std_logic;
      Sel       : IN     std_logic;
      wordIn    : IN     lc3b_word;
      newWord   : OUT    lc3b_word
   );

-- Declarations

END ByteExchanger ;

--
-- VHDL Architecture ece411.ByteExchanger.struct
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-28.ews.illinois.edu)
--          at - 19:54:16 09/30/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF ByteExchanger IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL HighByte  : lc3b_byte;
   SIGNAL LowByte   : lc3b_byte;
   SIGNAL O         : std_logic;
   SIGNAL O1        : std_logic;
   SIGNAL a_not     : std_logic;
   SIGNAL a_not1    : std_logic;
   SIGNAL wordOutH  : lc3b_byte;
   SIGNAL wordOutH1 : lc3b_byte;
   SIGNAL wordOutL  : lc3b_byte;
   SIGNAL wordOutL1 : lc3b_byte;


   -- Component Declarations
   COMPONENT Byte2Mux
   PORT (
      Byte0   : IN     lc3b_byte ;
      Byte1   : IN     lc3b_byte ;
      Sel     : IN     std_logic ;
      ByteOut : OUT    lc3b_byte 
   );
   END COMPONENT;
   COMPONENT ByteMerger
   PORT (
      HighByte : IN     lc3b_byte ;
      LowByte  : IN     lc3b_byte ;
      newWord  : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT WordSplitter
   PORT (
      wordIn   : IN     lc3b_word ;
      wordOutH : OUT    lc3b_byte ;
      wordOutL : OUT    lc3b_byte 
   );
   END COMPONENT;
   COMPONENT myAND
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      O : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT myNOT
   PORT (
      a     : IN     std_logic ;
      a_not : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Byte2Mux USE ENTITY ece411.Byte2Mux;
   FOR ALL : ByteMerger USE ENTITY ece411.ByteMerger;
   FOR ALL : WordSplitter USE ENTITY ece411.WordSplitter;
   FOR ALL : myAND USE ENTITY ece411.myAND;
   FOR ALL : myNOT USE ENTITY ece411.myNOT;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   HByteSel : Byte2Mux
      PORT MAP (
         Byte0   => wordOutH,
         Byte1   => wordOutH1,
         Sel     => O,
         ByteOut => HighByte
      );
   LByteSel : Byte2Mux
      PORT MAP (
         Byte0   => wordOutL,
         Byte1   => wordOutL1,
         Sel     => O1,
         ByteOut => LowByte
      );
   ByteMerginator : ByteMerger
      PORT MAP (
         HighByte => HighByte,
         LowByte  => LowByte,
         newWord  => newWord
      );
   DataOutSplitter : WordSplitter
      PORT MAP (
         wordIn   => DataOut,
         wordOutH => wordOutH1,
         wordOutL => wordOutL1
      );
   WayWordSplitter : WordSplitter
      PORT MAP (
         wordIn   => wordIn,
         wordOutH => wordOutH,
         wordOutL => wordOutL
      );
   writeHAND : myAND
      PORT MAP (
         A => Sel,
         B => a_not,
         O => O
      );
   writeLAND : myAND
      PORT MAP (
         A => Sel,
         B => a_not1,
         O => O1
      );
   U_0 : myNOT
      PORT MAP (
         a     => MWRITEL_L,
         a_not => a_not1
      );
   U_1 : myNOT
      PORT MAP (
         a     => MWRITEH_L,
         a_not => a_not
      );

END struct;
