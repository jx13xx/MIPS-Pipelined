----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2020 11:33:48 AM
-- Design Name: 
-- Module Name: datamemory1 - Behavioral
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
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datamemory1 is
    Port ( address : in STD_LOGIC_VECTOR (31 downto 0);
           WriteData : in STD_LOGIC_VECTOR (31 downto 0);
           ReadData : out STD_LOGIC_VECTOR (31 downto 0);
           MemRead : in STD_LOGIC;
           MemWrite : in STD_LOGIC ;
          clk : in STD_LOGIC
           );
          
end datamemory1;

architecture Behavioral of datamemory1 is

type data_mem is array (0 to 15 ) of std_logic_vector (31 downto 0);
signal mydata: data_mem:= (
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000",
     x"00000000"
 );

 -- 0x10010000
 -- pc = 4
 begin
 datamem:
 process(MemRead,MemWrite)
 variable mem_adr: natural;
 
begin
ReadData <= mydata((to_integer(unsigned(address))-268435456)/4);
if(MemWrite='1') then
mydata((to_integer(unsigned(address))-268435456)/4) <= WriteData;
end if;

end process datamem;
end Behavioral;
