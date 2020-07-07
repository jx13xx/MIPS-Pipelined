----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2020 11:40:31 AM
-- Design Name: 
-- Module Name: datamemory - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_unsigned.ALL;
--use ieee.std_logic_arith.ALL;
use ieee.NUMERIC_STD.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datamemory is
    Port ( 
        clk : in std_logic;
        addrs : in STD_LOGIC_VECTOR ( 31 downto 0);
        writeData: out STD_LOGIC_VECTOR(31 downto 0);
        memWrite: in STD_LOGIC;
        memRead: in STD_LOGIC;
        readData: out STD_LOGIC_VECTOR(31 downto 0)); -- read Data from a location specified by the addrs value
      

end datamemory;

architecture Behavioral of datamemory is

type dataFile is array(0 to 15) of std_logic_vector( 31 downto 0); --create an array of words
signal mydata : dataFile := ( others => X"00000000"
   
    
    ); 
    
 
 
      
begin
-- Code begins from here 
-- X1001000

  
process(memRead,memWrite)
begin
if( memRead = '1') then 
    readData <= mydata((to_integer(unsigned(addrs)) - 268500992)/4);
    end if;
    
 if(memWrite = '1') then 
    writeData <= mydata((to_integer(unsigned(addrs)) - 268500992)/4);
 else
    readData <= (others => '0');
  end if;

         
end process;


end Behavioral;
