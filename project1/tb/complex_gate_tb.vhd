library ieee;
use ieee.std_logic_1164.all;

entity complex_gate_tb is
end entity complex_gate_tb;

architecture sim of complex_gate_tb is
    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal c : std_logic := '0';
    signal y : std_logic;
begin

    dut : entity work.complex_gate
        port map (
            a => a,
            b => b,
            c => c,
            y => y
        );

    stimulus : process
    begin

        a <= '0';
        b <= '0';
        c <= '0';
        wait for 10 ns;
        assert (y = '1') report "Test failed for a=0, b=0, c=0" severity error;

        a <= '0';
        b <= '1';
        c <= '0';
        wait for 10 ns;
        assert (y = '1') report "Test failed for a=0, b=1, c=0" severity error;

        a <= '1';
        b <= '0';
        c <= '0';
        wait for 10 ns;
        assert (y = '1') report "Test failed for a=1, b=0, c=0" severity error;

        a <= '1';
        b <= '1';
        c <= '0';
        wait for 10 ns;
        assert (y = '1') report "Test failed for a=1, b=1, c=0" severity error;

        a <= '0';
        b <= '0';
        c <= '1';
        wait for 10 ns;
        assert (y = '0') report "Test failed for a=0, b=0, c=1" severity error;

        a <= '0';
        b <= '1';
        c <= '1';
        wait for 10 ns;
        assert (y = '0') report "Test failed for a=0, b=1, c=1" severity error;

        a <= '1';
        b <= '0';
        c <= '1';
        wait for 10 ns;
        assert (y = '0') report "Test failed for a=1, b=0, c=1" severity error;

        a <= '1';
        b <= '1';
        c <= '1';
        wait for 10 ns;
        assert (y = '1') report "Test failed for a=1, b=1, c=1" severity error;

        wait;
    end process;

end architecture sim;