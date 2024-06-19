library verilog;
use verilog.vl_types.all;
entity enemy_vlg_check_tst is
    port(
        alive           : in     vl_logic;
        collision       : in     vl_logic;
        enemy_type      : in     vl_logic_vector(1 downto 0);
        health          : in     vl_logic_vector(3 downto 0);
        x_coordinate    : in     vl_logic_vector(9 downto 0);
        y_coordinate    : in     vl_logic_vector(8 downto 0);
        sampler_rx      : in     vl_logic
    );
end enemy_vlg_check_tst;
