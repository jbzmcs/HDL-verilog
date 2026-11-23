module half_adder_df(sum,carry,a,b);
    output sum,carry;
    input a,b;
    
    assign sum = a ^ b;
    assign carry = a & b;
endmodule 