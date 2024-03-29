-- VHDL Entity ece411.WayUnit.symbol
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 12:40:57 12/05/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WayUnit IS
   PORT( 
      Hit         : IN     std_logic;
      RESET_L     : IN     std_logic;
      WayDataIn   : IN     lc3b_oword;
      WaySelect   : IN     std_logic;
      WriteAccess : IN     std_logic;
      clk         : IN     std_logic;
      in_Load     : IN     std_logic;
      index       : IN     lc3b_c_index;
      tag         : IN     lc3b_c_tag;
      DirtyOut    : OUT    std_logic;
      PreHit      : OUT    std_logic;
      TagOut      : OUT    lc3b_c_tag;
      WayDataOut  : OUT    lc3b_oword
   );

-- Declarations

END WayUnit ;

--
-- VHDL Architecture ece411.WayUnit.struct
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-19.ews.illinois.edu)
--          at - 12:40:58 12/05/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF WayUnit IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL DataWrite  : std_logic;
   SIGNAL DirtyWrite : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL PreHit_internal : std_logic;


   -- Component Declarations
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

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : DataWriteCalc USE ENTITY ece411.DataWriteCalc;
   FOR ALL : Way USE ENTITY ece411.Way;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   Way0WriteCalc : DataWriteCalc
      PORT MAP (
         Hit         => Hit,
         PreHit      => PreHit_internal,
         WaySelect   => WaySelect,
         WriteAccess => WriteAccess,
         clk         => clk,
         in_Load     => in_Load,
         DataWrite   => DataWrite,
         DirtyWrite  => DirtyWrite
      );
   Way0 : Way
      PORT MAP (
         DataWrite  => DataWrite,
         DirtyWrite => DirtyWrite,
         RESET_L    => RESET_L,
         WayDataIn  => WayDataIn,
         index      => index,
         tag        => tag,
         DirtyOut   => DirtyOut,
         PreHit     => PreHit_internal,
         TagOut     => TagOut,
         WayDataOut => WayDataOut
      );

   -- Implicit buffered output assignments
   PreHit <= PreHit_internal;

END struct;
