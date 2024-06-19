module score_to_bcd(
   input [9:0] bin,
   output reg [3:0] digit_3,
	output reg [3:0] digit_2,
	output reg [3:0] digit_1
   );
reg [11:0] bcd;

integer i;

always @(bin) begin
    bcd=0;		 	
    for (i=0;i<10;i=i+1) begin					//Iterate once for each bit in input number
        if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
	if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
	if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
	bcd = {bcd[10:0],bin[9-i]};				//Shift one bit, and shift in proper bit from input 
   end
	digit_3<=bcd[11:8];
	digit_2<=bcd[7:4];
	digit_1<=bcd[3:0];
end
endmodule