-- VHDL Entity ece411.CU.interface
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-20.ews.illinois.edu)
--          at - 23:39:33 11/17/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CU IS
   PORT( 
      CLK         : IN     std_logic;
      DM_RESP_H   : IN     std_logic;
      EX_C_Out    : IN     lc3b_word;
      ID_C_Out    : IN     lc3b_word;
      MEM_C_Out   : IN     lc3b_word;
      RESET_L     : IN     std_logic;
      im_resp_h   : IN     std_logic;
      instOut     : IN     lc3b_word;
      EX_C_In     : OUT    lc3b_word;
      ID_C_In     : OUT    lc3b_word;
      IF_C_In     : OUT    lc3b_word;
      MEM_C_In    : OUT    lc3b_word;
      WB_C_In     : OUT    lc3b_word;
      dm_read_l   : OUT    std_logic;
      dm_writeh_l : OUT    std_logic;
      dm_writel_l : OUT    std_logic;
      im_read_l   : OUT    std_logic;
      im_writeh_l : OUT    std_logic;
      im_writel_l : OUT    std_logic
   );

-- Declarations

END CU ;

--
-- VHDL Architecture ece411.CU.struct
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-20.ews.illinois.edu)
--          at - 23:39:33 11/17/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF CU IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ex_c     : lc3b_word;
   SIGNAL forwardA : std_logic_vector(1 DOWNTO 0);
   SIGNAL forwardB : std_logic_vector(1 DOWNTO 0);
   SIGNAL mem_c    : lc3b_word;
   SIGNAL storeSel : std_logic_vector(1 DOWNTO 0);
   SIGNAL wb_c     : lc3b_word;

   -- Implicit buffer signal declarations
   SIGNAL EX_C_In_internal   : lc3b_word;
   SIGNAL MEM_C_In_internal  : lc3b_word;
   SIGNAL im_read_l_internal : std_logic;


   -- Component Declarations
   COMPONENT EX_C_REG
   PORT (
      CLK     : IN     std_logic ;
      RESET_L : IN     std_logic ;
      ex_c    : IN     lc3b_word ;
      EX_C_In : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT EX_C_UNIT
   PORT (
      forwardA : IN     std_logic_vector (1 DOWNTO 0);
      forwardB : IN     std_logic_vector (1 DOWNTO 0);
      instOut  : IN     lc3b_word ;
      storeSel : IN     std_logic_vector (1 DOWNTO 0);
      ex_c     : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT ForwardingUnit
   PORT (
      EX_C_In  : IN     lc3b_word ;
      ID_C_Out : IN     lc3b_word ;
      MEM_C_In : IN     lc3b_word ;
      forwardA : OUT    std_logic_vector (1 DOWNTO 0);
      forwardB : OUT    std_logic_vector (1 DOWNTO 0);
      storeSel : OUT    std_logic_vector (1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT ID_C_UNIT
   PORT (
      instOut : IN     lc3b_word ;
      ID_C_In : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT IF_C_UNIT
   PORT (
      CLK       : IN     std_logic ;
      MEM_C_Out : IN     lc3b_word ;
      RESET_L   : IN     std_logic ;
      im_resp_h : IN     std_logic ;
      IF_C_In   : OUT    lc3b_word ;
      im_read_l : INOUT  std_logic 
   );
   END COMPONENT;
   COMPONENT MEM_C_REG
   PORT (
      CLK         : IN     std_logic ;
      RESET_L     : IN     std_logic ;
      mem_c       : IN     lc3b_word ;
      MEM_C_In    : OUT    lc3b_word ;
      dm_read_l   : OUT    std_logic ;
      dm_writeh_l : OUT    std_logic ;
      dm_writel_l : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT MEM_C_UNIT
   PORT (
      instOut : IN     lc3b_word ;
      mem_c   : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT WB_C_REG
   PORT (
      CLK     : IN     std_logic ;
      RESET_L : IN     std_logic ;
      wb_c    : IN     lc3b_word ;
      WB_C_In : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT WB_C_UNIT
   PORT (
      instOut : IN     lc3b_word ;
      wb_c    : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT writeHigh
   PORT (
      im_writeh_l : OUT    std_logic ;
      im_writel_l : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : EX_C_REG USE ENTITY ece411.EX_C_REG;
   FOR ALL : EX_C_UNIT USE ENTITY ece411.EX_C_UNIT;
   FOR ALL : ForwardingUnit USE ENTITY ece411.ForwardingUnit;
   FOR ALL : ID_C_UNIT USE ENTITY ece411.ID_C_UNIT;
   FOR ALL : IF_C_UNIT USE ENTITY ece411.IF_C_UNIT;
   FOR ALL : MEM_C_REG USE ENTITY ece411.MEM_C_REG;
   FOR ALL : MEM_C_UNIT USE ENTITY ece411.MEM_C_UNIT;
   FOR ALL : WB_C_REG USE ENTITY ece411.WB_C_REG;
   FOR ALL : WB_C_UNIT USE ENTITY ece411.WB_C_UNIT;
   FOR ALL : writeHigh USE ENTITY ece411.writeHigh;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   EX_creg : EX_C_REG
      PORT MAP (
         CLK     => CLK,
         RESET_L => RESET_L,
         ex_c    => ex_c,
         EX_C_In => EX_C_In_internal
      );
   EX_GUNIT : EX_C_UNIT
      PORT MAP (
         forwardA => forwardA,
         forwardB => forwardB,
         instOut  => instOut,
         storeSel => storeSel,
         ex_c     => ex_c
      );
   Forwardinator : ForwardingUnit
      PORT MAP (
         EX_C_In  => EX_C_In_internal,
         ID_C_Out => ID_C_Out,
         MEM_C_In => MEM_C_In_internal,
         forwardA => forwardA,
         forwardB => forwardB,
         storeSel => storeSel
      );
   ID_GUNIT : ID_C_UNIT
      PORT MAP (
         instOut => instOut,
         ID_C_In => ID_C_In
      );
   IF_GUNIT : IF_C_UNIT
      PORT MAP (
         CLK       => CLK,
         MEM_C_Out => MEM_C_Out,
         RESET_L   => RESET_L,
         im_resp_h => im_resp_h,
         IF_C_In   => IF_C_In,
         im_read_l => im_read_l_internal
      );
   MEM_creg : MEM_C_REG
      PORT MAP (
         CLK         => CLK,
         RESET_L     => RESET_L,
         mem_c       => mem_c,
         MEM_C_In    => MEM_C_In_internal,
         dm_read_l   => dm_read_l,
         dm_writeh_l => dm_writeh_l,
         dm_writel_l => dm_writel_l
      );
   MEM_GUNIT : MEM_C_UNIT
      PORT MAP (
         instOut => instOut,
         mem_c   => mem_c
      );
   WB_creg : WB_C_REG
      PORT MAP (
         CLK     => CLK,
         RESET_L => RESET_L,
         wb_c    => wb_c,
         WB_C_In => WB_C_In
      );
   WB_GUNIT : WB_C_UNIT
      PORT MAP (
         instOut => instOut,
         wb_c    => wb_c
      );
   imwriter : writeHigh
      PORT MAP (
         im_writeh_l => im_writeh_l,
         im_writel_l => im_writel_l
      );

   -- Implicit buffered output assignments
   EX_C_In   <= EX_C_In_internal;
   MEM_C_In  <= MEM_C_In_internal;
   im_read_l <= im_read_l_internal;

END struct;
