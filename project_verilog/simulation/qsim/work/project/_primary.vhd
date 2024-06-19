library verilog;
use verilog.vl_types.all;
entity project is
    port(
        CLOCK2_50       : in     vl_logic;
        CLOCK3_50       : in     vl_logic;
        CLOCK4_50       : in     vl_logic;
        CLOCK_50        : in     vl_logic;
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        KEY             : in     vl_logic_vector(3 downto 0);
        LEDR            : out    vl_logic_vector(9 downto 0);
        SW              : in     vl_logic_vector(9 downto 0);
        VGA_BLANK_N     : out    vl_logic;
        VGA_B           : out    vl_logic_vector(7 downto 0);
        VGA_CLK         : out    vl_logic;
        VGA_G           : out    vl_logic_vector(7 downto 0);
        VGA_HS          : out    vl_logic;
        VGA_R           : out    vl_logic_vector(7 downto 0);
        VGA_SYNC_N      : out    vl_logic;
        VGA_VS          : out    vl_logic
    );
end project;
