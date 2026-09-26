library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.pixel_types.all;

entity camera_128x128 is
    port (
        clk         : in  std_logic;
        reset       : in  std_logic;

        pixel_valid : out std_logic;
        frame_valid : out std_logic;
        pixels      : out pixel_array_4
    );
end entity;