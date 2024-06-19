module end_game_image_memory(
	input clk, 
	input [14:0] address,
	output reg [1:0] pixel_data
);

reg end_game_image [10299:0];

initial begin
        $readmemb("./others/end_game_image.txt", end_game_image); 
 end
 
 
  always @(posedge clk) begin
		pixel_data <= end_game_image[address];
    end

endmodule