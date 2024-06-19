module scoreboard_memory(
	input clk,
	input [11:0] address,
	output reg scoreboard_pixel_data
);

	reg scoreboard [0:2639];

	initial begin
			  $readmemb("./others/score.txt", scoreboard); 
	 end

	always @(posedge clk) begin
			scoreboard_pixel_data <= scoreboard[address];
	end
	
endmodule







