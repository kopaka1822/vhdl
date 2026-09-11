library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder4 is
    port (
        a      : in  unsigned(3 downto 0);
        b      : in  unsigned(3 downto 0);
        result : out unsigned(3 downto 0);
        carry  : out std_logic
    );
end entity adder4;

architecture rtl of adder4 is
    signal sum : unsigned(4 downto 0); -- 5 bit
begin
    sum <= resize(a, 5) + resize(b, 5);
    result <= sum(3 downto 0);
    carry <= sum(4);
end architecture rtl;