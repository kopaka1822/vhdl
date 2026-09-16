library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter4 is
    port (
        clk   : in  std_logic;
        reset : in  std_logic;
        enable : in std_logic;
        count : out unsigned(3 downto 0)
    );
end entity counter4;

architecture rtl of counter4 is
    signal count_reg : unsigned(3 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                count_reg <= (others => '0'); -- set all values to zero
            elsif enable = '1' then
                count_reg <= count_reg + 1;
            end if;
        end if;
    end process;
    count <= count_reg;
end architecture rtl;