library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu4 is
    port (
        a      : in  unsigned(3 downto 0);
        b      : in  unsigned(3 downto 0);
        op     : in  std_logic_vector(1 downto 0);
        result : out unsigned(3 downto 0)
    );
end entity alu4;

architecture rtl of alu4 is
begin
    with op select
        result <= (a and b) when "00",
                  (a or b) when "01",
                  (a xor b) when "10",
                  (a + b)  when "11",
                  "XXXX" when others;
end architecture rtl;