library ieee;
use ieee.std_logic_1164.all;

entity controlador_tb is
end controlador_tb;

architecture test of controlador_tb is
    component controlador is
        port(
            N3,N2,N1,N0      : in  std_logic_vector(3 downto 0);
            A,B,C,D,E,F,G,DP : out std_logic;
            AN               : out std_logic_vector(3 downto 0)
        );
    end component;

    signal N3,N2,N1,N0, AN  : std_logic_vector(3 downto 0);
    signal A,B,C,D,E,F,G,DP : std_logic;
begin
        uut : controlador port map (
            N3,N2,N1,N0,
            A,B,C,D,E,F,G,DP,
            AN
        );

    process
    begin
    N3 <= "0110";
    N2 <= "0010";
    N1 <= "1001";
    N0 <= "0111";
    wait for 8 ns;
    N3 <= "1000";
    N2 <= "0100";
    N1 <= "0010";
    N0 <= "0001";
    wait;
    end process;

end test;