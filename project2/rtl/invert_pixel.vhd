library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.pixel_types.all;

entity invert_pixel is
    port (
        pixel_in  : in  pixel;
        pixel_out : out pixel
    );
end entity invert_pixel;

architecture rtl of invert_pixel is
begin
    pixel_out <= 255 - pixel_in;
end architecture rtl;