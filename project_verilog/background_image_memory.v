module background_image_memory(
	input clk,
	input [17:0] adress,
	output reg pixel_data
);

	reg background_image [0:230399];
	
	initial begin
			  $readmemb("./others/background.txt", background_image); 
	end
 
  always @(posedge clk) begin
		 pixel_data <= background_image[adress];
  end
endmodule

