module full_subtractor_df(output diff,borr, input a,b,c);
    assign diff = a ^ b ^ c;
    assign borr = ~a&b | b&c | ~a&c;
endmodule