module trajectory_generator(
    input  clk,
    input  spawn,
    input  [3:0] angle_state, 
	 
    output reg ready,
    output reg [9:0] x_pixel, 
    output reg [8:0] y_pixel, 
    output reg collision    
);
	
    parameter alien_size = 39;
    parameter ss_left_top_x = 215;
    parameter ss_left_top_y = 215;
    parameter ss_right_bottom_x = 235 + 40;
    parameter ss_right_bottom_y = 235 + 40;

    reg signed [10:0] x_pos;
    reg signed [9:0] y_pos;
	 
    reg initialized = 0;
	 
    always @(posedge clk) begin
        if (spawn) begin
            initialized <= 0;
            ready <= 0;
            collision <= 0;
        end else if (~initialized) begin
            initialized <= 1;
            ready <= 0;
            case (angle_state)
                0: begin x_pos <= 0; y_pos <= 0; end
                1: begin x_pos <= 122; y_pos <= 0; end
                2: begin x_pos <= 221; y_pos <= 0; end
                3: begin x_pos <= 320; y_pos <= 0; end
                4: begin x_pos <= 441; y_pos <= 0; end
                5: begin x_pos <= 441; y_pos <= 125; end
                6: begin x_pos <= 441; y_pos <= 221; end
                7: begin x_pos <= 441; y_pos <= 313; end
                8: begin x_pos <= 441; y_pos <= 441; end
                9: begin x_pos <= 320; y_pos <= 441; end
                10: begin x_pos <= 221; y_pos <= 441; end
                11: begin x_pos <= 122; y_pos <= 441; end
                12: begin x_pos <= 0; y_pos <= 441; end
                13: begin x_pos <= 0; y_pos <= 313; end
                14: begin x_pos <= 0; y_pos <= 221; end
                15: begin x_pos <= 0; y_pos <= 125; end
            endcase	
        end else if (initialized && !collision) begin
            ready <= 1;
            case (angle_state)
                0:  begin x_pos <= x_pos + 7; y_pos <= y_pos + 7; end
                1:  begin x_pos <= x_pos + 4; y_pos <= y_pos + 9; end
                2:  begin x_pos <= x_pos;     y_pos <= y_pos + 7; end
                3:  begin x_pos <= x_pos - 4; y_pos <= y_pos + 9; end
                4:  begin x_pos <= x_pos - 7; y_pos <= y_pos + 7; end
                5:  begin x_pos <= x_pos - 9; y_pos <= y_pos + 4; end
                6:  begin x_pos <= x_pos - 7; y_pos <= y_pos;     end
                7:  begin x_pos <= x_pos - 9; y_pos <= y_pos - 4; end
                8:  begin x_pos <= x_pos - 7; y_pos <= y_pos - 7; end
                9:  begin x_pos <= x_pos - 4; y_pos <= y_pos - 9; end
                10: begin x_pos <= x_pos;     y_pos <= y_pos - 7; end
                11: begin x_pos <= x_pos + 4; y_pos <= y_pos - 9; end
                12: begin x_pos <= x_pos + 7; y_pos <= y_pos - 7; end
                13: begin x_pos <= x_pos + 9; y_pos <= y_pos - 4; end
                14: begin x_pos <= x_pos + 7; y_pos <= y_pos;     end
                15: begin x_pos <= x_pos + 9; y_pos <= y_pos + 4; end
            endcase

            if ((x_pos < ss_right_bottom_x && (x_pos + alien_size) > ss_left_top_x) &&
                (y_pos < ss_right_bottom_y && (y_pos + alien_size) > ss_left_top_y)) begin
                collision <= 1;
                ready <= 0;
            end else if (x_pos < 0 || x_pos >= 480 || y_pos < 0 || y_pos >= 480) begin
                ready <= 0;
            end else begin
                collision <= 0;
                x_pixel <= x_pos[9:0];
                y_pixel <= y_pos[8:0];
            end
        end
    end
endmodule