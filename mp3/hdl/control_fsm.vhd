-- VHDL Entity ece411.Control.interface
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-06.ews.illinois.edu)
--          at - 00:16:06 09/15/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Control IS
   PORT( 
      ADDR_0     : IN     std_logic;
      CheckN     : IN     std_logic;
      CheckP     : IN     std_logic;
      CheckZ     : IN     std_logic;
      IMMEDIATE  : IN     std_logic;
      JSRR       : IN     std_logic;
      MRESP_H    : IN     std_logic;
      Opcode     : IN     LC3b_opcode;
      RESET_L    : IN     std_logic;
      SHIFTop    : IN     lc3b_shftop;
      START_H    : IN     std_logic;
      clk        : IN     std_logic;
      n          : IN     std_logic;
      p          : IN     std_logic;
      z          : IN     std_logic;
      ALUMuxSel  : OUT    LC3b_8Mux_Sel;
      ALUop      : OUT    LC3b_aluop;
      ByteExtSel : OUT    std_logic;
      LoadIR     : OUT    std_logic;
      LoadMDR    : OUT    std_logic;
      LoadMar    : OUT    std_logic;
      LoadNZP    : OUT    std_logic;
      LoadPC     : OUT    std_logic;
      MARMuxSel  : OUT    LC3b_4Mux_Sel;
      MDRMuxSel  : OUT    std_logic;
      MREAD_L    : OUT    std_logic;
      MWRITEH_L  : OUT    std_logic;
      MWRITEL_L  : OUT    std_logic;
      PCMuxSel   : OUT    LC3b_8Mux_Sel;
      R7Sel_H    : OUT    std_logic;
      RFMuxSel   : OUT    LC3b_4Mux_Sel;
      RegWrite   : OUT    std_logic;
      StoreSR    : OUT    std_logic
   );

-- Declarations

END Control ;

--
-- VHDL Architecture ece411.Control.fsm
--
-- Created:
--          by - martin43.UNKNOWN (gelib-057-06.ews.illinois.edu)
--          at - 00:16:06 09/15/11
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
 
