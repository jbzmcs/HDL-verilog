`include "mux2x1_df.v"
module mux4x1_2(input i0, i1, i2, i3, input s0, s1, output y);
    wire muxOut1,muxOut2;
    
    
    mux2x1_df mux1(i0, i1, s0, muxOut1); //(input i0,i1,s, ouput y)
    mux2x1_df mux2(i2,i3,s0,muxOut2);
    mux2x1_df mux3(muxOut1,muxOut2,s1,y); // output mux
    
endmodule