
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity programCounterAdder is
    Port ( 
    
        programCounterIn : in STD_LOGIC_VECTOR (31 downto 0);
        programCounterOut : out STD_LOGIC_VECTOR (31 downto 0));
end programCounterAdder;

architecture Behavioral of programCounterAdder is

begin
    process(programCounterIn)
     begin   
        programCounterOut <= programCounterIn +4;

     end process;
end Behavioral;
