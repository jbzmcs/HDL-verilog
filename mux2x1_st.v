`include "andGate.v"
`include "notGate_df.v"
`include "orGateLab1_df.v"
module mux2x1_st(input i0,i1,s, output y);
    wire net1,net2,net3;

    notGate_df g1(s,net1);
    andGate g2(i1,s,net2);
    andGate g3(i0,net1,net3);
    orGateLab1_df g4(net3,net2, y); //input a, b, output c
endmodule