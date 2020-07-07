
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity RegisterFile is
   
    Generic( 
        B: integer := 32; -- number of bits
        W: integer := 5 -- number of address bits
        );

 Port (
    ReadRegister1 : in STD_LOGIC_VECTOR(4 downto 0); -- Read Register 1
    ReadRegister2 : in STD_LOGIC_VECTOR(4 downto 0); -- Read Register 2 
    WriteRegister : in STD_LOGIC_VECTOR(4 downto 0); -- Write Register 
    WriteData: in STD_LOGIC_VECTOR(31 downto 0); -- Write Data 
    RegWrite : in STD_LOGIC;
    ReadData1: out STD_LOGIC_VECTOR(31 downto 0); -- Data 1
    ReadData2: out STD_LOGIC_VECTOR(31 downto 0); -- Data 2
    clk : in STD_LOGIC
    
  );
end RegisterFile;

architecture Behavioral of RegisterFile is 
 
 type registerFile is array(0 to 31) of std_logic_vector(31 downto 0);  
 --signal registers : registerFile := (others => (others => '0'));

SIGNAL array_reg : registerFile := (
		x"00000000", --$zero
		x"11111111", --$at
		x"22222222", --$v0
		x"33333333", --$v1
		x"44444444", --$a0
		x"55555555", --$a1
		x"66666666", --$a2
		x"77777777", --$a3
		x"88888888", --$t0
		x"99999999", --$t1
		x"aaaaaaaa", --$t2
		x"bbbbbbbb", --$t3
		x"cccccccc", --$t4
		x"dddddddd", --$t5
		x"eeeeeeee", --$t6
		x"ffffffff", --$t7
		x"00000000", --$s0
		x"11111111", --$s1
		x"22222222", --$s2
		x"33333333", --$s3
		x"44444444", --$s4
		x"55555555", --$s5
		x"66666666", --$s6
		x"77777777", --$s7
		x"88888888", --$t8
		x"99999999", --$t9
		x"aaaaaaaa", --$k0
		x"bbbbbbbb", --$k1
		x"10008000", --$global pointer
		x"7FFFF1EC", --$stack pointer
		x"eeeeeeee", --$frame pointer
		x"ffffffff" --$return address
	);
 
 
BEGIN

        ReadData1 <= array_reg(to_integer(unsigned(ReadRegister1)));
        ReadData2 <= array_reg(to_integer(unsigned(ReadRegister2)));
        PROCESS (RegWrite,clk) -- pulse on write
        BEGIN
            -- writeRegister is the register which we want to write to
            -- writeData is the data which we dant to save
            IF (RegWrite = '1') THEN
                array_reg(to_integer(unsigned(writeRegister))) <= WriteData;
            END IF;
        END PROCESS;
        -- read port
       
    END Behavioral;
--    begin 
 
       
--     process (clk,RegWrite) is                  
--     begin 
 
--     if rising_edge(clk) then             
--        if RegWrite = '1' then                
--         registers(to_integer(unsigned(WriteRegister))) <= WriteData;            
--          end if;                   
--        end if;             
        
--         end process; 
--  ReadData1 <= registers(to_integer(unsigned(ReadRegister1)));     
--  ReadData2 <= registers(to_integer(unsigned(ReadRegister2)));     
--end Behavioral; 







