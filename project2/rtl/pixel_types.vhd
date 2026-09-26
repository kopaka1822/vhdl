library ieee;
use ieee.numeric_std.all;

package pixel_types is

    subtype pixel is unsigned(7 downto 0);

    type pixel_array_4 is array (0 to 3) of pixel;

end package pixel_types;