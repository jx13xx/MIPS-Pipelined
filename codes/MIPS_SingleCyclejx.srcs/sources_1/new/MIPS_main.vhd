

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MIPS_main is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end MIPS_main;

architecture Behavioral of MIPS_main is

    signal se_in : std_logic_vector(15 downto 0) := x"0000";
    signal se_out : std_logic_vector(31 downto 0) := x"00000000";
    
    signal reg2 : std_logic_vector(31 downto 0) := x"00000000";
    signal mux_ctl : std_logic := '0';
    signal mux_out : std_logic_vector(31 downto 0) := x"00000000";
    

begin
    -- Instantiate the ALU Source  Mux
   U1 : entity work.Mux(Behavioral)
        port map(
           mux_in0 => reg2,
           mux_in1 => se_out,  
           mux_ctl => mux_ctl, 
           mux_out => mux_out
           );
    -- Instantiate a Sign Extender
   U2 : entity work.SignExtender(Behavioral)
        port map(
           se_in => se_in,
           se_out => se_out
           );

end Behavioral;
