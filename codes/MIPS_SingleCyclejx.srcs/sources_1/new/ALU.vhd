


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity ALU is
    Port ( 
    a : in STD_LOGIC_VECTOR (31 downto 0);
    b : in STD_LOGIC_VECTOR (31 downto 0);
    aluctl : in STD_LOGIC_VECTOR (3 downto 0); --aluctl
    aluout : out STD_LOGIC_VECTOR (31 downto 0); --aluout
    z : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is 
        SIGNAL resultX : STD_LOGIC_VECTOR (31 DOWNTO 0);
--    signal reg_a : signed( 31 downto 0 ) := (others => '0'); 
--    signal reg_b : signed( 31 downto 0 ) := (others => '0'); 
--    signal reg_res : signed( 31 downto 0 ) := (others => '0'); 
 
    begin 
 
--    reg_a <= signed(a); 
--    reg_b <= signed(b); 
--    aluout <= std_logic_vector(reg_res); 
--    z<='1' when reg_res=x"0000" else '0';
        process(a,b, aluctl) is      
  
            begin   
            CASE aluctl IS
                            -- Bitwise and
                        WHEN "0000" =>
                            resultX <= a AND b;
                            -- Bitwise or
                        WHEN "0001" =>
                            resultX <= a OR b;
                            -- addition
                        WHEN "0010" =>
                            resultX <= std_logic_vector(unsigned(a) + unsigned(b));
                            -- subtract
                        WHEN "0110" =>
                            resultX <= std_logic_vector(unsigned(a) - unsigned(b));
                            -- set les than
                        WHEN "0111" =>
                            IF (signed(a) < signed(b)) THEN
                                resultX <= x"00000001";
                            ELSE
                                resultX <= x"00000000";
                            END IF;
                            -- Bitwise nor
                        WHEN "1110" =>
                            resultX <= a NOR b;
                            -- Nop
                        WHEN others => NULL;
                        resultX <= x"00000000";
                    END CASE;
                END PROCESS;
                
                aluout <= resultX;
                    z <= '1' WHEN resultX = x"00000000" ELSE
                            '0';
            -- z <= '0'; 
 
--                case aluctl is 
 
--                    when "0000" =>
--                                    reg_res <= reg_a and reg_b;
--                                when "0001" =>
--                                    reg_res <= reg_a or reg_b;
--                                when "0010" =>
--                                    reg_res <= reg_a + reg_b;
--                                when "0110" =>
--                                    reg_res <= reg_a - reg_b;
--                                when "0111" =>
--                                    if (a < b) then
--                                        reg_res <= to_signed(1,reg_res'length);
--                                    else
--                                        reg_res <= to_signed(0,reg_res'length);
--                                    end if;
--                            when "0011" => 
--                                reg_res <= reg_b(15 downto 0) & x"0000";
--                                when "1100" =>
--                                    reg_res <= reg_a nor reg_b;
--                                when others =>
--                                    reg_res <= to_signed(0,reg_res'length);
--                           end case;
--                        end process;
                end Behavioral;







