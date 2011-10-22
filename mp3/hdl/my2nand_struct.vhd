-- VHDL Entity ece411.my2NAND.symbol
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-28.ews.illinois.edu)
--          at - 19:54:18 09/30/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY my2NAND IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      z : OUT    std_logic
   );

-- Declarations

END my2NAND ;

--
-- VHDL Architecture ece411.my2NAND.struct
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-28.ews.illinois.edu)
--          at - 19:54:18 09/30/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF my2NAND IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL O : std_logic;


   -- Component Declarations
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
   FOR ALL : myAND USE ENTITY ece411.myAND;
   FOR ALL : myNOT USE ENTITY ece411.myNOT;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aAND : myAND
      PORT MAP (
         A => A,
         B => B,
         O => O
      );
   U_1 : myNOT
      PORT MAP (
         a     => O,
         a_not => z
      );

END struct;