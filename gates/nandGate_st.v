`include "andGate.v"
`include "notGate_df.v"
module nandGate_st(input a, b, output c);
    wire andOut;

    andGate and1(a, b, andOut);
    notGate_df not1(andOut, c);
endmodule