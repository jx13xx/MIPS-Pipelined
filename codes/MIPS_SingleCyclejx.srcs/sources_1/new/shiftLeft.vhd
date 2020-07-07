
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

   

entity shiftLeft is

    generic( 
        N : INTEGER := 2;
        W : INTEGER  := 32
       );
       
    PORT (
               input1  : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
               output1 : OUT STD_LOGIC_VECTOR(W - 1 DOWNTO 0)
           );

end shiftLeft;

architecture Behavioral of shiftLeft is

begin
    
    output1(W - 1) <= input1(W - 1);
	output1(W - 2 DOWNTO N) <= input1(W - 2 - N DOWNTO 0);
	output1(N - 1 DOWNTO 0) <= (OTHERS => '0');

end Behavioral;














