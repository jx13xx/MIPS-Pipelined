


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;



entity Controller is
     Port ( 
     OpCode : in STD_LOGIC_VECTOR(5 downto 0);  -- Instructions 31-26
     RegDst : out STD_LOGIC;
     Jump   : out STD_LOGIC;
     Branch : out STD_LOGIC;
     MemRead : out STD_LOGIC;
     MemToReg: out STD_LOGIC;
     ALUOp : out STD_LOGIC_VECTOR(1 downto 0);
     MemWrite: out STD_LOGIC;
     ALUSrc: out STD_LOGIC;
     RegWrite: out STD_LOGIC
     
     );
end Controller;

architecture Behavioral of Controller is

begin

    process(OpCode)
    begin 
    
        regWrite <= '0'; --Deassert for next command
            CASE opcode IS
                WHEN "000000" => -- and, or, add, sub, slt: 0x00
                    RegDst        <= '1';
                    Jump          <= '0';
                    Branch        <= '0';
                    MemRead       <= '0';
                    MemToReg <= '0';
                    ALUOp         <= "10";
                    MemWrite      <= '0';
                    ALUSrc        <= '0';
                    RegWrite      <= '1' AFTER 10 ns;
                WHEN "100011" => -- load word(lw): 0x23
                    RegDst        <= '0';
                    Jump          <= '0';
                    Branch        <= '0';
                    MemRead       <= '1';
                    MemToReg       <= '1';
                    ALUOp         <= "00";
                    MemWrite       <= '0';
                    ALUSrc        <= '1';
                    RegWrite      <= '1' AFTER 10 ns;
                WHEN "101011" => -- store word(beq): 0x2B
                    RegDst        <= '0'; -- don't care
                    Jump           <= '0';
                    Branch        <= '0' AFTER 2 ns;
                    MemRead      <= '0';
                    MemToReg <= '0'; -- don't care
                    ALUOp        <= "00";
                    MemWrite      <= '1';
                    ALUSrc        <= '1';
                    RegWrite      <= '0';
                WHEN "000100" => -- branch equal(beq): 0x04
                    RegDst        <= '0'; -- don't care
                    Jump         <= '0';
                    Branch        <= '1' AFTER 2 ns;
                    MemRead       <= '0';
                    MemToReg <= '0'; -- don't care
                    ALUOp         <= "01";
                    MemWrite      <= '0';
                    ALUSrc        <= '0';
                    RegWrite      <= '0';
                WHEN "000010" => -- jump(j): 0x02
                    RegDst        <= '0';
                    Jump           <= '1';
                    Branch        <= '0';
                    MemRead       <= '0';
                    MemToReg <= '0';
                    ALUOp         <= "00";
                    MemWrite      <= '0';
                    ALUSrc        <= '0';
                    RegWrite      <= '0';
                WHEN OTHERS => NULL; --implement other commands down here
                    RegDst        <= '0';
                    Jump          <= '0';
                    Branch        <= '0';
                    MemRead       <= '0';
                    MemToReg <= '0';
                    ALUOp         <= "00";
                    MemWrite      <= '0';
                    ALUSrc        <= '0';
                    RegWrite      <= '0';
            END CASE;
        END PROCESS;
    END Behavioral;