library ieee;
use ieee.std_logic_1164.all;

entity D7SD is
    port(
        bits             : in  std_logic_vector(3 downto 0);
        A,B,C,D,E,F,G,DP : out std_logic
    );
end D7SD;

architecture ecuaciones of D7SD is
begin
    A <= (not bits(3) and not bits(2) and not bits(1) and bits(0))
        or (bits(2) and not bits(1) and not bits(0));

    B <= (bits(2) and not bits(1) and bits(0))
        or (bits(2) and bits(1) and not bits(0));

    C <= not bits(2) and bits(1) and not bits(0);

    D <= (not bits(3) and not bits(2) and not bits(1) and bits(0))
        or (bits(2) and not bits(1) and not bits(0))
        or (bits(2) and bits(1) and bits(0));

    E <= bits(0)
        or (bits(2) and not bits(1));

    F <= (not bits(3) and not bits(2) and bits(0))
        or (not bits(2) and bits(1))
        or (bits(1) and bits(0));

    G <= (not bits(3) and not bits(2) and not bits(1))
        or (bits(2) and bits(1) and bits(0));

    DP <= '1';

end ecuaciones;