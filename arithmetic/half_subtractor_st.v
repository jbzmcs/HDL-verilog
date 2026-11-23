`include "xorGate_df.v"
`include "andGate.v"
`include "notGate_df.v"
module half_subtractor_st(output diff,borr, input a,b);
    wire notOut;

    xorGate_df xorDiff(
        .a(a),
        .b(b),
        .c(diff)
    );
    notGate_df not1(
        .a(a),
        .b(notOut)
    );
    andGate andBorr(
        .a(notOut),
        .b(b),
        .c(borr)
    );

endmodule