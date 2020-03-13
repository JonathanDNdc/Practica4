library ieee;
use ieee.std_logic_1164.all;

entity mux4bit4to1 is
    port(
        A,B,C,D : in  std_logic_vector(3 downto 0);
        SEL     : in  std_logic_vector(1 downto 0);
        Q       : out std_logic_vector(3 downto 0)
    );
end mux4bit4to1;

architecture behav of mux4bit4to1 is
begin
    process (SEL)
    begin
        if (SEL = "00") then
            Q <= A;
        elsif (SEL = "01") then
            Q <= B;
        elsif (SEL = "10") then
            Q <= C;
        else
            Q <= D;
        end if;
    end process;
end behav;