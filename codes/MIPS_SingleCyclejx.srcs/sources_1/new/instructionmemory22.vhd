library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.ALL;
entity InstructionMemory is
 port(
 addr : in std_logic_vector ( 31 downto 0 );
 inst : out std_logic_vector ( 31 downto 0 ));
end InstructionMemory ;
architecture behavior of InstructionMemory is
 begin
 inst_mem:
 process(addr)
 subtype word is std_logic_vector(31 downto 0);
 type mem_array is array(natural range <>) of word;
 variable memory: mem_array(0 to 16) := 
 (X"20080005", -- addi $t0, $zero, 5
 
 

 X"00000000"); -- empty instruction
 variable word_addr : natural;
 begin
 word_addr := conv_integer(addr(31 downto 2));
 inst <= memory(word_addr);
 end process inst_mem;
 end architecture behavior;