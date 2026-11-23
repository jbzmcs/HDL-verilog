`include "mux4x1_df.v"
`include "mux4x1_bh.v"
`include "mux4x1_st.v"

module mux4x1_tb;
    reg i0, i1, i2, i3, S0, S1;  // Inputs
    wire Y_df, Y_bh, Y_st;       // Outputs from different implementations

    initial begin
        $dumpfile("mux4x1.vcd");
        $dumpvars(0, mux4x1_tb);
        $monitor("S1=%b | S0=%b | i0=%b | i1=%b | i2=%b | i3=%b | Y_df=%b | Y_bh=%b | Y_st=%b", 
            S1, S0, i0, i1, i2, i3, Y_df, Y_bh, Y_st);
        
        // Test different input combinations
        i0 = 1; i1 = 0; i2 = 1; i3 = 0; S1 = 0; S0 = 0; #5;  
        i0 = 1; i1 = 0; i2 = 1; i3 = 0; S1 = 0; S0 = 1; #5;  
        i0 = 1; i1 = 0; i2 = 1; i3 = 0; S1 = 1; S0 = 0; #5;  
        i0 = 1; i1 = 0; i2 = 1; i3 = 0; S1 = 1; S0 = 1; #5;  
        $finish;
    end

    // Instantiate the dataflow MUX
    mux4x1_df mux_df (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .S0(S0),
        .S1(S1),
        .Y(Y_df)
    );

    // Instantiate the behavioral MUX
    mux4x1_bh mux_bh (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .S0(S0),
        .S1(S1),
        .Y(Y_bh)
    );

    // Instantiate the structural MUX
    mux4x1_st mux_st (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .s0(S0),
        .s1(S1),
        .y(Y_st)
    );
endmodule
