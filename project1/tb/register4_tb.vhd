library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity register4_tb is
end entity register4_tb;

architecture sim of register4_tb is
    signal clk      : std_logic := '0';
    signal reset    : std_logic;
    signal enable   : std_logic;
    signal data_in  : unsigned(3 downto 0) := (others => 'U');
    signal data_out : unsigned(3 downto 0) := (others => 'U');
begin
    dut: entity work.register4
        port map (
            clk      => clk,
            reset    => reset,
            enable   => enable,
            data_in  => data_in,
            data_out => data_out
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
        wait until rising_edge(clk); wait for 5 ns;
        reset <= '0';
        assert (data_out = "0000") report "Test failed for reset" severity error;

        data_in <= "1010";
        enable <= '1';
        wait until rising_edge(clk); wait for 5 ns;
        assert (data_out = "1010") report "Test failed for load data" severity error;

        data_in <= "0101";
        enable <= '0';
        wait until rising_edge(clk); wait for 5 ns;
        assert (data_out = "1010") report "Test failed for hold data" severity error;

        enable <= '1';
        wait until rising_edge(clk); wait for 5 ns;
        assert (data_out = "0101") report "Test failed for load new data" severity error;

        std.env.stop;
    end process;
end architecture sim;