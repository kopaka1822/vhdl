library ieee;
use ieee.numeric_std.all;

package pixel_types is

    type pixel_array is array (0 to 3) of unsigned(7 downto 0);

end package pixel_types;