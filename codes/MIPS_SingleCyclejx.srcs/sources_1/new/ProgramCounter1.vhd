----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 04:31:33 PM
-- Design Name: 
-- Module Name: ProgramCounter1 - Behavioral
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



entity ProgramCounter1 is
    Port ( programCounterIn : in STD_LOGIC_VECTOR (31 downto 0);
           programCounterOut : out STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter1;

architecture Behavioral of ProgramCounter1 is

begin

    programCounterOut <= programCounterIn;


end Behavioral;
