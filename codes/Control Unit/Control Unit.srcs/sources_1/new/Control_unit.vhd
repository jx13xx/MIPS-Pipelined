

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Control_unit is
    Port ( 
    opcode : in STD_LOGIC_VECTOR (5 downto 0);
     ALU_op : out STD_LOGIC_VECTOR (1 downto 0);
           Branch,mem_read,mem_write,alu_src,reg_write,mem_to_reg,reg_dst : out std_logic 
           );
end Control_unit;

architecture Behavioral of Control_unit is
begin
process(opcode)
begin
case opcode is 

when "000000" => -- R type
reg_dst <= '1';

branch <= '0';
mem_read <= '0';
mem_to_reg <= '0';
ALU_op <= "10";
mem_write <= '0';
alu_src <= '0';
reg_write <= '1';

when "001000" => --addi
reg_dst <= '0';

branch <= '0';
mem_read <= '0';
mem_to_reg <= '0';
ALU_op <= "00";
mem_write <= '0';
alu_src <= '1';
reg_write <= '1';

when "001111" => --lui
reg_dst <= '0';
branch <= '0';
mem_read <= '0';
mem_to_reg <= '0';
ALU_op <= "11";
mem_write <= '0';
alu_src <= '1';
reg_write <= '1';

when "101011" => --sw
reg_dst <= '0';

branch <= '0';
mem_read <= '0';
mem_to_reg <= '0';
ALU_op <= "00";
mem_write <= '1';
alu_src <= '1';
reg_write <= '0';

when "100011" => --lw
reg_dst <= '0';

branch <= '0';
mem_read <= '1';
mem_to_reg <= '1';
ALU_op <= "00";
mem_write <= '0';
alu_src <= '1';
reg_write <= '1';

when "000100" => --beq
reg_dst <= '0';

branch <= '1';
mem_read <= '0';
mem_to_reg <= '0';
ALU_op <= "01";
mem_write <= '0';
alu_src <= '0';
reg_write <= '0';




when others =>
reg_dst <= '0';

branch <= '0';
mem_read <= '0';
mem_to_reg <= '0';
ALU_op <= "00";
mem_write <= '0';
alu_src <= '0';
reg_write <= '0';


end case ; 
end process ;





end Behavioral;
