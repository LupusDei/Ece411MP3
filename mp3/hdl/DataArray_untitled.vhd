--Example code for the DataArray within an Cache Way
--Can be easily modified for use with Tag, Valid, and Dirty Arrays

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DataArray IS
   PORT( 
      DataIn     : IN     lc3b_oword;
      DataWrite  : IN     std_logic;
      DirtyWrite : IN     std_logic;
      Index      : IN     lc3b_c_index;
      TagIn      : IN     lc3b_c_tag;
      RESET_L    : IN     std_logic;
      DataOut    : OUT    lc3b_oword;
      TagOut     : OUT    lc3b_c_tag;
      ValidOut   : OUT    std_logic;
      DirtyOut   : OUT    std_logic
   );

-- Declarations

END DataArray ;

--
ARCHITECTURE untitled OF DataArray IS

	TYPE DataArray IS	array (7 downto 0) of LC3b_oword;
	TYPE TagArray IS	array (7 downto 0) of LC3b_C_tag;
	TYPE ValidArray IS array (7 downto 0) of std_logic;
	TYPE DirtyArray IS array (7 downto 0) of std_logic;
	SIGNAL Data : DataArray;
	SIGNAL Tag : TagArray;
	SIGNAL V : ValidArray;
	SIGNAL Dirty : DirtyArray;

	BEGIN
		--------------------------------------------------------------
		ReadFromDataArray : PROCESS (Data,Tag, V, Dirty, Index)
		--------------------------------------------------------------
    
			VARIABLE DataIndex : integer;
			BEGIN
				DataIndex := to_integer(unsigned(Index));
				DataOut <= Data(DataIndex) after 20 ns;
				TagOut <= Tag(DataIndex) after 20 ns;
				ValidOut <= V(DataIndex) after 20 ns;
				DirtyOut <= Dirty(DataIndex) after 20 ns;
		
		END PROCESS ReadFromDataArray;
	
		--------------------------------------------------------------
		WriteToDataArray : PROCESS (RESET_L, Index, DataWrite, DirtyWrite, DataIn, TagIn)
		-------------------------------------------------------	------	
			VARIABLE DataIndex : integer;
			BEGIN
				DataIndex := to_integer(unsigned(Index));
			IF RESET_L = '0' THEN
				Data(0) <= (OTHERS => 'X');
				Data(1) <= (OTHERS => 'X');
				Data(2) <= (OTHERS => 'X');
				Data(3) <= (OTHERS => 'X');
				Data(4) <= (OTHERS => 'X');
				Data(5) <= (OTHERS => 'X');
				Data(6) <= (OTHERS => 'X');
				Data(7) <= (OTHERS => 'X');
				Tag(0) <= (OTHERS => 'X');
				Tag(1) <= (OTHERS => 'X');
				Tag(2) <= (OTHERS => 'X');
				Tag(3) <= (OTHERS => 'X');
				Tag(4) <= (OTHERS => 'X');
				Tag(5) <= (OTHERS => 'X');
				Tag(6) <= (OTHERS => 'X');
				Tag(7) <= (OTHERS => 'X');
				V(0) <= '0';
				V(1) <= '0';
				V(2) <= '0';
				V(3) <= '0';
				V(4) <= '0';
				V(5) <= '0';
				V(6) <= '0';
				V(7) <= '0';
				Dirty(0) <= '0';
				Dirty(1) <= '0';
				Dirty(2) <= '0';
				Dirty(3) <= '0';
				Dirty(4) <= '0';
				Dirty(5) <= '0';
				Dirty(6) <= '0';
				Dirty(7) <= '0';
			END IF;

			IF (DataWrite = '1') THEN
				Data(DataIndex) <= DataIn;
				Tag(DataIndex) <= TagIn;
				V(DataIndex) <= '1';
				Dirty(DataIndex) <= DirtyWrite;
			END IF;
			
		
		END PROCESS WriteToDataArray;

END ARCHITECTURE untitled;
