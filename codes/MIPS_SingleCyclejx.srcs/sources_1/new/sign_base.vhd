----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2020 07:10:10 PM
-- Design Name: 
-- Module Name: sign_base - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sign_base is
    Port ( se_in : in STD_LOGIC_VECTOR (15 downto 0);
           se_out : out STD_LOGIC_VECTOR (31 downto 0));
end sign_base;

architecture Behavioral of sign_base is

begin
    -- concat hex 0000 with se_in if msb is 0 else ...
	se_out <= x"0000" & se_in WHEN se_in(15) = '0'
	          ELSE
	          x"FFFF" & se_in;

end Behavioral;
