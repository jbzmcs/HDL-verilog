`include "xorGate_df.v"
`include "andGate.v"
module halfAdder_st(sum, carry, a,b);
    output sum, carry;
    input a,b;

    xorGate_df xor1(
        .c(sum),
        .a(a),
        .b(b)
    );
    andGate and1(
        .c(carry),
        .a(a),
        .b(b)
    );
endmodule