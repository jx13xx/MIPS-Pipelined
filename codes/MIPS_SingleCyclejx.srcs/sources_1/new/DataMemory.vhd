library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity DataMemory is
    Port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
           WriteData : in STD_LOGIC_VECTOR (31 downto 0);
           MemRead : in STD_LOGIC;
           MemWrite : in STD_LOGIC;
           clk : in STD_LOGIC;
           ReadData : out STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is

    type data_mem is array (0 to 15) of STD_LOGIC_VECTOR(31 downto 0);
    
    signal mydata : data_mem := (others => (others => '0'));
--    signal mydata : data_mem := (
    
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000",
--    X"00000000"
    
    
    
--    );
    

begin
    ReadData <= mydata((to_integer(unsigned(Address)) - 268500992 )/4) when MemRead= '1'  else X"00000000"; -- first address
   
    process(clk,MemWrite, MemRead)
    begin
        
         
        if(MemWrite = '1') then 
             mydata(  ( to_integer(unsigned(Address)) - 268500992)/4 ) <= WriteData;
             end if;
         IF (MemRead = '1') THEN
                         ReadData <= mydata((to_integer(unsigned(Address)) - 268500992)/4);
                     END IF;
         
         
         --ReadData <= mydata(  ( to_integer(unsigned(Address)) - 268500992 )/4 ) when MemRead = '1');
        end process;

end Behavioral;



























