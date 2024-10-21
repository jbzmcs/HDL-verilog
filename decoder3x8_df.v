module decoder3x8_df(input [2:0]A, input E, output [7:0]Y);
    assign Y[0] = ~A[2] & ~A[1] & ~A[0] & E;
    assign Y[1] = ~A[2] & ~A[1] &  A[0] & E;
    assign Y[2] = ~A[2] &  A[1] & ~A[0] & E;
    assign Y[3] = ~A[2] &  A[1] &  A[0] & E;
    assign Y[4] =  A[2] & ~A[1] & ~A[0] & E;
    assign Y[5] =  A[2] & ~A[1] &  A[0] & E;
    assign Y[6] =  A[2] &  A[1] & ~A[0] & E;
    assign Y[7] =  A[2] &  A[1] &  A[0] & E;
endmodule
