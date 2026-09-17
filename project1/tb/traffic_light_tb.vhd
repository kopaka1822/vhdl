library ieee;
use ieee.std_logic_1164.all;
--use std.env.all;

entity traffic_light_tb is
end entity traffic_light_tb;

architecture sim of traffic_light_tb is
    signal clk    : std_logic := '0';
    signal reset  : std_logic;
    signal red    : std_logic;
    signal yellow : std_logic;
    signal green  : std_logic;
begin
    dut: entity work.traffic_light
        port map (
            clk    => clk,
            reset  => reset,
            red    => red,
            yellow => yellow,
            green  => green
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
        assert (red = '1' and yellow = '0' and green = '0') report "Test failed for reset" severity error;

        wait until rising_edge(clk); wait for 1 ns;
        assert (red = '0' and yellow = '1' and green = '0') report "Test failed for red to yellow" severity error;

        wait until rising_edge(clk); wait for 1 ns;
        assert (red = '0' and yellow = '0' and green = '1') report "Test failed for yellow to green" severity error;

        wait until rising_edge(clk); wait for 1 ns;
        assert (red = '1' and yellow = '0' and green = '0') report "Test failed for green to red" severity error;

        std.env.stop;
    end process;
end architecture sim;