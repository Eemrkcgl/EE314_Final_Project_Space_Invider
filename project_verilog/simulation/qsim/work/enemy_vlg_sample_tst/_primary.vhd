library verilog;
use verilog.vl_types.all;
entity enemy_vlg_sample_tst is
    port(
        enemy_clk       : in     vl_logic;
        fire            : in     vl_logic;
        fire_clk        : in     vl_logic;
        fire_mode       : in     vl_logic;
        spawn           : in     vl_logic;
        ss_angle_state  : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end enemy_vlg_sample_tst;
