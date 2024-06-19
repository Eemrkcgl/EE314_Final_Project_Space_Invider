module vga_driver(
	input clk,
	input [9:0] h_count,
	input [9:0] v_count,
	input [9:0] score,
	input [3:0] ss_angle_state,
	input [1:0] fire_mode,
	input end_game,
	
	input [9:0] enemy_x_1,
	input [8:0] enemy_y_1,
	input alive_1,
	input [1:0] enemy_type_1,
	input [3:0] enemy_1_health,

	input [9:0] enemy_x_2,
	input [8:0] enemy_y_2,
	input alive_2,
	input [1:0] enemy_type_2,
	input [3:0] enemy_2_health,
	
	input [9:0] enemy_x_3,
	input [8:0] enemy_y_3,
	input alive_3,
	input [1:0] enemy_type_3,
	input [3:0] enemy_3_health,

	input [9:0] enemy_x_4,
	input [8:0] enemy_y_4,
	input alive_4,
	input [1:0] enemy_type_4,
	input [3:0] enemy_4_health,

	input [9:0] enemy_x_5,
	input [8:0] enemy_y_5,
	input alive_5,
	input [1:0] enemy_type_5,
	input [3:0] enemy_5_health,

	input [9:0] enemy_x_6,
	input [8:0] enemy_y_6,
	input alive_6,
	input [1:0] enemy_type_6,
	input [3:0] enemy_6_health,
	
	input [9:0] enemy_x_7,
	input [8:0] enemy_y_7,
	input alive_7,
	input [1:0] enemy_type_7,
	input [3:0] enemy_7_health,
	
	input [9:0] enemy_x_8,
	input [8:0] enemy_y_8,
	input alive_8,
	input [1:0] enemy_type_8,
	input [3:0] enemy_8_health,
	
	output reg [7:0] o_red,
	output reg [7:0] o_green,
	output reg [7:0] o_blue
);

	wire [3:0] digit_1, digit_2, digit_3;
	score_to_bcd(score, digit_1, digit_2, digit_3);

	parameter ss_height = 75;
	parameter ss_width = 75;
	parameter ss_start_x = 203;
	parameter ss_start_y = 203;
	
	parameter fire_mode_height = 24;
	parameter fire_mode_width = 24;
	parameter fire_mode_start_x = 548;
	parameter fire_mode_start_y = 454;
	
	parameter scoreboard_height = 24;
	parameter scoreboard_width = 110;
	parameter scoreboard_start_x = 505;
	parameter scoreboard_start_y = 100;
	
	parameter digit_height = 24;
	parameter digit_width = 24;
	parameter digit_start_x = 520;
	parameter digit_start_y = 150;
	
	parameter end_game_height = 50;
	parameter end_game_width = 206;
	parameter end_game_start_x = 217;
	parameter end_game_start_y = 180;
	
	parameter health_bar_height = 4;
	parameter health_bar_width = 32;
	
	parameter enemy_height = 39;
	parameter enemy_width = 39;
	parameter gap = 4;

	reg [14:0] ss_pixel_address;
	wire [2:0] ss_pixel_data;

	wire [1:0] fire_mode_pixel_data;
	reg [10:0] fire_mode_adress;
	
	wire scoreboard_pixel_data;
	wire digit_pixel_data_1;
	wire digit_pixel_data_2;
	wire digit_pixel_data_3;
	reg [11:0] scoreboard_address;
	reg [9:0] digit_address_1;
	reg [9:0] digit_address_2;
	reg [9:0] digit_address_3;
	
	wire end_game_pixel_data;
	reg [10299:0] end_game_adress;
	
	wire [11:0] enemy_pixel_data_1;
	reg [10:0]  enemy_adress_1;
	wire enemy_1_health_pixel_data;
	reg [7:0] enemy_1_health_adress;
	
	wire [11:0] enemy_pixel_data_2;
	reg [10:0]  enemy_adress_2;
	wire enemy_2_health_pixel_data;
	reg [7:0] enemy_2_health_adress;
	
	wire [11:0] enemy_pixel_data_3;
	reg [10:0]  enemy_adress_3;
	wire enemy_3_health_pixel_data;
	reg [7:0] enemy_3_health_adress;
	
	wire [11:0] enemy_pixel_data_4;
	reg [10:0]  enemy_adress_4;
	wire enemy_4_health_pixel_data;
	reg [7:0] enemy_4_health_adress;
	
	wire [11:0] enemy_pixel_data_5;
	reg [10:0]  enemy_adress_5;
	wire enemy_5_health_pixel_data;
	reg [7:0] enemy_5_health_adress;
	
	wire [11:0] enemy_pixel_data_6;
	reg [10:0]  enemy_adress_6;
	wire enemy_6_health_pixel_data;
	reg [7:0] enemy_6_health_adress;

	wire [11:0] enemy_pixel_data_7;
	reg [10:0]  enemy_adress_7;
	wire enemy_7_health_pixel_data;
	reg [7:0] enemy_7_health_adress;
	
	wire [11:0] enemy_pixel_data_8;
	reg [10:0]  enemy_adress_8;
	wire enemy_8_health_pixel_data;
	reg [7:0] enemy_8_health_adress;
	
	wire background_pixel_data;
	reg [17:0] background_adress;
	

	ss_image_memory (clk, ss_angle_state, ss_pixel_address, ss_pixel_data);
	
	fire_mode_memory(clk, fire_mode, fire_mode_adress, fire_mode_pixel_data);
	
	scoreboard_memory(clk, scoreboard_address, scoreboard_pixel_data);
	
	digits_memory d1(clk, digit_1, digit_address_1, digit_pixel_data_1);
	digits_memory d2(clk, digit_2, digit_address_2, digit_pixel_data_2);
	digits_memory d3(clk, digit_3, digit_address_3, digit_pixel_data_3);

	end_game_image_memory(clk, end_game_adress, end_game_pixel_data);
	
	enemies_memory e1 (clk, enemy_type_1, enemy_adress_1, enemy_pixel_data_1);
	enemies_memory e2 (clk, enemy_type_2, enemy_adress_2, enemy_pixel_data_2);
	enemies_memory e3 (clk, enemy_type_3, enemy_adress_3, enemy_pixel_data_3);
	enemies_memory e4 (clk, enemy_type_4, enemy_adress_4, enemy_pixel_data_4);
	enemies_memory e5 (clk, enemy_type_5, enemy_adress_5, enemy_pixel_data_5);
	enemies_memory e6 (clk, enemy_type_6, enemy_adress_6, enemy_pixel_data_6);
	enemies_memory e7 (clk, enemy_type_7, enemy_adress_7, enemy_pixel_data_7);
	enemies_memory e8 (clk, enemy_type_8, enemy_adress_8, enemy_pixel_data_8);	
	
	health_bar_memory hb1(clk, enemy_1_health, enemy_1_health_adress, enemy_1_health_pixel_data);
	health_bar_memory hb2(clk, enemy_2_health, enemy_2_health_adress, enemy_2_health_pixel_data);
	health_bar_memory hb3(clk, enemy_3_health, enemy_3_health_adress, enemy_3_health_pixel_data);	
	health_bar_memory hb4(clk, enemy_4_health, enemy_4_health_adress, enemy_4_health_pixel_data);	
	health_bar_memory hb5(clk, enemy_5_health, enemy_5_health_adress, enemy_5_health_pixel_data);
	health_bar_memory hb6(clk, enemy_6_health, enemy_6_health_adress, enemy_6_health_pixel_data);
	health_bar_memory hb7(clk, enemy_7_health, enemy_7_health_adress, enemy_7_health_pixel_data);	
	health_bar_memory hb8(clk, enemy_8_health, enemy_8_health_adress, enemy_8_health_pixel_data);	

	background_image_memory(clk, background_adress, background_pixel_data);

	always @(posedge clk) begin 
	
	if (~end_game) begin
	
		if (h_count >= scoreboard_start_x && h_count < scoreboard_start_x + scoreboard_width && 								//scoreboard
			v_count >= scoreboard_start_y && v_count < scoreboard_start_y + scoreboard_height) begin

			scoreboard_address <= (v_count - scoreboard_start_y) * scoreboard_width + (h_count - scoreboard_start_x);

			if (scoreboard_pixel_data) {o_red, o_green, o_blue} <= {8'hFF, 8'hFF, 8'hFF};
			else {o_red, o_green, o_blue} <= {8'ha1, 8'hbd, 8'h99};;
			
		end
		
		
		else if (h_count >= enemy_x_1 + 4 && h_count < enemy_x_1 + 4 + health_bar_width && alive_1 && 											//health bar
					v_count >= enemy_y_1 - gap  - health_bar_height && v_count < enemy_y_1 - gap ) begin

			enemy_1_health_adress <= (v_count - (enemy_y_1 - gap)) * health_bar_width + (h_count - (enemy_x_1 + 4));
			
			case (enemy_1_health_pixel_data)
				0: {o_red, o_green, o_blue} <= {8'hFF,8'h00,8'h00};
				1: {o_red, o_green, o_blue} <= {8'h00,8'hFF,8'h00};
			endcase

		end
		
		
		else if (h_count >= enemy_x_1 && h_count < enemy_x_1 + enemy_width && alive_1 && 											//enemy
					v_count >= enemy_y_1 && v_count < enemy_y_1 + enemy_height) begin

			enemy_adress_1 <= (v_count - enemy_y_1) * enemy_width + (h_count - enemy_x_1);
			
			{o_red, o_green, o_blue} <= {{enemy_pixel_data_1[11:8],4'h0}, {enemy_pixel_data_1[7:4],4'h0}, {enemy_pixel_data_1[3:0],4'h0}};
	
		end
		
		else if (h_count >= enemy_x_2 + 4 && h_count < enemy_x_2 + enemy_width - 3 && alive_2 && 											//health bar
					v_count >= enemy_y_2 - gap - health_bar_height && v_count < enemy_y_2 - gap) begin

			enemy_2_health_adress <= (v_count - (enemy_y_2 - gap)) * health_bar_width + (h_count - (enemy_x_2 + 4));
			
			case (enemy_2_health_pixel_data)
				0: {o_red, o_green, o_blue} <= {8'hFF,8'h00,8'h00};
				1: {o_red, o_green, o_blue} <= {8'h00,8'hFF,8'h00};
			endcase
		end		
		
		
		else if (h_count >= enemy_x_2 && h_count < enemy_x_2 + enemy_width && alive_2 &&											//enemy
					v_count >= enemy_y_2 && v_count < enemy_y_2 + enemy_height) begin

			enemy_adress_2 <= (v_count - enemy_y_2) * enemy_width + (h_count - enemy_x_2);
			
			{o_red, o_green, o_blue} <= {{enemy_pixel_data_2[11:8],4'h0}, {enemy_pixel_data_2[7:4],4'h0}, {enemy_pixel_data_2[3:0],4'h0}};

				
		end
		
		else if (h_count >= enemy_x_3 + 4 && h_count < enemy_x_3 + enemy_width - 3 && alive_3 && 											//health bar
					v_count >= enemy_y_3 - gap  - health_bar_height && v_count < enemy_y_3 - gap ) begin

			enemy_3_health_adress <= (v_count - (enemy_y_3 - gap)) * health_bar_width + (h_count - (enemy_x_3 + 4));
			
			case (enemy_3_health_pixel_data)
				0: {o_red, o_green, o_blue} <= {8'hFF,8'h00,8'h00};
				1: {o_red, o_green, o_blue} <= {8'h00,8'hFF,8'h00};
			endcase
		end	
			

		else if (h_count >= enemy_x_3 && h_count < enemy_x_3 + enemy_width && alive_3 &&											//enemy
					v_count >= enemy_y_3 && v_count < enemy_y_3 + enemy_height) begin

			enemy_adress_3 <= (v_count - enemy_y_3) * enemy_width + (h_count - enemy_x_3);
			
			{o_red, o_green, o_blue} <= {{enemy_pixel_data_3[11:8],4'h0}, {enemy_pixel_data_3[7:4],4'h0}, {enemy_pixel_data_3[3:0],4'h0}};
			
		end
		
		else if (h_count >= enemy_x_4 + 4 && h_count < enemy_x_4 + enemy_width - 3 && alive_4 && 											//health bar
					v_count >= enemy_y_4 - gap  - health_bar_height && v_count < enemy_y_4 - gap ) begin

			enemy_4_health_adress <= (v_count - (enemy_y_4 - gap)) * health_bar_width + (h_count - (enemy_x_4 + 4));
			
			case (enemy_4_health_pixel_data)
				0: {o_red, o_green, o_blue} <= {8'hFF,8'h00,8'h00};
				1: {o_red, o_green, o_blue} <= {8'h00,8'hFF,8'h00};
			endcase
		end			
		
		else if (h_count >= enemy_x_4 && h_count < enemy_x_4 + enemy_width && alive_4 &&											//enemy
					v_count >= enemy_y_4 && v_count < enemy_y_4 + enemy_height) begin

			enemy_adress_4 <= (v_count - enemy_y_4) * enemy_width + (h_count - enemy_x_4);
			
			{o_red, o_green, o_blue} <= {{enemy_pixel_data_4[11:8],4'h0}, {enemy_pixel_data_4[7:4],4'h0}, {enemy_pixel_data_4[3:0],4'h0}};

			
		end

		else if (h_count >= enemy_x_5 + 4 && h_count < enemy_x_5 + enemy_width - 3 && alive_5 && 											//health bar
					v_count >= enemy_y_5 - gap  - health_bar_height && v_count < enemy_y_5 - gap ) begin

			enemy_5_health_adress <= (v_count - (enemy_y_5 - gap)) * health_bar_width + (h_count - (enemy_x_5 + 4));
			
			case (enemy_5_health_pixel_data)
				0: {o_red, o_green, o_blue} <= {8'hFF,8'h00,8'h00};
				1: {o_red, o_green, o_blue} <= {8'h00,8'hFF,8'h00};
			endcase
		end			
				
		else if (h_count >= enemy_x_5 && h_count < enemy_x_5 + enemy_width && alive_5 &&											//enemy
					v_count >= enemy_y_5 && v_count < enemy_y_5 + enemy_height) begin

			enemy_adress_5 <= (v_count - enemy_y_5) * enemy_width + (h_count - enemy_x_5);
			
			{o_red, o_green, o_blue} <= {{enemy_pixel_data_5[11:8],4'h0}, {enemy_pixel_data_5[7:4],4'h0}, {enemy_pixel_data_5[3:0],4'h0}};

			
		end
		
		else if (h_count >= enemy_x_6 + 4 && h_count < enemy_x_6 + enemy_width - 3 && alive_6 && 											//health bar
					v_count >= enemy_y_6 - gap - health_bar_height && v_count < enemy_y_6 - gap ) begin

			enemy_6_health_adress <= (v_count - (enemy_y_6 - gap)) * health_bar_width + (h_count - (enemy_x_6 + 4));
			
			case (enemy_6_health_pixel_data)
				0: {o_red, o_green, o_blue} <= {8'hFF,8'h00,8'h00};
				1: {o_red, o_green, o_blue} <= {8'h00,8'hFF,8'h00};
			endcase
		end			
				
		
		else if (h_count >= enemy_x_6 && h_count < enemy_x_6 + enemy_width && alive_6 &&										//enemy
					v_count >= enemy_y_6 && v_count < enemy_y_6 + enemy_height) begin

			enemy_adress_6 <= (v_count - enemy_y_6) * enemy_width + (h_count - enemy_x_6);
			
			{o_red, o_green, o_blue} <= {{enemy_pixel_data_6[11:8],4'h0}, {enemy_pixel_data_6[7:4],4'h0}, {enemy_pixel_data_6[3:0],4'h0}};

			
		end

		else if (h_count >= enemy_x_7 + 4 && h_count < enemy_x_7 + enemy_width - 3 && alive_7 && 											//health bar
					v_count >= enemy_y_7 - gap - health_bar_height && v_count < enemy_y_7 - gap ) begin

			enemy_7_health_adress <= (v_count - (enemy_y_7 - gap)) * health_bar_width + (h_count - (enemy_x_7 + 4));
			
			case (enemy_7_health_pixel_data)
				0: {o_red, o_green, o_blue} <= {8'hFF,8'h00,8'h00};
				1: {o_red, o_green, o_blue} <= {8'h00,8'hFF,8'h00};
			endcase
		end	
		
		else if (h_count >= enemy_x_7 && h_count < enemy_x_7 + enemy_width && alive_7 &&											//enemy
					v_count >= enemy_y_7 && v_count < enemy_y_7 + enemy_height) begin

			enemy_adress_7 <= (v_count - enemy_y_7) * enemy_width + (h_count - enemy_x_7);
			
			{o_red, o_green, o_blue} <= {{enemy_pixel_data_7[11:8],4'h0}, {enemy_pixel_data_7[7:4],4'h0}, {enemy_pixel_data_7[3:0],4'h0}};

			
		end
		
		else if (h_count >= enemy_x_8 + 4 && h_count < enemy_x_8 + enemy_width - 3 && alive_8 && 											//health bar
					v_count >= enemy_y_8 - gap - health_bar_height && v_count < enemy_y_8 - gap ) begin

			enemy_8_health_adress <= (v_count - (enemy_y_8 - gap)) * health_bar_width + (h_count - (enemy_x_8 + 4));
			
			case (enemy_8_health_pixel_data)
				0: {o_red, o_green, o_blue} <= {8'hFF,8'h00,8'h00};
				1: {o_red, o_green, o_blue} <= {8'h00,8'hFF,8'h00};
			endcase
		end			
		
		
		
		
		else if (h_count >= enemy_x_8 && h_count < enemy_x_8 + enemy_width && alive_8 && 											//enemy
					v_count >= enemy_y_8 && v_count < enemy_y_8 + enemy_height) begin

			enemy_adress_8 <= (v_count - enemy_y_8) * enemy_width + (h_count - enemy_x_8);
			
			{o_red, o_green, o_blue} <= {{enemy_pixel_data_8[11:8],4'h0}, {enemy_pixel_data_8[7:4],4'h0}, {enemy_pixel_data_8[3:0],4'h0}};
			
		end		
				
	
		
		else if (h_count >= digit_start_x && h_count < digit_start_x + digit_width &&												//digit1
					v_count >= digit_start_y && v_count < digit_start_y + digit_height) begin
	
			digit_address_1 <= (v_count - digit_start_y) * digit_width + (h_count - digit_start_x);
	
			if (digit_pixel_data_1) {o_red, o_green, o_blue} <= {8'hFF, 8'hFF, 8'hFF};
			else {o_red, o_green, o_blue} <= {8'ha1, 8'hbd, 8'h99};;
			
		end  
		
		else if (h_count >= digit_start_x + digit_width + 2 && h_count < digit_start_x + 2 * digit_width + 2&& 			//digit2
					v_count >= digit_start_y && v_count < digit_start_y + digit_height) begin
	
			digit_address_2 <= (v_count - digit_start_y) * digit_width + (h_count - digit_start_x - digit_width - 2);
	
			if (digit_pixel_data_2) {o_red, o_green, o_blue} <= {8'hFF, 8'hFF, 8'hFF};
			else {o_red, o_green, o_blue} <= {8'ha1, 8'hbd, 8'h99};;
			
		end  		
		
		else if (h_count >= digit_start_x + 2 * digit_width + 4 && h_count < digit_start_x + 3 * digit_width + 4&&		//digit3
					v_count >= digit_start_y && v_count < digit_start_y + digit_height) begin
	
			digit_address_3 <= (v_count - digit_start_y) * digit_width + (h_count - digit_start_x - 2 * digit_width - 4);
	
			if (digit_pixel_data_3) {o_red, o_green, o_blue} <= {8'hFF, 8'hFF, 8'hFF};
			else {o_red, o_green, o_blue} <= {8'ha1, 8'hbd, 8'h99};;
			
		end  		
		
		else if (h_count >= ss_start_x && h_count < ss_start_x + ss_width &&															//spaceship
					v_count >= ss_start_y && v_count < ss_start_y + ss_height) begin
	
			ss_pixel_address <= (v_count - ss_start_y) * ss_width + (h_count - ss_start_x);

			o_red   <= {ss_pixel_data[2], {7{ss_pixel_data[2]}}};
			o_green <= {ss_pixel_data[1], {7{ss_pixel_data[1]}}};
			o_blue  <= {ss_pixel_data[0], {7{ss_pixel_data[0]}}};
  
		end 
		
		else if (h_count >= fire_mode_start_x && h_count < fire_mode_start_x + fire_mode_width &&								//fire mode
					v_count >= fire_mode_start_y && v_count < fire_mode_start_y + fire_mode_height) begin
		  
			fire_mode_adress <= (v_count - fire_mode_start_y) * fire_mode_width + (h_count - fire_mode_start_x);
			case (fire_mode)
			0,1 : begin
						case (fire_mode_pixel_data)
							 0: {o_red, o_green, o_blue} <= {8'h52, 8'h3C, 8'h0F};
							 1: {o_red, o_green, o_blue} <= {8'hFF, 8'h7E, 8'h00};
							 2: {o_red, o_green, o_blue} <= {8'hFF, 8'hF2, 8'h00};
							 3: {o_red, o_green, o_blue} <= {8'ha1, 8'hbd, 8'h99};
						endcase
					end
					
			2,3: begin
						case (fire_mode_pixel_data)
							 0: {o_red, o_green, o_blue} <= {8'd82, 8'd60, 8'd15};
							 1: {o_red, o_green, o_blue} <= {8'hFF, 8'd0, 8'd0};
							 2: {o_red, o_green, o_blue} <= {8'd230, 8'd255, 8'd0};
							 3: {o_red, o_green, o_blue} <= {8'ha1, 8'hbd, 8'h99};
						endcase			
					end
			endcase
		end
	
		else if (h_count >= 480 && h_count < 640 &&																							//sag blank
					v_count >= 0 && v_count < 480) begin
					
			{o_red, o_green, o_blue} <= {8'ha1, 8'hbd, 8'h99};
			
		end 
		
		else if (h_count >= 0 && h_count < 480 && 				
			v_count >= 0 && v_count < 480) begin

			background_adress <= v_count * 480 + h_count;

			if (background_pixel_data) {o_red, o_green, o_blue} <= {8'hFF, 8'hFF, 8'hFF};
			else {o_red, o_green, o_blue} <= {8'h00, 8'h00, 8'h00};;
			
		end
		
	
		else begin																																		//ic blank
		
			{o_red, o_green, o_blue} <= {8'h00, 8'h00, 8'h00};

		end	
	end
	
	else begin																																			//endgame
	
		if (h_count >= end_game_start_x && h_count < end_game_start_x + end_game_width &&
			v_count >= end_game_start_y && v_count < end_game_start_y + end_game_height) begin
			
			end_game_adress <= (v_count - end_game_start_y) * end_game_width + (h_count - end_game_start_x);
			
			if (end_game_pixel_data) {o_red, o_green, o_blue} <= {8'hFF, 8'h00, 8'h00};
			else {o_red, o_green, o_blue} <= {8'h00, 8'h00, 8'h00};;
			
		end 
	
		else if (h_count >= 265 && h_count < 265 + scoreboard_width &&
					v_count >= 246 && v_count < 246 + scoreboard_height) begin
			
			scoreboard_address <= (v_count - 246) * scoreboard_width + (h_count - 265);
			
			if (scoreboard_pixel_data) {o_red, o_green, o_blue} <= {8'hFF, 8'hFF, 8'hFF};
			else {o_red, o_green, o_blue} <= {8'h00, 8'h00, 8'h00};;

		end

		else if (h_count >= 280 && h_count < 280 + digit_width &&
					v_count >= 276 && v_count < 276 + digit_height) begin

			digit_address_1 <= (v_count - 276) * digit_width + (h_count - 280);

			if (digit_pixel_data_1) {o_red, o_green, o_blue} <= {8'hFF, 8'hFF, 8'hFF};
			else {o_red, o_green, o_blue} <= {8'h00, 8'h00, 8'h00};;

		end 
		 
		 
		else if (h_count >= 280 + digit_width + 2 && h_count < 280 + 2 * digit_width + 2 &&
					v_count >= 276 && v_count < 276 + digit_height) begin
			
			digit_address_2 <= (v_count - 276) * digit_width + (h_count - 276 - digit_width - 4);
			
			if (digit_pixel_data_2) {o_red, o_green, o_blue} <= {8'hFF, 8'hFF, 8'hFF};
			else {o_red, o_green, o_blue} <= {8'h00, 8'h00, 8'h00};;

		end  
		  
		else if (h_count >= 280 + 2 * digit_width +  4 && h_count < 280 + 3 * digit_width + 4 &&
					v_count >= 276 && v_count < 276 + digit_height) begin
			
			digit_address_3 <= (v_count - 276) * digit_width + (h_count - 276 - 2 * digit_width - 8);
			
			if (digit_pixel_data_3) {o_red, o_green, o_blue} <= {8'hFF, 8'hFF, 8'hFF};
			else {o_red, o_green, o_blue} <= {8'h00, 8'h00, 8'h00};
			
		end 
			
		else begin
			{o_red, o_green, o_blue} <= {8'h00, 8'h00, 8'h00};
		end

	end
	
end

endmodule
	
