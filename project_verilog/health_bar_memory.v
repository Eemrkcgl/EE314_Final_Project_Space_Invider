module health_bar_memory (
    input clk,
    input [3:0] health,
    input [7:0] address,
    output reg pixel_data
);

    reg h_0  [0:127];
    reg h_1  [0:127];
    reg h_2  [0:127];
    reg h_3  [0:127];
    reg h_4  [0:127];
    reg h_5  [0:127];
    reg h_6  [0:127];
    reg h_7  [0:127];
    reg h_8  [0:127];
    reg h_9  [0:127];
    reg h_10 [0:127];
    reg h_11 [0:127];
    reg h_12 [0:127];
    reg h_13 [0:127];
    reg h_14 [0:127];
    reg h_15 [0:127];
	 
    initial begin
        $readmemb("./health_bar_images/one.txt",      h_0);
        $readmemb("./health_bar_images/two.txt",      h_1);
        $readmemb("./health_bar_images/three.txt",    h_2);
        $readmemb("./health_bar_images/four.txt",     h_3);
        $readmemb("./health_bar_images/five.txt",     h_4);
        $readmemb("./health_bar_images/six.txt",      h_5);
        $readmemb("./health_bar_images/seven.txt",    h_6);
        $readmemb("./health_bar_images/eight.txt",    h_7);
        $readmemb("./health_bar_images/nine.txt",     h_8);
        $readmemb("./health_bar_images/ten.txt",      h_9);
        $readmemb("./health_bar_images/eleven.txt",   h_10);
        $readmemb("./health_bar_images/twelve.txt",   h_11);
        $readmemb("./health_bar_images/thirteen.txt", h_12);
        $readmemb("./health_bar_images/fourteen.txt", h_13);
        $readmemb("./health_bar_images/fifteen.txt",  h_14);
        $readmemb("./health_bar_images/sixteen.txt",  h_15);	  
    end

    always @(posedge clk) begin
        case(health)
            0:  pixel_data <=  h_0 [address];
            1:  pixel_data <=  h_1 [address];
            2:  pixel_data <=  h_2 [address];
            3:  pixel_data <=  h_3 [address];
            4:  pixel_data <=  h_4 [address];
            5:  pixel_data <=  h_5 [address];
            6:  pixel_data <=  h_6 [address];
            7:  pixel_data <=  h_7 [address];
            8:  pixel_data <=  h_8 [address];
            9:  pixel_data <=  h_9 [address];
            10: pixel_data <=  h_10[address];
            11: pixel_data <=  h_11[address];
            12: pixel_data <=  h_12[address];
            13: pixel_data <=  h_13[address];
            14: pixel_data <=  h_14[address];
            15: pixel_data <=  h_15[address];
        endcase
    end
endmodule
