library ieee;
use ieee.std_logic_1164.all;

entity controlador is
    port(
        N3,N2,N1,N0      : in  std_logic_vector(3 downto 0);
        A,B,C,D,E,F,G,DP : out std_logic;
        AN               : out std_logic_vector(3 downto 0)
    );
end controlador;

architecture behav of controlador is

    constant clk_period : time := 1 ns;

    --------------------------------------------------------------------------------
    component c2b is
        generic(clk_period :     time);
        port(Q             : out std_logic_vector(1 downto 0));
    end component;

    component mux4bit4to1 is
        port(
            A,B,C,D : in  std_logic_vector(3 downto 0);
            SEL     : in  std_logic_vector(1 downto 0);
            Q       : out std_logic_vector(3 downto 0)
        );
    end component;

    component decoder is
        port(
            SEL : in  std_logic_vector(1 downto 0);
            Q   : out std_logic_vector(3 downto 0)
        );
    end component;

    component D7SD is
        port(
            bits             : in  std_logic_vector(3 downto 0);
            A,B,C,D,E,F,G,DP : out std_logic
        );
    end component;
    ----------------------------------------------------------------------------

    signal SEL : std_logic_vector(1 downto 0);
    signal BCD : std_logic_vector(3 downto 0);
begin
    c2b_u : c2b
        generic map(clk_period)
        port map(SEL);

        mux : mux4bit4to1 port map (N0,N1,N2,N3,SEL,BCD);

        decoder_u : decoder port map (SEL, AN);

        D7SD_u : D7SD port map(BCD,A,B,C,D,E,F,G,DP);

end behav;