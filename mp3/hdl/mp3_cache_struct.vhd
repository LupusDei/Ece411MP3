-- VHDL Entity ece411.MP3_Cache.symbol
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-08.ews.illinois.edu)
--          at - 22:22:54 11/02/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MP3_Cache IS
   PORT( 
      DataAddr     : IN     lc3b_word;
      RESET_L      : IN     std_logic;
      clk          : IN     std_logic;
      dM_READ_L    : IN     std_logic;
      dM_WRITEH_L  : IN     std_logic;
      dm_writel_l  : IN     std_logic;
      iM_WRITEH_L  : IN     std_logic;
      im_read_l    : IN     std_logic;
      im_writel_l  : IN     std_logic;
      memwritedata : IN     lc3b_word;
      pcinstaddr   : IN     lc3b_word;
      DataMemIn    : OUT    lc3b_word;
      InstMemIn    : OUT    lc3b_word;
      dm_resp_h    : OUT    std_logic;
      im_resp_h    : OUT    std_logic
   );

-- Declarations

END MP3_Cache ;

--
-- VHDL Architecture ece411.MP3_Cache.struct
--
-- Created:
--          by - bhatia9.UNKNOWN (siebl-0216-08.ews.illinois.edu)
--          at - 22:22:54 11/02/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF MP3_Cache IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL dDirty       : std_logic;
   SIGNAL dHit         : std_logic;
   SIGNAL dMiss        : std_logic;
   SIGNAL d_in_IdleHit : std_logic;
   SIGNAL d_in_Load    : std_logic;
   SIGNAL dpmaddress   : LC3b_word;
   SIGNAL dpmdatain    : lc3b_oword;
   SIGNAL dpmdataout   : lc3b_oword;
   SIGNAL dpmread_l    : std_logic;
   SIGNAL dpmresp_h    : std_logic;
   SIGNAL dpmwrite_l   : std_logic;
   SIGNAL iDATAOUT     : LC3b_word;
   SIGNAL iDirty       : std_logic;
   SIGNAL iHit         : std_logic;
   SIGNAL iMiss        : std_logic;
   SIGNAL i_in_IdleHit : std_logic;
   SIGNAL i_in_Load    : std_logic;
   SIGNAL ipmaddress   : LC3b_word;
   SIGNAL ipmdatain    : lc3b_oword;
   SIGNAL ipmdataout   : lc3b_oword;
   SIGNAL ipmread_l    : std_logic;
   SIGNAL ipmresp_h    : std_logic;
   SIGNAL ipmwrite_l   : std_logic;


   -- Component Declarations
   COMPONENT Cache_Controller
   PORT (
      Dirty      : IN     std_logic ;
      Hit        : IN     std_logic ;
      Miss       : IN     std_logic ;
      RESET_L    : IN     std_logic ;
      clk        : IN     std_logic ;
      pmresp_h   : IN     std_logic ;
      in_IdleHit : OUT    std_logic ;
      in_Load    : OUT    std_logic ;
      pmread_l   : OUT    std_logic ;
      pmwrite_l  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Cache_Datapath
   PORT (
      ADDRESS    : IN     LC3b_word ;
      DATAOUT    : IN     LC3b_word ;
      MREAD_L    : IN     std_logic ;
      MWRITEH_L  : IN     std_logic ;
      MWRITEL_L  : IN     std_logic ;
      RESET_L    : IN     std_logic ;
      clk        : IN     std_logic ;
      in_IdleHit : IN     std_logic ;
      in_Load    : IN     std_logic ;
      pmdatain   : IN     lc3b_oword ;
      DATAIN     : OUT    LC3b_word ;
      Dirty      : OUT    std_logic ;
      Hit        : OUT    std_logic ;
      MRESP_H    : OUT    std_logic ;
      Miss       : OUT    std_logic ;
      pmaddress  : OUT    LC3b_word ;
      pmdataout  : OUT    lc3b_oword 
   );
   END COMPONENT;
   COMPONENT Physical_Memory
   PORT (
      RESET_L   : IN     std_logic ;
      clk       : IN     std_logic ;
      pmaddress : IN     LC3b_word ;
      pmdataout : IN     lc3b_oword ;
      pmread_l  : IN     std_logic ;
      pmwrite_l : IN     std_logic ;
      pmdatain  : OUT    lc3b_oword ;
      pmresp_h  : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Cache_Controller USE ENTITY ece411.Cache_Controller;
   FOR ALL : Cache_Datapath USE ENTITY ece411.Cache_Datapath;
   FOR ALL : Physical_Memory USE ENTITY ece411.Physical_Memory;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   DCacheCont : Cache_Controller
      PORT MAP (
         Dirty      => dDirty,
         Hit        => dHit,
         Miss       => dMiss,
         RESET_L    => RESET_L,
         clk        => clk,
         pmresp_h   => dpmresp_h,
         in_IdleHit => d_in_IdleHit,
         in_Load    => d_in_Load,
         pmread_l   => dpmread_l,
         pmwrite_l  => dpmwrite_l
      );
   ICacheCont : Cache_Controller
      PORT MAP (
         Dirty      => iDirty,
         Hit        => iHit,
         Miss       => iMiss,
         RESET_L    => RESET_L,
         clk        => clk,
         pmresp_h   => ipmresp_h,
         in_IdleHit => i_in_IdleHit,
         in_Load    => i_in_Load,
         pmread_l   => ipmread_l,
         pmwrite_l  => ipmwrite_l
      );
   ICache : Cache_Datapath
      PORT MAP (
         ADDRESS    => pcinstaddr,
         DATAOUT    => iDATAOUT,
         MREAD_L    => im_read_l,
         MWRITEH_L  => iM_WRITEH_L,
         MWRITEL_L  => im_writel_l,
         RESET_L    => RESET_L,
         clk        => clk,
         in_IdleHit => i_in_IdleHit,
         in_Load    => i_in_Load,
         pmdatain   => ipmdatain,
         DATAIN     => InstMemIn,
         Dirty      => iDirty,
         Hit        => iHit,
         MRESP_H    => im_resp_h,
         Miss       => iMiss,
         pmaddress  => ipmaddress,
         pmdataout  => ipmdataout
      );
   ICache1 : Cache_Datapath
      PORT MAP (
         ADDRESS    => DataAddr,
         DATAOUT    => memwritedata,
         MREAD_L    => dM_READ_L,
         MWRITEH_L  => dM_WRITEH_L,
         MWRITEL_L  => dm_writel_l,
         RESET_L    => RESET_L,
         clk        => clk,
         in_IdleHit => d_in_IdleHit,
         in_Load    => d_in_Load,
         pmdatain   => dpmdatain,
         DATAIN     => DataMemIn,
         Dirty      => dDirty,
         Hit        => dHit,
         MRESP_H    => dm_resp_h,
         Miss       => dMiss,
         pmaddress  => dpmaddress,
         pmdataout  => dpmdataout
      );
   DPRAM : Physical_Memory
      PORT MAP (
         RESET_L   => RESET_L,
         clk       => clk,
         pmaddress => dpmaddress,
         pmdataout => dpmdataout,
         pmread_l  => dpmread_l,
         pmwrite_l => dpmwrite_l,
         pmdatain  => dpmdatain,
         pmresp_h  => dpmresp_h
      );
   IPRAM : Physical_Memory
      PORT MAP (
         RESET_L   => RESET_L,
         clk       => clk,
         pmaddress => ipmaddress,
         pmdataout => ipmdataout,
         pmread_l  => ipmread_l,
         pmwrite_l => ipmwrite_l,
         pmdatain  => ipmdatain,
         pmresp_h  => ipmresp_h
      );

END struct;