ARCHITECTURE fsm OF Control IS

   TYPE STATE_TYPE IS (
      RESET,
      L_NOT,
      BR1,
      Decode,
      BR2,
      IF1,
      IF2,
      IF3,
      CalcADDR,
      ST1,
      LD1,
      ST2,
      LD2,
      s0,
      s1,
      Norm_AND,
      Im_AND,
      LEA,
      JMP_RET,
      JSR_offset,
      JSR_register,
      LoadReg7,
      ldb_calcAdr,
      ldb_get,
      calcIndirectAddr,
      i_loadAddr,
      ldi_save,
      i_setAddr,
      ldi_loadVal,
      sti_setVal,
      sti_writeVal,
      byteExtend,
      stb_set,
      stb_write_l,
      stb_write_h,
      shft_state_sll,
      shft_state_srl,
      shft_state_sra,
      trap_pcsave,
      set_trapaddr,
      get_trap,
      set_pc_trap
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
         current_state <= RESET;
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      ADDR_0,
      CheckN,
      CheckP,
      CheckZ,
      IMMEDIATE,
      JSRR,
      MRESP_H,
      Opcode,
      SHIFTop,
      START_H,
      current_state,
      n,
      p,
      z
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN RESET => 
            IF (START_H = '1') THEN 
               next_state <= IF1;
            ELSE
               next_state <= RESET;
            END IF;
         WHEN L_NOT => 
            next_state <= IF1;
         WHEN BR1 => 
            IF (((n AND CheckN) OR
                (p AND CheckP) OR
                (z AND CheckZ)) = '1') THEN 
               next_state <= BR2;
            ELSE
               next_state <= IF1;
            END IF;
         WHEN Decode => 
            IF (Opcode = op_br) THEN 
               next_state <= BR1;
            ELSIF ((Opcode = op_ldr) OR
                   (Opcode = op_str)) THEN 
               next_state <= CalcADDR;
            ELSIF (Opcode = op_not) THEN 
               next_state <= L_NOT;
            ELSIF ((Opcode = op_and) AND (IMMEDIATE = '0')) THEN 
               next_state <= Norm_AND;
            ELSIF ((Opcode = op_and) AND (IMMEDIATE = '1')) THEN 
               next_state <= Im_AND;
            ELSIF ((Opcode = op_add) AND (IMMEDIATE = '0')) THEN 
               next_state <= s0;
            ELSIF ((Opcode = op_add) AND (IMMEDIATE = '1')) THEN 
               next_state <= s1;
            ELSIF (Opcode = op_lea) THEN 
               next_state <= LEA;
            ELSIF ((Opcode = op_jmp) OR
                   (Opcode = op_ret)) THEN 
               next_state <= JMP_RET;
            ELSIF (Opcode = op_jsr) THEN 
               next_state <= LoadReg7;
            ELSIF ((Opcode = op_ldb) OR
                   (Opcode = op_stb)) THEN 
               next_state <= ldb_calcAdr;
            ELSIF ((Opcode = op_ldi) OR
                   (Opcode = op_sti)) THEN 
               next_state <= calcIndirectAddr;
            ELSIF ((Opcode = op_shf) AND (SHIFTop = shft_sll)) THEN 
               next_state <= shft_state_sll;
            ELSIF ((Opcode = op_shf) AND (SHIFTop = shft_srl)) THEN 
               next_state <= shft_state_srl;
            ELSIF ((Opcode = op_shf) AND (SHIFTop = shft_sra)) THEN 
               next_state <= shft_state_sra;
            ELSIF (Opcode = op_trap) THEN 
               next_state <= trap_pcsave;
            ELSE
               next_state <= IF1;
            END IF;
         WHEN BR2 => 
            next_state <= IF1;
         WHEN IF1 => 
            next_state <= IF2;
         WHEN IF2 => 
            IF (MRESP_H = '1') THEN 
               next_state <= IF3;
            ELSE
               next_state <= IF2;
            END IF;
         WHEN IF3 => 
            next_state <= Decode;
         WHEN CalcADDR => 
            IF (Opcode = op_str) THEN 
               next_state <= ST1;
            ELSIF (Opcode = op_ldr) THEN 
               next_state <= LD1;
            ELSE
               next_state <= CalcADDR;
            END IF;
         WHEN ST1 => 
            next_state <= ST2;
         WHEN LD1 => 
            IF (MRESP_H = '1') THEN 
               next_state <= LD2;
            ELSE
               next_state <= LD1;
            END IF;
         WHEN ST2 => 
            IF (MRESP_H = '1') THEN 
               next_state <= IF1;
            ELSE
               next_state <= ST2;
            END IF;
         WHEN LD2 => 
            next_state <= IF1;
         WHEN s0 => 
            next_state <= IF1;
         WHEN s1 => 
            next_state <= IF1;
         WHEN Norm_AND => 
            next_state <= IF1;
         WHEN Im_AND => 
            next_state <= IF1;
         WHEN LEA => 
            next_state <= IF1;
         WHEN JMP_RET => 
            next_state <= IF1;
         WHEN JSR_offset => 
            next_state <= IF1;
         WHEN JSR_register => 
            next_state <= IF1;
         WHEN LoadReg7 => 
            IF (JSRR = '0') THEN 
               next_state <= JSR_register;
            ELSIF (JSRR = '1') THEN 
               next_state <= JSR_offset;
            ELSE
               next_state <= LoadReg7;
            END IF;
         WHEN ldb_calcAdr => 
            IF (Opcode = op_ldb) THEN 
               next_state <= ldb_get;
            ELSIF (Opcode = op_stb) THEN 
               next_state <= stb_set;
            ELSE
               next_state <= ldb_calcAdr;
            END IF;
         WHEN ldb_get => 
            IF (MRESP_H = '1') THEN 
               next_state <= byteExtend;
            ELSE
               next_state <= ldb_get;
            END IF;
         WHEN calcIndirectAddr => 
            next_state <= i_loadAddr;
         WHEN i_loadAddr => 
            IF (MRESP_H = '1') THEN 
               next_state <= i_setAddr;
            ELSE
               next_state <= i_loadAddr;
            END IF;
         WHEN ldi_save => 
            next_state <= IF1;
         WHEN i_setAddr => 
            IF (Opcode = op_ldi) THEN 
               next_state <= ldi_loadVal;
            ELSIF (Opcode = op_sti) THEN 
               next_state <= sti_setVal;
            ELSE
               next_state <= i_setAddr;
            END IF;
         WHEN ldi_loadVal => 
            IF (MRESP_H = '1') THEN 
               next_state <= ldi_save;
            ELSE
               next_state <= ldi_loadVal;
            END IF;
         WHEN sti_setVal => 
            next_state <= sti_writeVal;
         WHEN sti_writeVal => 
            IF (MRESP_H = '1') THEN 
               next_state <= IF1;
            ELSE
               next_state <= sti_writeVal;
            END IF;
         WHEN byteExtend => 
            next_state <= IF1;
         WHEN stb_set => 
            IF (ADDR_0 = '0') THEN 
               next_state <= stb_write_l;
            ELSIF (ADDR_0 = '1') THEN 
               next_state <= stb_write_h;
            ELSE
               next_state <= stb_set;
            END IF;
         WHEN stb_write_l => 
            IF (MRESP_H = '1') THEN 
               next_state <= IF1;
            ELSE
               next_state <= stb_write_l;
            END IF;
         WHEN stb_write_h => 
            IF (MRESP_H = '1') THEN 
               next_state <= IF1;
            ELSE
               next_state <= stb_write_h;
            END IF;
         WHEN shft_state_sll => 
            next_state <= IF1;
         WHEN shft_state_srl => 
            next_state <= IF1;
         WHEN shft_state_sra => 
            next_state <= IF1;
         WHEN trap_pcsave => 
            next_state <= set_trapaddr;
         WHEN set_trapaddr => 
            next_state <= get_trap;
         WHEN get_trap => 
            IF (MRESP_H = '1') THEN 
               next_state <= set_pc_trap;
            ELSE
               next_state <= get_trap;
            END IF;
         WHEN set_pc_trap => 
            next_state <= IF1;
         WHEN OTHERS =>
            next_state <= RESET;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      ALUMuxSel <= "000";
      ALUop <= "000";
      ByteExtSel <= '0';
      LoadIR <= '0';
      LoadMDR <= '0';
      LoadMar <= '0';
      LoadNZP <= '0';
      LoadPC <= '0';
      MARMuxSel <= "00";
      MDRMuxSel <= '0';
      MREAD_L <= '1';
      MWRITEH_L <= '1';
      MWRITEL_L <= '1';
      PCMuxSel <= "000";
      R7Sel_H <= '0';
      RFMuxSel <= "00";
      RegWrite <= '0';
      StoreSR <= '1';

      -- Combined Actions
      CASE current_state IS
         WHEN L_NOT => 
            ALUop <= alu_not;
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "01";
         WHEN BR2 => 
            PCMuxSel <= "001";
            LoadPC <= '1';
         WHEN IF1 => 
            LoadMAR <= '1';
            LoadPC <= '1';
         WHEN IF2 => 
            LoadMDR <= '1';
            MREAD_L <= '0' after 6 ns;
         WHEN IF3 => 
            LoadIR <= '1';
         WHEN CalcADDR => 
            ALUMuxSel <= "001";
            ALUop <= alu_add;
            MARMuxSel <= "01";
            LoadMAR <= '1';
         WHEN ST1 => 
            StoreSR <= '0';
            ALUop <= alu_pass;
            LoadMDR <= '1';
            MDRMuxSel <= '1';
         WHEN LD1 => 
            LoadMDR <= '1';
            MREAD_L <= '0' after 6ns;
         WHEN ST2 => 
            MWRITEL_L <= '0' after 6ns;
            MWRITEH_L <= '0' after 6ns;
         WHEN LD2 => 
            RegWrite <= '1';
            LoadNZP <= '1';
         WHEN s0 => 
            ALUop <= alu_add;
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "01";
         WHEN s1 => 
            ALUop <= alu_add;
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "01";
            ALUMuxSel <= "010";
         WHEN Norm_AND => 
            ALUop <= alu_and;
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "01";
         WHEN Im_AND => 
            ALUop <= alu_and;
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "01";
            ALUMuxSel <= "010";
         WHEN LEA => 
            RegWrite <= '1';
            LoadNZP <= '1';
            RFMuxSel <= "10";
         WHEN JMP_RET => 
            PCMuxSel <= "010";
            LoadPC <= '1';
         WHEN JSR_offset => 
            PCMuxSel <= "011";
            LoadPC <= '1';
         WHEN JSR_register => 
            PCMuxSel <= "010";
            LoadPC <= '1';
         WHEN LoadReg7 => 
            R7Sel_H <= '1';
            RFMuxSel <= "11";
            RegWrite <= '1';
         WHEN ldb_calcAdr => 
            ALUMuxSel <= "011";
            ALUop <= alu_add;
            MARMuxSel <= "01";
            LoadMar <= '1';
         WHEN ldb_get => 
            LoadMDR <= '1';
            MREAD_L <= '0' after 6ns;
         WHEN calcIndirectAddr => 
            ALUMuxSel <= "001";
            ALUop <= alu_add;
            MARMuxSel <= "01";
            LoadMAR <= '1';
         WHEN i_loadAddr => 
            LoadMDR <= '1';
            MREAD_L <= '0' after 6ns;
         WHEN ldi_save => 
            RegWrite <= '1';
            LoadNZP <= '1';
         WHEN i_setAddr => 
            MARMuxSel <= "10";
            LoadMAR <= '1';
         WHEN ldi_loadVal => 
            LoadMDR <= '1';
            MREAD_L <= '0' after 6ns;
         WHEN sti_setVal => 
            StoreSR <= '0';
            ALUop <= alu_pass;
            LoadMDR <= '1';
            MDRMuxSel <= '1';
         WHEN sti_writeVal => 
            MWRITEL_L <= '0' after 6ns;
            MWRITEH_L <= '0' after 6ns;
         WHEN byteExtend => 
            ByteExtSel <= '1';
            RegWrite <= '1';
            LoadNZP <= '1';
         WHEN stb_set => 
            ALUop <= alu_pass;
            LoadMDR <= '1';
            MDRMuxSel <= '1';
            StoreSr <= '0';
            ByteExtSel <= '1';
         WHEN stb_write_l => 
            MWRITEL_L <= '0' after 6ns;
         WHEN stb_write_h => 
            MWRITEH_L <= '0' after 6ns;
         WHEN shft_state_sll => 
            ALUMuxSel <= "100";
            ALUop <= alu_sll;
            RegWrite <= '1';
            RFMuxSel <= "01";
            LoadNZP <= '1';
         WHEN shft_state_srl => 
            ALUMuxSel <= "100";
            ALUop <= alu_srl;
            RegWrite <= '1';
            RFMuxSel <= "01";
            LoadNZP <= '1';
         WHEN shft_state_sra => 
            ALUMuxSel <= "100";
            ALUop <= alu_sra;
            RegWrite <= '1';
            RFMuxSel <= "01";
            LoadNZP <= '1';
         WHEN trap_pcsave => 
            RFMuxSel <= "11";
            R7Sel_H <= '1';
            RegWrite <= '1';
         WHEN set_trapaddr => 
            MARMuxSel <= "11";
            LoadMAR <= '1';
         WHEN get_trap => 
            LoadMDR <= '1';
            MREAD_L <= '0' after 6ns;
         WHEN set_pc_trap => 
            PCMuxSel <= "100";
            LoadPC <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
