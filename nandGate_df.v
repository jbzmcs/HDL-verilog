module nandGate_df(input  a,b, output  c);
    assign c = ~(a & b);
endmodule