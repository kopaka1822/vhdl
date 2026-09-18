library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity invert_pixel is
    port (
        pixel_in  : in  unsigned(7 downto 0);
        pixel_out : out unsigned(7 downto 0)
    );
end entity invert_pixel;

architecture rtl of invert_pixel is
begin
    pixel_out <= 255 - pixel_in;
end architecture rtl;