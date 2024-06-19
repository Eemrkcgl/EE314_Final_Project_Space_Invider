module enemies_memory(
	input clk,
	input [1:0] enemy_type,
	input [11:0] adress,
	output reg[11:0] pixel_data
);

	reg [11:0] enemy1 [0:1520];
	reg [11:0] enemy2 [0:1520];
	reg [11:0] enemy3 [0:1520];

	initial begin
			  $readmemb("./others/alien1.txt", enemy1); 
			  $readmemb("./others/alien2.txt", enemy2);
			  $readmemb("./others/alien3.txt", enemy3);
	end
 
  always @(posedge clk) begin
		case (enemy_type)
			0: pixel_data <= enemy1[adress];
			1: pixel_data <= enemy2[adress];
			2:	pixel_data <= enemy3[adress];
			3: pixel_data <= enemy3[adress];
		endcase
  end
endmodule
