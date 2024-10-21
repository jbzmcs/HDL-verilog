`include "notGate_df.v"
`include "andGate.v"
`include "orGateLab1_df.v"
module xorGate_st(input a,b, output c);
    wire notA, notB;
    wire and_out1, and_out2;
// instantiate not gate
    notGate_df notX(a,notA);
    notGate_df notY(b,notB);
// instantiate and gate
    andGate andX(notA,b,and_out1);
    andGate andY(a,notB,and_out2);
// instatiate or gate
    orGateLab1_df orX(and_out1,and_out2,c);
endmodule