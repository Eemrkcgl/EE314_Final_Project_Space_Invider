module random_generator(
    input clk,
    output [47:0] random_number
);

    reg [47:0] lfsr;
    reg flag = 0;

    always @(posedge clk) begin
        if (~flag) begin
            lfsr <= 48'hAB40F19C; 
            flag <= 1;
        end else begin
            // Use a set of taps that better distribute ones across all 48 bits
            lfsr <= {lfsr[46:0], lfsr[47] ^ lfsr[42] ^ lfsr[39] ^ lfsr[38]};
        end
    end

    assign random_number = lfsr;
endmodule
