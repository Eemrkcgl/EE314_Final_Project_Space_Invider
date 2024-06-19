module input_controller(
	input clk,
	input rotate_cw_button,
	input rotate_ccw_button,
	input fire_button,
	input [1:0] fire_mode_switch,
	
	output reg [3:0] ss_angle_state,
	output reg fire,
	output reg [1:0] fire_mode
);

	reg rotate_right_sync;
	reg rotate_left_sync;
	reg rotate_right_sync_prev;
	reg rotate_left_sync_prev;

   always @(posedge clk) begin 
       rotate_right_sync <= rotate_cw_button;
       rotate_left_sync <= rotate_ccw_button;
       rotate_right_sync_prev <= rotate_right_sync;
       rotate_left_sync_prev <= rotate_left_sync;
   end

   always @(posedge clk) begin
       if (rotate_left_sync && !rotate_left_sync_prev) begin
           ss_angle_state <= ss_angle_state - 1;
       end else if (rotate_right_sync && !rotate_right_sync_prev) begin
           ss_angle_state <= ss_angle_state + 1;
       end
		 
		 if (fire_button) fire <= 1;
		 else fire <= 0;
		 
		 case(fire_mode_switch) 
			0: fire_mode = 0;
			1: fire_mode = 1;
			2: fire_mode = 2;
			3: fire_mode = 2;
		 endcase
   end
	
endmodule

