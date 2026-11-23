module full_subtractor_bh(output reg diff, borr, input a,b,c);
    always @(a,b,c) begin
        diff = a ^ b ^ c;
        borr = ~a&b | b&c | ~a&c;
    end 
endmodule