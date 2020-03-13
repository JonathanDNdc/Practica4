library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity c2b is
    generic(clk_period : time := 1 ns);
    port(Q : out std_logic_vector(1 downto 0));
end c2b;

architecture behav of c2b is
    signal Clk : std_logic := '0';
    signal count : unsigned(1 downto 0) := "00";
begin

    Clk <= not Clk after clk_period / 2;

    process(Clk)
    begin
        if rising_edge(Clk) then
            count <= count + 1;
        end if;
    end process;

    Q <= std_logic_vector(count);

end behav;