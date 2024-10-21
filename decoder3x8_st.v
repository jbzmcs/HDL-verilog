`include "notGate_df.v"  // (input a, output b)
`include "andGate.v"     // (input a, b, output c)

module decoder3x8_st(input [2:0] A, input E, output [7:0] Y);

    wire nA0, nA1, nA2;
    wire and1_out0, and1_out1, and1_out2, and1_out3;
    wire and2_out0, and2_out1, and2_out2, and2_out3;
    wire and3_out0, and3_out1, and3_out2, and3_out3;
    wire and4_out0, and4_out1, and4_out2, and4_out3;

    // NOT gates for A[2:0]
    notGate_df U1 (.a(A[0]), .b(nA0));  // nA0 = ~A[0]
    notGate_df U2 (.a(A[1]), .b(nA1));  // nA1 = ~A[1]
    notGate_df U3 (.a(A[2]), .b(nA2));  // nA2 = ~A[2]

    // AND gates for Y[0]
    andGate U4 (.a(nA2), .b(nA1), .c(and1_out0));  // nA2 & nA1
    andGate U5 (.a(and1_out0), .b(nA0), .c(and2_out0));  // (nA2 & nA1) & nA0
    andGate U6 (.a(and2_out0), .b(E), .c(Y[0]));  // (nA2 & nA1 & nA0) & E

    // AND gates for Y[1]
    andGate U7 (.a(nA2), .b(nA1), .c(and1_out1));  // nA2 & nA1
    andGate U8 (.a(and1_out1), .b(A[0]), .c(and2_out1));  // (nA2 & nA1) & A[0]
    andGate U9 (.a(and2_out1), .b(E), .c(Y[1]));  // (nA2 & nA1 & A[0]) & E

    // AND gates for Y[2]
    andGate U10 (.a(nA2), .b(A[1]), .c(and1_out2));  // nA2 & A[1]
    andGate U11 (.a(and1_out2), .b(nA0), .c(and2_out2));  // (nA2 & A[1]) & nA0
    andGate U12 (.a(and2_out2), .b(E), .c(Y[2]));  // (nA2 & A[1] & nA0) & E

    // AND gates for Y[3]
    andGate U13 (.a(nA2), .b(A[1]), .c(and1_out3));  // nA2 & A[1]
    andGate U14 (.a(and1_out3), .b(A[0]), .c(and2_out3));  // (nA2 & A[1]) & A[0]
    andGate U15 (.a(and2_out3), .b(E), .c(Y[3]));  // (nA2 & A[1] & A[0]) & E

    // AND gates for Y[4]
    andGate U16 (.a(A[2]), .b(nA1), .c(and3_out0));  // A[2] & nA1
    andGate U17 (.a(and3_out0), .b(nA0), .c(and4_out0));  // (A[2] & nA1) & nA0
    andGate U18 (.a(and4_out0), .b(E), .c(Y[4]));  // (A[2] & nA1 & nA0) & E

    // AND gates for Y[5]
    andGate U19 (.a(A[2]), .b(nA1), .c(and3_out1));  // A[2] & nA1
    andGate U20 (.a(and3_out1), .b(A[0]), .c(and4_out1));  // (A[2] & nA1) & A[0]
    andGate U21 (.a(and4_out1), .b(E), .c(Y[5]));  // (A[2] & nA1 & A[0]) & E

    // AND gates for Y[6]
    andGate U22 (.a(A[2]), .b(A[1]), .c(and3_out2));  // A[2] & A[1]
    andGate U23 (.a(and3_out2), .b(nA0), .c(and4_out2));  // (A[2] & A[1]) & nA0
    andGate U24 (.a(and4_out2), .b(E), .c(Y[6]));  // (A[2] & A[1] & nA0) & E

    // AND gates for Y[7]
    andGate U25 (.a(A[2]), .b(A[1]), .c(and3_out3));  // A[2] & A[1]
    andGate U26 (.a(and3_out3), .b(A[0]), .c(and4_out3));  // (A[2] & A[1]) & A[0]
    andGate U27 (.a(and4_out3), .b(E), .c(Y[7]));  // (A[2] & A[1] & A[0]) & E

endmodule
