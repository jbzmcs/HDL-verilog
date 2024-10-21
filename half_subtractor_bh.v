module half_subtractor_bh(output reg diff,borr, input a,b);
    always @(a,b) begin
        diff = a ^ b;
        borr = ~a&b;
    end   
endmodule