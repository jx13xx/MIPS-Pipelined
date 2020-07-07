library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;


entity AluControl is
    Port ( funct : in STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in STD_LOGIC_VECTOR (1 downto 0);
           Operation : out STD_LOGIC_VECTOR (2 downto 0));
end AluControl;

architecture Behavioral of AluControl is

begin
process(ALUOp,funct)
begin
case ALUOp is
when "00" => 
 Operation <= funct(2 downto 0);
when "01" => 
 Operation <= "001";
when "10" => 
 Operation <= "100";
when "11" => 
 Operation <= "000";
when others => Operation <= "000";
end case;
end process;
    --define the operations
--    Operation(3)  <= '0';
--    Operation(2) <= ALUOp(0) or (ALUOp(1) and funct(1));
    
--    Operation(1) <= not ALUOp(1) or not funct(2);
--    Operation(0) <= (funct(3) or funct(0)) and ALUOp(1);


end Behavioral;
