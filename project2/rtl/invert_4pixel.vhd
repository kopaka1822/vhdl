library ieee;
use ieee.numeric_std.all;

use work.pixel_types.all;

entity invert_4pixel is
    port (
        pixel_in  : in  pixel_array_4;
        pixel_out : out pixel_array_4
    );
end entity invert_4pixel;

architecture rtl of invert_4pixel is
begin

    kernel_0 : entity work.invert_pixel
        port map (
            pixel_in  => pixel_in(0),
            pixel_out => pixel_out(0)
        );

    kernel_1 : entity work.invert_pixel
        port map (
            pixel_in  => pixel_in(1),
            pixel_out => pixel_out(1)
        );

    kernel_2 : entity work.invert_pixel
        port map (
            pixel_in  => pixel_in(2),
            pixel_out => pixel_out(2)
        );

    kernel_3 : entity work.invert_pixel
        port map (
            pixel_in  => pixel_in(3),
            pixel_out => pixel_out(3)
        );

end architecture rtl;