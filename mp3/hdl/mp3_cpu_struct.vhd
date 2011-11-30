-- VHDL Entity ece411.mp3_CPU.symbol
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-24.ews.illinois.edu)
--          at - 05:33:01 11/30/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mp3_CPU IS
   PORT( 
      CLK     : IN     std_logic;
      RESET_L : IN     std_logic
   );

-- Declarations

END mp3_CPU ;

--
-- VHDL Architecture ece411.mp3_CPU.struct
--
-- Created:
--          by - bhatia9.UNKNOWN (gelib-057-24.ews.illinois.edu)
--          at - 05:33:01 11/30/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF mp3_CPU IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL DM_RESP_H    : std_logic;
   SIGNAL EX_C_In      : lc3b_word;
   SIGNAL EX_C_Out     : lc3b_word;
   SIGNAL ID_C_In      : lc3b_word;
   SIGNAL ID_C_Out     : lc3b_word;
   SIGNAL IF_C_In      : lc3b_word;
   SIGNAL MEM_C_In     : lc3b_word;
   SIGNAL MEM_C_Out    : lc3b_word;
   SIGNAL WB_C_In      : lc3b_word;
   SIGNAL dMiss        : std_logic;
   SIGNAL dataaddr     : lc3b_word;
   SIGNAL datamemin    : lc3b_word;
   SIGNAL dm_read_l    : std_logic;
   SIGNAL dm_writeh_l  : std_logic;
   SIGNAL dm_writel_l  : std_logic;
   SIGNAL iMiss        : std_logic;
   SIGNAL im_read_l    : std_logic;
   SIGNAL im_resp_h    : std_logic;
   SIGNAL im_writeh_l  : std_logic;
   SIGNAL im_writel_l  : std_logic;
   SIGNAL instOut      : lc3b_word;
   SIGNAL instmemin    : lc3b_word;
   SIGNAL memwritedata : lc3b_word;
   SIGNAL pcinstaddr   : lc3b_word;
   SIGNAL stall        : std_logic;


   -- Component Declarations
   COMPONENT CU
   PORT (
      CLK         : IN     std_logic ;
      DM_RESP_H   : IN     std_logic ;
      EX_C_Out    : IN     lc3b_word ;
      ID_C_Out    : IN     lc3b_word ;
      MEM_C_Out   : IN     lc3b_word ;
      RESET_L     : IN     std_logic ;
      dMiss       : IN     std_logic ;
      iMiss       : IN     std_logic ;
      im_resp_h   : IN     std_logic ;
      instOut     : IN     lc3b_word ;
      EX_C_In     : OUT    lc3b_word ;
      ID_C_In     : OUT    lc3b_word ;
      IF_C_In     : OUT    lc3b_word ;
      MEM_C_In    : OUT    lc3b_word ;
      WB_C_In     : OUT    lc3b_word ;
      dm_read_l   : OUT    std_logic ;
      dm_writeh_l : OUT    std_logic ;
      dm_writel_l : OUT    std_logic ;
      im_read_l   : OUT    std_logic ;
      im_writeh_l : OUT    std_logic ;
      im_writel_l : OUT    std_logic ;
      stall       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Magmem
   PORT (
      DataAddr     : IN     lc3b_word ;
      MEMWriteData : IN     lc3b_word ;
      PCinstAddr   : IN     lc3b_word ;
      RESET_L      : IN     std_logic ;
      clk          : IN     std_logic ;
      dm_read_l    : IN     std_logic ;
      dm_writeh_l  : IN     std_logic ;
      dm_writel_l  : IN     std_logic ;
      im_read_l    : IN     std_logic ;
      im_writeh_l  : IN     std_logic ;
      im_writel_l  : IN     std_logic ;
      DataMemIn    : OUT    lc3b_word ;
      InstMemIn    : OUT    lc3b_word ;
      dm_resp_h    : OUT    std_logic ;
      imiss        : OUT    std_logic ;
      dmiss        : OUT    std_logic ;
      im_resp_h    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Pipeline
   PORT (
      CLK          : IN     std_logic ;
      EX_C_In      : IN     lc3b_word ;
      ID_C_In      : IN     lc3b_word ;
      IF_C_In      : IN     lc3b_word ;
      MEM_C_In     : IN     lc3b_word ;
      RESET_L      : IN     std_logic ;
      STALL        : IN     std_logic ;
      WB_C_In      : IN     lc3b_word ;
      datamemin    : IN     lc3b_word ;
      instmemin    : IN     lc3b_word ;
      EX_C_Out     : OUT    lc3b_word ;
      ID_C_Out     : OUT    lc3b_word ;
      MEM_C_Out    : OUT    lc3b_word ;
      dataaddr     : OUT    lc3b_word ;
      instOut      : OUT    lc3b_word ;
      memwritedata : OUT    lc3b_word ;
      pcinstaddr   : OUT    lc3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : CU USE ENTITY ece411.CU;
   FOR ALL : Magmem USE ENTITY ece411.Magmem;
   FOR ALL : Pipeline USE ENTITY ece411.Pipeline;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   ControlUnit : CU
      PORT MAP (
         CLK         => CLK,
         DM_RESP_H   => DM_RESP_H,
         EX_C_Out    => EX_C_Out,
         ID_C_Out    => ID_C_Out,
         MEM_C_Out   => MEM_C_Out,
         RESET_L     => RESET_L,
         dMiss       => dMiss,
         iMiss       => iMiss,
         im_resp_h   => im_resp_h,
         instOut     => instOut,
         EX_C_In     => EX_C_In,
         ID_C_In     => ID_C_In,
         IF_C_In     => IF_C_In,
         MEM_C_In    => MEM_C_In,
         WB_C_In     => WB_C_In,
         dm_read_l   => dm_read_l,
         dm_writeh_l => dm_writeh_l,
         dm_writel_l => dm_writel_l,
         im_read_l   => im_read_l,
         im_writeh_l => im_writeh_l,
         im_writel_l => im_writel_l,
         stall       => stall
      );
   U_0 : Magmem
      PORT MAP (
         DataAddr     => dataaddr,
         MEMWriteData => memwritedata,
         PCinstAddr   => pcinstaddr,
         RESET_L      => RESET_L,
         clk          => CLK,
         dm_read_l    => dm_read_l,
         dm_writeh_l  => dm_writeh_l,
         dm_writel_l  => dm_writel_l,
         im_read_l    => im_read_l,
         im_writeh_l  => im_writeh_l,
         im_writel_l  => im_writel_l,
         DataMemIn    => datamemin,
         InstMemIn    => instmemin,
         dm_resp_h    => DM_RESP_H,
         imiss        => iMiss,
         dmiss        => dMiss,
         im_resp_h    => im_resp_h
      );
   PipelineDataPath : Pipeline
      PORT MAP (
         CLK          => CLK,
         EX_C_In      => EX_C_In,
         ID_C_In      => ID_C_In,
         IF_C_In      => IF_C_In,
         MEM_C_In     => MEM_C_In,
         RESET_L      => RESET_L,
         WB_C_In      => WB_C_In,
         datamemin    => datamemin,
         instmemin    => instmemin,
         stall        => stall,
         EX_C_Out     => EX_C_Out,
         ID_C_Out     => ID_C_Out,
         MEM_C_Out    => MEM_C_Out,
         dataaddr     => dataaddr,
         instOut      => instOut,
         memwritedata => memwritedata,
         pcinstaddr   => pcinstaddr
      );

END struct;
