----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2020 02:03:19 PM
-- Design Name: 
-- Module Name: regfile - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity regfile is
    Port ( readreg1 : in STD_LOGIC_VECTOR (4 downto 0);
           readreg2 : in STD_LOGIC_VECTOR (4 downto 0);
           writereg : in STD_LOGIC_VECTOR (4 downto 0);
           writedata : in STD_LOGIC_VECTOR (31 downto 0);
           regwrite : in STD_LOGIC;
           clk : in STD_LOGIC;
           data1 : out STD_LOGIC_VECTOR (31 downto 0);
           data2 : out STD_LOGIC_VECTOR (31 downto 0));
end regfile;

architecture Behavioral of regfile is
type registerFile is array(0 to 31) of std_logic_vector(31 downto 0);
signal registers : registerFile; 
begin
data1 <= registers(to_integer(unsigned(readreg1)));
data2 <= registers(to_integer(unsigned(readreg2)));

process (clk) is
begin
if rising_edge(clk) then
if regwrite = '1' then
registers(to_integer(unsigned(writereg))) <= writedata ;
end if;
end if;

end process;
end Behavioral;
