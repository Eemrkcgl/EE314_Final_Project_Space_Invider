module score_handler(
    input clk,
    input [7:0] enemy_killed,
    output reg [9:0] score
);

    reg [3:0] ones_count; // 4-bit register to hold the count of ones

    always @(enemy_killed) begin
            ones_count = enemy_killed[0] + enemy_killed[1] + enemy_killed[2] +
                         enemy_killed[3] + enemy_killed[4] + enemy_killed[5] +
                         enemy_killed[6] + enemy_killed[7];
            score <= score + ones_count;
    end
endmodule