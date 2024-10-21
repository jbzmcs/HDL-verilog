`include "notGate_df.v"
`include "xorGate_df.v"

module xnorGate_st(input a,b, output c);
    wire notOut;
    wire xorOut;

    //instantiate xor gate
    xorGate_df xorA(a,b,xorOut);

    //instantiate not gate
    notGate_df notW(xorOut, c);
endmodule