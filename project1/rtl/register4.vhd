library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register4 is
    port (
        clk      : in std_logic;
        reset    : in std_logic;
        enable   : in std_logic;
        data_in  : in unsigned(3 downto 0);
        data_out : out unsigned(3 downto 0)
    );
end entity register4;

architecture rtl of register4 is
    signal data_internal : unsigned(3 downto 0) := (others => 'U');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                data_internal <= (others => '0');
            elsif enable = '1' then
                data_internal <= data_in;
            end if;
        end if;
    end process;
    data_out <= data_internal;
end architecture rtl;