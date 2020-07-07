


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramCounterAdder is
    Port ( 
    
          programCounterIn : IN STD_LOGIC_VECTOR (31 downto 0);
          programCounterOut :OUT STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounterAdder;

architecture Behavioral of ProgramCounterAdder is

begin

addpro : process(programCounterIn)
begin 

    programCounterOut <= programCounterIn + 4;
 
 
end process addpro;

end Behavioral;
