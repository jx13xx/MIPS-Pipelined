----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2020 01:27:01 AM
-- Design Name: 
-- Module Name: hazard_unit - Behavioral
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
library UNISIM;
--use UNISIM.VComponents.all;

entity hazard_unit is
Port (
ID_EX_MemRead : in STD_LOGIC;
IF_ID_Rs : in STD_LOGIC_VECTOR (4 downto 0);
IF_ID_Rt : in STD_LOGIC_VECTOR (4 downto 0);
ID_EX_Rt : in STD_LOGIC_VECTOR (4 downto 0);
nop , PCWrite , ID_IF_Write : OUT STD_LOGIC
);

end hazard_unit;

architecture Behavioral of hazard_unit is
begin
process(ID_EX_MemRead,IF_ID_Rt,IF_ID_Rs,ID_EX_Rt)
begin
 if (ID_EX_MemRead = '1') then
if ((IF_ID_Rs = ID_EX_Rt) or (IF_ID_Rt = ID_EX_Rt)) then
nop <= '1';
PCWrite <= '0';
ID_IF_Write <= '0';
end if ;

else
nop <= '0';
PCWrite <= '1';
ID_IF_Write <= '1';
end if ;

end process;
end Behavioral;
