library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity counter4_tb is
end entity counter4_tb;

architecture sim of counter4_tb is
    signal clk    : std_logic := '0';
    signal reset  : std_logic := '0';
    signal enable : std_logic := '0';
    signal count  : unsigned(3 downto 0);
begin
    dut: entity work.counter4
        port map (
            clk    => clk,
            reset  => reset,
            enable => enable,
            count  => count
        );

    clock_process : process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    stimulus: process
    begin
        
        reset <= '1';
        wait until rising_edge(clk); wait for 1 ns;
        reset <= '0';
        assert (count = "0000") report "Test failed for reset" severity error;

        wait until rising_edge(clk); wait for 1 ns;
        assert (count = "0000") report "Test failed for not enabled" severity error;

        enable <= '1';
        wait until rising_edge(clk); wait for 1 ns;
        assert (count = "0001") report "Test failed for count 1" severity error;

        wait until rising_edge(clk); wait for 1 ns;
        assert (count = "0010") report "Test failed for count 2" severity error;

        wait until rising_edge(clk); wait for 1 ns;
        assert (count = "0011") report "Test failed for count 3" severity error;

        wait until rising_edge(clk); wait for 1 ns;
        assert (count = "0100") report "Test failed for count 4" severity error;

        for i in 5 to 15 loop
            wait until rising_edge(clk); wait for 1 ns;
            assert (count = to_unsigned(i, 4)) report "Test failed for count " & integer'image(i) severity error;
        end loop;

        assert (count = "1111") report "Test failed for count 15" severity error;

        wait until rising_edge(clk); wait for 1 ns; -- 0000
        assert (count = "0000") report "Test failed for count wrap around" severity error;

        wait until rising_edge(clk); wait for 1 ns; -- 0001
        enable <= '0';
        wait until rising_edge(clk); wait for 1 ns; -- 0001
        assert (count = "0001") report "Test failed for count 1 w/o enable" severity error;
        
        std.env.stop;
    end process;
end architecture sim;