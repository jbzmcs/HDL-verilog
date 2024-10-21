module full_adder_bh(output reg sum,carry, input a,b,c);
    always @(*) begin
        sum = a ^ b ^ c;
        carry = (((a ^ b)&c) ^ (a&b));
    end 
endmodule