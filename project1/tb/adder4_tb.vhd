library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder4_tb is
end entity adder4_tb;

architecture sim of adder4_tb is
    signal a      : unsigned(3 downto 0) := (others => '0');
    signal b      : unsigned(3 downto 0) := (others => '0');
    signal result : unsigned(3 downto 0);
    signal carry  : std_logic;
begin
    dut : entity work.adder4
        port map (
            a      => a,
            b      => b,
            result => result,
            carry  => carry
        );

    stimulus : process
    begin
        a <= "0000";
        b <= "0000";
        wait for 10 ns;
        assert (result = "0000" and carry = '0') report "Test failed for 0 + 0" severity error;

        a <= "0001";
        b <= "0010";
        wait for 10 ns;
        assert (result = "0011" and carry = '0') report "Test failed for 1 + 2" severity error;

        a <= "0111";
        b <= "0001";
        wait for 10 ns;
        assert (result = "1000" and carry = '0') report "Test failed for 7 + 1" severity error;

        a <= "1111";
        b <= "0001";
        wait for 10 ns;
        assert (result = "0000" and carry = '1') report "Test failed for 15 + 1" severity error;

        wait;
    end process;
end architecture sim;