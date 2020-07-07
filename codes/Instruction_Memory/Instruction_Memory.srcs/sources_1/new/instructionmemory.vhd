


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using


entity instructionmemory is
    Port ( addr : in STD_LOGIC_VECTOR (31 downto 0);
           inst : out STD_LOGIC_VECTOR (31 downto 0));
end instructionmemory;

architecture Behavioral of instructionmemory is
 begin
 inst_mem:
 process(addr)
 subtype word is std_logic_vector(31 downto 0);
 type mem_array is array(natural range <>) of word;
 variable memory: mem_array(0 to 16) := ( 
 X"20080005",           
 X"20090007",         
 X"00005020",     
 X"3c0b1000",       
 X"200c0001",     
 X"00006820",     
 X"ad6a0000",    
 X"8d6a0000",        
 X"014b6824",    
 X"014b6825",         
 X"01485020",      
 X"012c4822",       
 X"216b0004",       
 X"ad6a0000",        
 X"012c682a",         
 X"11a0fff8",
 X"00000000"
);
variable word_addr : natural;
begin
 word_addr := conv_integer(addr(31 downto 2));
 inst <= memory(word_addr);
 end process inst_mem;

end Behavioral;
