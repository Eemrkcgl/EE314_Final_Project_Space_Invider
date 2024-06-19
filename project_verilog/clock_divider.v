module clock_divider (
    input clk,
    output reg divided_clk
);

reg [24:0] counter;
reg [24:0] threshold = 24999999;

always @(posedge clk) begin
    if (counter == threshold - 1) begin
        counter <= 0;
        divided_clk <= ~divided_clk;
    end else begin
        counter <= counter + 1;
        divided_clk <= 0;
    end
end

endmodule
