library verilog;
use verilog.vl_types.all;
entity enemy is
    port(
        enemy_clk       : in     vl_logic;
        fire_clk        : in     vl_logic;
        spawn           : in     vl_logic;
        fire_mode       : in     vl_logic;
        fire            : in     vl_logic;
        ss_angle_state  : in     vl_logic_vector(3 downto 0);
        alive           : out    vl_logic;
        enemy_type      : out    vl_logic_vector(1 downto 0);
        health          : out    vl_logic_vector(3 downto 0);
        x_coordinate    : out    vl_logic_vector(9 downto 0);
        y_coordinate    : out    vl_logic_vector(8 downto 0);
        collision       : out    vl_logic
    );
end enemy;
