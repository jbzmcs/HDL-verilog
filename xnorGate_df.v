module xnorGate_df(input a,b, output c);
    assign c = ~(a ^ b);
endmodule