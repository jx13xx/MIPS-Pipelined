

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity InstructionMemory is
    Port (
        addr : in STD_LOGIC_VECTOR (31 downto 0);
        inst : out STD_LOGIC_VECTOR (31 downto 0)
        
        );
end InstructionMemory;

architecture Behavioral of InstructionMemory is
    begin 
        inst_mem:
            process(addr)
            subtype word is std_logic_vector(31 downto 0);
            type mem_array is array(natural range <>) of word;
            
            variable memory: mem_array(0 to 15) := 
                    (x"20080005", -- addi $t0, $zero, 5 # store 5 as our first number 
                     x"20090007", -- addi $t1, $zero, 7 # store 7 as our second number 
                     x"00005020", -- add $t2, $zero, $zero # the answer spot is cleared 
                     x"3c0b1000", -- lui $t3, 0x1000 # memory data top two bytes 
                     x"200c0001", -- addi $t4, $zero, 1 # save temp value 1 
                     x"00006820", -- add $t5, $zero, $zero # loop flag 
                     x"ad6a0000", -- sw $t2, 0 ($t3) # store answer to memory 
                     x"8d6a0000", -- lw $t2, 0 ($t3) # load the current answer 
                     
                    
                     x"014b6824", -- and $t5, $t2, $t3 # no purpose - just a pipeline hazard 
                     x"014b6825", -- or $t5, $t2, $t3 # no purpose - just a pipeline hazard 
                     x"01485020", -- add $t2, $t2, $t0 # add first number to it 
                     x"012c4822", -- sub $t1, $t1, $t4 # decrement second number 
                     x"216b0004", -- addi $t3, $t3, 4 # next memory data location 
                     x"ad6a0000", -- sw $t2, 0 ($t3) # store answer to memory 
                     x"012c682a", -- slt $t5, $t1, $t4 # set the loop flag if second number 
                     x"11a0fff8"  -- loop
                     --x"20080005"
                     );
                     variable word_addr : natural;
                begin
                
                word_addr := conv_integer(addr(31 downto 2));
                inst <= memory(word_addr);
                
                end process inst_mem;
            
            
   
end architecture Behavioral;
