module full_adder_df(output sum, carry, input a,b,c);
    assign sum = (a ^ b) ^ c;
    assign carry = (((a ^ b)&c) ^ (a&b));
endmodule