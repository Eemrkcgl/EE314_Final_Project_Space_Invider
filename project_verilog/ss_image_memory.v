module ss_image_memory (
    input clk,
    input [3:0] ss_angle_state,
    input [18:0] address,
    output reg [2:0] pixel_data
);

    reg [2:0] ss_0  [0:5624];
    reg [2:0] ss_1  [0:5624];
    reg [2:0] ss_2  [0:5624];
    reg [2:0] ss_3  [0:5624];
    reg [2:0] ss_4  [0:5624];
    reg [2:0] ss_5  [0:5624];
    reg [2:0] ss_6  [0:5624];
    reg [2:0] ss_7  [0:5624];
    reg [2:0] ss_8  [0:5624];
    reg [2:0] ss_9  [0:5624];
    reg [2:0] ss_10 [0:5624];
    reg [2:0] ss_11 [0:5624];
    reg [2:0] ss_12 [0:5624];
    reg [2:0] ss_13 [0:5624];
    reg [2:0] ss_14 [0:5624];
    reg [2:0] ss_15 [0:5624];
	 
    initial begin
        $readmemb("./ss_images/ss_0.txt", ss_0);
        $readmemb("./ss_images/ss_1.txt", ss_1);
        $readmemb("./ss_images/ss_2.txt", ss_2);
        $readmemb("./ss_images/ss_3.txt", ss_3);
        $readmemb("./ss_images/ss_4.txt", ss_4);
        $readmemb("./ss_images/ss_5.txt", ss_5);
        $readmemb("./ss_images/ss_6.txt", ss_6);
        $readmemb("./ss_images/ss_7.txt", ss_7);
        $readmemb("./ss_images/ss_8.txt", ss_8);
        $readmemb("./ss_images/ss_9.txt", ss_9);
        $readmemb("./ss_images/ss_10.txt", ss_10);
        $readmemb("./ss_images/ss_11.txt", ss_11);
        $readmemb("./ss_images/ss_12.txt", ss_12);
        $readmemb("./ss_images/ss_13.txt", ss_13);
        $readmemb("./ss_images/ss_14.txt", ss_14);
        $readmemb("./ss_images/ss_15.txt", ss_15);
		  
		  
    end

    always @(posedge clk) begin
        case(ss_angle_state)
            4'd0:  pixel_data <= ss_0[address];
            4'd1:  pixel_data <= ss_1[address];
            4'd2:  pixel_data <= ss_2[address];
            4'd3:  pixel_data <= ss_3[address];
            4'd4:  pixel_data <= ss_4[address];
            4'd5:  pixel_data <= ss_5[address];
            4'd6:  pixel_data <= ss_6[address];
            4'd7:  pixel_data <= ss_7[address];
            4'd8:  pixel_data <= ss_8[address];
            4'd9:  pixel_data <= ss_9[address];
            4'd10: pixel_data <= ss_10[address];
            4'd11: pixel_data <= ss_11[address];
            4'd12: pixel_data <= ss_12[address];
            4'd13: pixel_data <= ss_13[address];
            4'd14: pixel_data <= ss_14[address];
            4'd15: pixel_data <= ss_15[address];
				
        endcase
    end

endmodule
