module digits_memory(
    input clk,
    input [3:0] digit,
    input [9:0] address,
    output reg q
);
    reg  zero [575:0];
    reg  one [575:0];
    reg  two [575:0];
    reg  three[575:0];
    reg  four[575:0];
    reg  five[575:0];
    reg  six[575:0];
    reg  seven[575:0];
    reg  eight[575:0];
    reg  nine[575:0];

    initial begin
        $readmemb("./others/zero.txt", zero); 
        $readmemb("./others/one.txt", one); 
        $readmemb("./others/two.txt", two); 
        $readmemb("./others/three.txt", three); 
        $readmemb("./others/four.txt", four); 
        $readmemb("./others/five.txt", five);
        $readmemb("./others/six.txt", six); 
        $readmemb("./others/seven.txt", seven); 
        $readmemb("./others/eight.txt", eight);
        $readmemb("./others/nine.txt", nine); 
    end

    always @(posedge clk) begin
        case(digit)
            0: q <= zero[address];
            1: q <= one[address];
            2: q <= two[address];
            3: q <= three[address];
            4: q <= four[address];
            5: q <= five[address];
            6: q <= six[address];
            7: q <= seven[address];
            8: q <= eight[address];
            9: q <= nine[address];    
        endcase
    end
endmodule
