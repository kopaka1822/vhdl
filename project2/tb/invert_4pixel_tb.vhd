library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pixel_types.all;

entity invert_4pixel_tb is
end entity invert_4pixel_tb;

architecture sim of invert_4pixel_tb is

    signal pixel_in  : pixel_array;
    signal pixel_out : pixel_array;

begin

    dut : entity work.invert_4pixel
        port map (
            pixel_in  => pixel_in,
            pixel_out => pixel_out
        );

    stimulus : process
    begin

        pixel_in(0) <= to_unsigned(10, 8);
        pixel_in(1) <= to_unsigned(20, 8);
        pixel_in(2) <= to_unsigned(30, 8);
        pixel_in(3) <= to_unsigned(40, 8);

        wait for 1 ns;

        assert pixel_out(0) = to_unsigned(245, 8)
            report "Pixel 0 failed"
            severity error;

        assert pixel_out(1) = to_unsigned(235, 8)
            report "Pixel 1 failed"
            severity error;

        assert pixel_out(2) = to_unsigned(225, 8)
            report "Pixel 2 failed"
            severity error;

        assert pixel_out(3) = to_unsigned(215, 8)
            report "Pixel 3 failed"
            severity error;

        std.env.stop;

    end process;

end architecture sim;