library ieee;
use ieee.std_logic_1164.all;

entity decoder is
    port(
        SEL : in  std_logic_vector(1 downto 0);
        Q   : out std_logic_vector(3 downto 0)
    );
end decoder;

architecture behav of decoder is
begin
    process (SEL)
    begin
        if (SEL = "00") then
            Q <= "1110";
        elsif (SEL = "01") then
            Q <= "1101";
        elsif (SEL = "10") then
            Q <= "1011";
        else
            Q <= "0111";
        end if;
    end process;

end behav;