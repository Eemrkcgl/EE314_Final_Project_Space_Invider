module total_enemies(
	input clk,
	input fire_clk,
	input spawn,
	input fire_mode,
	input fire,
	input [3:0] ss_angle_state

);

	assign end_game = 0 | collisions;
	reg [7:0] collisions;
	

	enemy e0(clk, fire_clk, spawn, fire_mode, fire, ss_angle_state, enemy_types[0], alive[0], healths[0], x_coordinates[0], y_coordinates[0], collisions[0]);
	enemy e1(clk, fire_clk, spawn, fire_mode, fire, ss_angle_state, enemy_types[1], alive[1], healths[1], x_coordinates[1], y_coordinates[1], collisions[1]);
	enemy e2(clk, fire_clk, spawn, fire_mode, fire, ss_angle_state, enemy_types[2], alive[2], healths[2], x_coordinates[2], y_coordinates[2], collisions[2]);	
	enemy e3(clk, fire_clk, spawn, fire_mode, fire, ss_angle_state, enemy_types[3], alive[3], healths[3], x_coordinates[3], y_coordinates[3], collisions[3]);	
	enemy e4(clk, fire_clk, spawn, fire_mode, fire, ss_angle_state, enemy_types[4], alive[4], healths[4], x_coordinates[4], y_coordinates[4], collisions[4]);	
	enemy e5(clk, fire_clk, spawn, fire_mode, fire, ss_angle_state, enemy_types[5], alive[5], healths[5], x_coordinates[5], y_coordinates[5], collisions[5]);
	enemy e6(clk, fire_clk, spawn, fire_mode, fire, ss_angle_state, enemy_types[6], alive[6], healths[6], x_coordinates[6], y_coordinates[6], collisions[6]);
	enemy e7(clk, fire_clk, spawn, fire_mode, fire, ss_angle_state, enemy_types[7], alive[7], healths[7], x_coordinates[7], y_coordinates[7], collisions[7]);	
	
	
	
endmodule
