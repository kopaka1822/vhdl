library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity invert_pixel_tb is
end entity invert_pixel_tb;

architecture sim of invert_pixel_tb is
    signal pixel_in  : unsigned(7 downto 0);
    signal pixel_out : unsigned(7 downto 0);
begin
    uut: entity work.invert_pixel
        port map (
            pixel_in  => pixel_in,
            pixel_out => pixel_out
        );

    stimulus: process
    begin
        pixel_in <= "00000000";
        wait for 10 ns;
        assert (pixel_out = "11111111") report "Test failed for input 0" severity error;

        pixel_in <= "11111111";
        wait for 10 ns;
        assert (pixel_out = "00000000") report "Test failed for input 255" severity error;

        pixel_in <= "00001111";
        wait for 10 ns;
        assert (pixel_out = "11110000") report "Test failed for input 170" severity error;

        pixel_in <= "01010101";
        wait for 10 ns;
        assert (pixel_out = "10101010") report "Test failed for input 85" severity error;

        wait; -- Wait indefinitely to end the simulation
    end process;
end architecture sim;