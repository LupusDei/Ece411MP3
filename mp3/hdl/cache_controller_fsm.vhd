-- VHDL Entity ece411.Cache_Controller.interface
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-26.ews.illinois.edu)
--          at - 15:45:35 10/05/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Cache_Controller IS
   PORT( 
      Dirty      : IN     std_logic;
      Hit        : IN     std_logic;
      Miss       : IN     std_logic;
      RESET_L    : IN     std_logic;
      clk        : IN     std_logic;
      pmresp_h   : IN     std_logic;
      in_IdleHit : OUT    std_logic;
      in_Load    : OUT    std_logic;
      pmread_l   : OUT    std_logic;
      pmwrite_l  : OUT    std_logic
   );

-- Declarations

END Cache_Controller ;

--
-- VHDL Architecture ece411.Cache_Controller.fsm
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-26.ews.illinois.edu)
--          at - 15:45:35 10/05/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
 
ARCHITECTURE fsm OF Cache_Controller IS

   TYPE STATE_TYPE IS (
      IdleHit,
      Load,
      WriteBack
   );
 
   -- State vector declaration
   ATTRIBUTE state_vector : string;
   ATTRIBUTE state_vector OF fsm : ARCHITECTURE IS "current_state";

   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      RESET_L
   )
   -----------------------------------------------------------------
   BEGIN
      IF (RESET_L = '0') THEN
         current_state <= IdleHit;
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      Dirty,
      Miss,
      current_state,
      pmresp_h
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN IdleHit => 
            IF ((Miss = '1') AND
                (Dirty = '0')) THEN 
               next_state <= Load;
            ELSIF ((Miss = '1') AND
                   (Dirty = '1')) THEN 
               next_state <= WriteBack;
            ELSE
               next_state <= IdleHit;
            END IF;
         WHEN Load => 
            IF (pmresp_h = '1') THEN 
               next_state <= IdleHit;
            ELSE
               next_state <= Load;
            END IF;
         WHEN WriteBack => 
            IF (pmresp_h = '1') THEN 
               next_state <= Load;
            ELSE
               next_state <= WriteBack;
            END IF;
         WHEN OTHERS =>
            next_state <= IdleHit;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      in_IdleHit <= '0';
      in_Load <= '0';
      pmread_l <= '1';
      pmwrite_l <= '1';

      -- Combined Actions
      CASE current_state IS
         WHEN IdleHit => 
            in_IdleHit <= '1';
         WHEN Load => 
            pmread_l <= '0' after 6ns;
            in_Load <= '1';
         WHEN WriteBack => 
            pmwrite_l <= '0';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
