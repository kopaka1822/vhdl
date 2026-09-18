library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pixel_types.all;

entity invert_4pixel is
    port (
        pixel_in  : in  pixel_array;
        pixel_out : out pixel_array
    );
end entity invert_4pixel;

architecture rtl of invert_4pixel is
begin

    inverter_0 : entity work.invert_pixel
        port map (
            pixel_in  => pixel_in(0),
            pixel_out => pixel_out(0)
        );

    inverter_1 : entity work.invert_pixel
        port map (
            pixel_in  => pixel_in(1),
            pixel_out => pixel_out(1)
        );

    inverter_2 : entity work.invert_pixel
        port map (
            pixel_in  => pixel_in(2),
            pixel_out => pixel_out(2)
        );

    inverter_3 : entity work.invert_pixel
        port map (
            pixel_in  => pixel_in(3),
            pixel_out => pixel_out(3)
        );

end architecture rtl;