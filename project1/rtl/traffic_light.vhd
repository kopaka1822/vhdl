library ieee;
use ieee.std_logic_1164.all;

entity traffic_light is
    port (
        clk    : in std_logic;
        reset  : in std_logic;
        red    : out std_logic;
        yellow : out std_logic;
        green  : out std_logic
    );
end entity traffic_light;

architecture rtl of traffic_light is
    type state_type is (SRed, SYellow, SGreen);
    signal state : state_type;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                state <= SRed;
            else
                case state is
                    when SRed =>
                        state <= SYellow;
                    when SYellow =>
                        state <= SGreen;
                    when SGreen =>
                        state <= SRed;
                end case;
            end if;
        end if;
    end process;
    red    <= '1' when state = SRed else '0';
    yellow <= '1' when state = SYellow else '0';
    green  <= '1' when state = SGreen else '0';
end architecture rtl;