library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu4_tb is
end entity alu4_tb;

architecture sim of alu4_tb is
    signal a      : unsigned(3 downto 0) := (others => '0');
    signal b      : unsigned(3 downto 0) := (others => '0');
    signal op     : std_logic_vector(1 downto 0) := (others => '0');
    signal result : unsigned(3 downto 0);
begin
    dut : entity work.alu4
        port map (
            a      => a,
            b      => b,
            op     => op,
            result => result
        );

    stimulus : process
    begin

        a <= "0101";
        b <= "0001";
        op <= "00"; -- AND
        wait for 10 ns;
        assert (result = "0001") report "Test failed for AND operation" severity error;

        a <= "0001";
        b <= "0010";
        op <= "01"; -- OR
        wait for 10 ns;
        assert (result = "0011") report "Test failed for OR operation" severity error;

        a <= "0011";
        b <= "0101";
        op <= "10"; -- XOR
        wait for 10 ns;
        assert (result = "0110") report "Test failed for XOR operation" severity error;

        a <= "0011";
        b <= "0101";
        op <= "11"; -- ADD
        wait for 10 ns;
        assert (result = "1000") report "Test failed for ADD operation" severity error;

        wait;

    end process;
end architecture sim;