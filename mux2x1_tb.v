`include "mux2x1_df.v"
`include "mux2x1_bh.v"
`include "mux2x1_st.v"
module mux2x1_tb;
    reg s,i0,i1;  // Inputs
    wire y_df, y_bh, y_st; //Outputs
    initial begin
        $dumpfile("mux2x1.vcd");
        $dumpvars(0, mux2x1_tb);
        $monitor("s=%b | i0=%b | i1=%b | y_df=%b | y_bh=%b | y_st=%b", 
                s,i0,i1,y_df,y_bh,y_st);
        // Test different input combinations
        s = 0; i0 = 0; i1 = 0;
        #5 s = 0; i0 = 0; i1 = 1;
        #5 s = 0; i0 = 1; i1 = 0;
        #5 s = 0; i0 = 1; i1 = 1;
        #5 s = 1; i0 = 0; i1 = 0;
        #5 s = 1; i0 = 0; i1 = 1;
        #5 s = 1; i0 = 1; i1 = 0;
        #5 s = 1; i0 = 1; i1 = 1;
        #5 $finish;
    end
    // Instantiate 2x1mux_df (dataflow) input i0,i1,s, output y
    mux2x1_df mux1(
        .i0(i0),
        .i1(i1),
        .s(s),
        .y(y_df)
    );
    mux2x1_bh mux2(
        .i0(i0),
        .i1(i1),
        .s(s),
        .y(y_bh)
    );
    mux2x1_st mux3(
        .i0(i0),
        .i1(i1),
        .s(s),
        .y(y_st)
    );

endmodule
