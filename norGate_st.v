`include "orGateLab1_df.v"
`include "notGate_df.v"
module norGate_st(input a,b, output c);
    wire orOut;

    orGateLab1_df or2(a,b,orOut);
    notGate_df not2(orOut,c);
endmodule