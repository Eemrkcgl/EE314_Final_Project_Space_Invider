module enemy(
    input clk,            
    input spawn,
    input [1:0] fire_mode,
    input fire,
    input [3:0] ss_angle_state,
    input [5:0] rand,
	 input enable,

	 output reg [3:0] health,
    output reg [3:0] angle_state,
    output reg [1:0] enemy_type,
    output reg alive,
    output reg [9:0] x_coordinate, 
    output reg [8:0] y_coordinate,
    output reg collision,
    output reg [9:0] score
);

parameter alien_size = 39;
parameter ss_left_top_x = 215;
parameter ss_left_top_y = 215;
parameter ss_right_bottom_x = 235 + 40;
parameter ss_right_bottom_y = 235 + 40;

reg [3:0] damage;

always @(*) begin
	case (fire_mode) 
		0: damage = 4;
		1: damage = 2;
		2: damage = 16;
		3: damage = 16;
	endcase
end

initial begin
    alive <= 0;
    score <= 0;
    collision <= 0;
end

reg [24:0] count = 0;
reg fire_cool_down = 0; 
reg flag = 0;

always @(posedge clk) begin
	if (enable) begin
			 if (~flag && spawn) begin
				  count <= 0;
				  collision <= 0;
				  angle_state <= rand[5:2];
				  enemy_type <= rand[1:0];
				  health <= 4'hF;
				  flag <= 1;
			 end
			  
			 if (flag && ~alive) begin
				  alive <= 1;
				  
				  case (enemy_type) 
						0: health <= 4'hF;
						1: health <= 4'hC;
						2: health <= 4'h8;
						3: health <= 4'h4;
				  
				  
				  endcase
				  
				  
				  case (angle_state)
						0:  begin  x_coordinate <= 0;    y_coordinate <= 0;   end
						1:  begin  x_coordinate <= 122;  y_coordinate <= 0;   end
						2:  begin  x_coordinate <= 221;  y_coordinate <= 0;   end
						3:  begin  x_coordinate <= 320;  y_coordinate <= 0;   end
						4:  begin  x_coordinate <= 441;  y_coordinate <= 0;   end
						5:  begin  x_coordinate <= 441;  y_coordinate <= 125; end
						6:  begin  x_coordinate <= 441;  y_coordinate <= 221; end
						7:  begin  x_coordinate <= 441;  y_coordinate <= 313; end
						8:  begin  x_coordinate <= 441;  y_coordinate <= 441; end
						9:  begin  x_coordinate <= 320;  y_coordinate <= 441; end
						10: begin  x_coordinate <= 221;  y_coordinate <= 441; end
						11: begin  x_coordinate <= 122;  y_coordinate <= 441; end
						12: begin  x_coordinate <= 0;    y_coordinate <= 441; end
						13: begin  x_coordinate <= 0;    y_coordinate <= 313; end
						14: begin  x_coordinate <= 0;    y_coordinate <= 221; end
						15: begin  x_coordinate <= 0;    y_coordinate <= 125; end
				  endcase
			 end

			 if (alive) begin
				  if (count == 6249999) begin
						count <= 0;
						case (angle_state)
							 0:  begin x_coordinate <= x_coordinate + 1; y_coordinate <= y_coordinate + 1; end
							 1:  begin x_coordinate <= x_coordinate + 1; y_coordinate <= y_coordinate + 2; end
							 2:  begin x_coordinate <= x_coordinate;     y_coordinate <= y_coordinate + 2; end
							 3:  begin x_coordinate <= x_coordinate - 1; y_coordinate <= y_coordinate + 2; end
							 4:  begin x_coordinate <= x_coordinate - 1; y_coordinate <= y_coordinate + 1; end
							 5:  begin x_coordinate <= x_coordinate - 2; y_coordinate <= y_coordinate + 1; end
							 6:  begin x_coordinate <= x_coordinate - 2; y_coordinate <= y_coordinate;     end
							 7:  begin x_coordinate <= x_coordinate - 2; y_coordinate <= y_coordinate - 1; end
							 8:  begin x_coordinate <= x_coordinate - 1; y_coordinate <= y_coordinate - 1; end
							 9:  begin x_coordinate <= x_coordinate - 1; y_coordinate <= y_coordinate - 2; end
							 10: begin x_coordinate <= x_coordinate;     y_coordinate <= y_coordinate - 2; end
							 11: begin x_coordinate <= x_coordinate + 1; y_coordinate <= y_coordinate - 2; end
							 12: begin x_coordinate <= x_coordinate + 1; y_coordinate <= y_coordinate - 1; end
							 13: begin x_coordinate <= x_coordinate + 2; y_coordinate <= y_coordinate - 1; end
							 14: begin x_coordinate <= x_coordinate + 1; y_coordinate <= y_coordinate;     end
							 15: begin x_coordinate <= x_coordinate + 2; y_coordinate <= y_coordinate + 1; end
						endcase

						if ((x_coordinate < ss_right_bottom_x && (x_coordinate + alien_size) > ss_left_top_x) &&
							 (y_coordinate < ss_right_bottom_y && (y_coordinate + alien_size) > ss_left_top_y)) begin
								  alive <= 0;
								  collision <= 1;
						end
				  end
				  else begin
						count <= count + 1;
				  end
			 end

			 if (alive && health == 0) begin
				  alive <= 0;
				  score <= score + 1;
				  flag <= 0;
			 end

			 if (fire && ~fire_cool_down) begin
					case (fire_mode)
					
						0: begin
							if (angle_state == ss_angle_state || angle_state == ss_angle_state + 1 || angle_state == ss_angle_state - 1) begin
								if (health >= 4) 
									health <= health - 4;
							
								else begin
									health <= 0;
								end
							end
						end
						
						1: begin
							if (angle_state == ss_angle_state || angle_state == ss_angle_state + 1 || angle_state == ss_angle_state - 1 || angle_state == ss_angle_state + 2 || angle_state == ss_angle_state - 2) begin
								if (health >= 2) 
									health <= health - 2;
							
								else begin
									health <= 0;
								end
							end
						end
					
						
						2, 3: begin
							if (angle_state == ss_angle_state) begin
									health <= 0;
							end
							else 
								health <= health;
						end
					
					
					endcase
					
					
				
				  fire_cool_down <= 1;
			 end
			  
			 else if (~fire && fire_cool_down) begin
				  fire_cool_down <= 0;    
			 end
	end
end

endmodule
