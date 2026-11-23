`include "xorGate_df.v"
`include "andGate.v"

module full_adder_st(output sum, carry, input a,b,c);
    wire xorOut1, xorOut2, xorOut3;
    wire andOut1, andOut2;

    // instantiate xor gates
    xorGate_df xorA(a,b,xorOut1);
    xorGate_df xorB(xorOut1,c,sum); //sum
    xorGate_df xorC(andOut1,andOut2,carry); //carry

    // instantiate and gates
    andGate andA(xorOut1,c,andOut1);
    andGate andB(a,b,andOut2);

endmodule