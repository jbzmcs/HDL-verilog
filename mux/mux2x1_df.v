module mux2x1_df(i0,i1,s,y);
    input i0,i1,s;
    output y;
    assign  y = (i0&(~s)| (s&i1));
endmodule