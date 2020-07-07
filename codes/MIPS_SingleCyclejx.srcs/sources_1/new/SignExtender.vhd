
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SignExtender is
  Port (
        se_in : in  STD_LOGIC_VECTOR(15 downto 0 ); -- 16 bit
        se_out: out STD_LOGIC_VECTOR(31 downto 0) -- 32 bit out
   );
end SignExtender;

architecture Behavioral of SignExtender is

begin
  -- so x means 4 so when it says x"0000" it means 16 bits
  -- and also when se_in 16 bit is 0 then we set the value for se_out 
  -- othewise the false statement
   se_out <= x"0000" & se_in when se_in(15) = '0' else
            x"FFFF" & se_in;

end Behavioral;
