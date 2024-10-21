`include "andGate.v" // (input a,b, output y)
`include "orGate_df.v" // (input a,b, output y)
`include "notGate_df.v" // (input a, output y)

module mux8x1_st(
    input I0, I1, I2, I3, I4, I5, I6, I7, // Inputs
    input S0, S1, S2,                     // Select lines
    output Y                              // Output
);

    wire S0n, S1n, S2n; // Inverted select lines
    wire D0, D1, D2, D3, D4, D5, D6, D7; // AND gate outputs
    // inner AND gate outputs
    wire E1,E2; 
    wire E3,E4; 
    wire E5,E6;
    wire E7,E8;
    wire E9,E10;
    wire E11,E12;
    wire E13,E14;
    wire E15,E16; 
    
    // Invert the select lines using notGate_df
    notGate_df not0(S0, S0n); // S0 not
    notGate_df not1(S1, S1n); // S1 not
    notGate_df not2(S2, S2n); // S2 not

    //for D0 AND gate (S2n, S1n, S0n)
    andGate and1(S2n, S1n, E1);
    andGate and2(S0n, I0, E2);
    andGate and_D0(E1, E2, D0); // D0 output

    //for D1 AND gate (S2n, S1n, S0)
    andGate and3(S2n, S1n, E3);
    andGate and4(S0, I1, E4);
    andGate and_D1(E3, E4, D1); // D1 output

    //for D2 AND gate (S2n, S1, S0n)
    andGate and5(S2n, S1, E5);
    andGate and6(S0n, I2, E6);
    andGate and_D2(E5, E6, D2); // D2 output

    //for D3 AND gate (S2n, S1, S0)
    andGate and7(S2n, S1, E7);
    andGate and8(S0, I3, E8);
    andGate and_D3(E7, E8, D3); // D3 output

    //for D4 AND gate (S2, S1n, S0n)
    andGate and9(S2, S1n, E9);
    andGate and10(S0n, I4, E10);
    andGate and_D4(E9, E10, D4); // D4 output
    
    //for D5 AND gate (S2, S1n, S0)
    andGate and11(S2, S1n, E11);
    andGate and12(S0, I5, E12);
    andGate and_D5(E11, E12, D5); // D5 output

    //for D6 AND gate (S2, S1, S0n)
    andGate and13(S2, S1, E13);
    andGate and14(S0n, I6, E14);
    andGate and_D6(E13, E14, D6); // D6 output

    //for D7 AND gate (S2, S1, S0)
    andGate and15(S2, S1, E15);
    andGate and16(S0, I7, D7); // D7 output

    // OR gate to combine all AND outputs
    wire OR1, OR2, OR3, OR4, ORFinal1, ORFinal2; // Additional intermediate wires

    orGate_df or1(D0, D1, OR1);
    orGate_df or2(D2, D3, OR2);
    orGate_df or3(D4, D5, OR3);
    orGate_df or4(D6, D7, OR4);
    
    orGate_df orFinal1(OR1, OR2, ORFinal1); 
    orGate_df orFinal2(OR3, OR4, ORFinal2);
    
    orGate_df finalOr(ORFinal1, ORFinal2, Y);  // Finally assign to Y

endmodule
