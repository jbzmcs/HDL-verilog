module mux4x1_df(input i0, i1, i2, i3, input S0, S1, output Y);
    assign Y = (i0 & ~S1 & ~S0) | (i1 & ~S1 & S0) | (i2 & S1 & ~S0) |(i3 & S1 & S0);
endmodule
