module fire_mode_memory(
	input clk,
	input [1:0] fire_mode,
	input [10:0] address,
	output reg [1:0] pixel_data
);

reg [1:0] five_bullet [0:1151];
reg [1:0] three_bullet [0:1151];
reg [1:0] one_bullet [0:1151];


initial begin
        $readmemb("./others/fivebullet.txt", five_bullet); 
		  $readmemb("./others/threebullet.txt", three_bullet);
		  $readmemb("./others/onebullet.txt", one_bullet);
 end
 
 
  always @(posedge clk) begin
		case (fire_mode)
	 
	 0: pixel_data <= three_bullet[address];
	 1: pixel_data <= five_bullet[address];
	 2: pixel_data <= one_bullet[address];
	 3: pixel_data <= one_bullet[address];
		endcase
	end

endmodule 
