module seven_segment_display(
input [3:0]  number,
output [6:0] hex_out);

   assign hex_out = (number == 4'h0) ? (7'b1000000) :
                    (number == 4'h1) ? (7'b1111001) :
                    (number == 4'h2) ? (7'b0100100) :
                    (number == 4'h3) ? (7'b0110000) :
                    (number == 4'h4) ? (7'b0011001) :
                    (number == 4'h5) ? (7'b0010010) :
                    (number == 4'h6) ? (7'b0000010) :
                    (number == 4'h7) ? (7'b1111000) :
                    (number == 4'h8) ? (7'b0000000) :
                    (number == 4'h9) ? (7'b0010000) :
                    (number == 4'hA) ? (7'b0001000) :
                    (number == 4'hB) ? (7'b0000011) :
                    (number == 4'hC) ? (7'b1000110) :
                    (number == 4'hD) ? (7'b0100001) :
                    (number == 4'hE) ? (7'b0000110) :
                    (number == 4'hF) ? (7'b0001110) : (7'b1111111);
endmodule
