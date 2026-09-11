library ieee;
use ieee.std_logic_1164.all;

entity complex_gate is
    port (
        a : in  std_logic;
        b : in  std_logic;
        c : in  std_logic;
        y : out std_logic
    );
end entity complex_gate;

architecture rtl of complex_gate is
begin
    y <= (a and b) or (not c);
end architecture rtl;