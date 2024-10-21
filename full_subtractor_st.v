`include "xorGate_df.v"
`include "notGate_df.v"
`include "andGate.v"
`include "orGateLab1_df.v"

module full_subtractor_st(output diff,borr, input a,b,c);
    wire xorOut1, xorOut2; 
    wire notOut1, notOut2;
    wire andOut1, andOut2;

    //instantiate xor gates
    xorGate_df xor1(a,b,xorOut1);
    xorGate_df xor2(xorOut1,c,diff);

    //instantiate not gates
    notGate_df not1(a,notOut1);
    notGate_df not2(xorOut1,notOut2);

    //instantiate and gates
    andGate and1(notOut1,b,andOut1);
    andGate and2(notOut2,c,andOut2);

    //instantite or gate
    orGateLab1_df or1(andOut2,andOut1,borr);
endmodule