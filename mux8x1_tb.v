`include "mux8x1_df.v"
`include "mux8x1_bh.v"
`include "mux8x1_st.v"
module mux8x1_tb;
    reg s0,s1,s2; // selectors
    reg i0,i1,i2,i3,i4,i5,i6,i7; // inputs
    wire y_df, y_bh, y_st; //outputs

    initial begin
        $dumpfile("mux8x1.vcd");
        $dumpvars(0, mux8x1_tb);
        $monitor ("S2 S1 S0 = %b%b%b, y_df = %b, y_bh = %b, y_st = %b",
        s2, s1, s0, y_df, y_bh, y_st);

    // Set input values: alternating 1's and 0's for simplicity
    i0 = 0; i1 = 1; i2 = 0; i3 = 1;
    i4 = 0; i5 = 1; i6 = 0; i7 = 1;
    // Test cases
    s2 = 0; s1 = 0; s0 = 0; #10; // Select I0
    s2 = 0; s1 = 0; s0 = 1; #10; // Select I1
    s2 = 0; s1 = 1; s0 = 0; #10; // Select I2
    s2 = 0; s1 = 1; s0 = 1; #10; // Select I3
    s2 = 1; s1 = 0; s0 = 0; #10; // Select I4
    s2 = 1; s1 = 0; s0 = 1; #10; // Select I5
    s2 = 1; s1 = 1; s0 = 0; #10; // Select I6
    s2 = 1; s1 = 1; s0 = 1; #10; // Select I7
    end


    //Instantiate mux8x1_df 
    mux8x1_df m8x1_df(
        .I0(i0), .I1(i1), .I2(i2), .I3(i3), 
        .I4(i4), .I5(i5), .I6(i6), .I7(i7),
        .S0(s0), .S1(s1), .S2(s2), 
        .Y(y_df)
    );
    //Instantiate mux8x1_df
    mux8x1_bh m8x1_bh(
        .S0(s0), .S1(s1), .S2(s2), 
        .I0(i0), .I1(i1), .I2(i2), .I3(i3), 
        .I4(i4), .I5(i5), .I6(i6), .I7(i7), 
        .Y(y_bh)
    );
    // Instantiate mux8x1_st
    mux8x1_st m8x1_st(
        .S0(s0), .S1(s1), .S2(s2), 
        .I0(i0), .I1(i1), .I2(i2), .I3(i3), 
        .I4(i4), .I5(i5), .I6(i6), .I7(i7), 
        .Y(y_st)
    );


endmodule   