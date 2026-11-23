`include "notGate_df.v"
`include "andGate.v"
`include "orGate_df.v"
module mux4x1_st(input i0, i1, i2, i3, input s0, s1, output y);
    wire s0not,s1not; // selector not output
    wire andA,andB; //output for 1st AND
    wire andC,andD; //output for 2nd AND
    wire andE,andF; //output for 3rd AND
    wire andG,andH; //output for 4th AND
    wire orA,orB;

    // Invert select signals (input a, output b)
    notGate_df notA(s0,s0not);
    notGate_df notB(s1,s1not);

    // AND gates for each input and select combination (input a,b, ouput c)
    andGate andA0(i0,s1not,andA); 
    andGate andB0(andA,s0not,andB); //output for 1st AND

    andGate andA1(i1,s1not,andC);
    andGate andB1(andC,s0,andD); //output for 2nd AND

    andGate andA2(i2,s1,andE);
    andGate andB2(andE,s0not,andF); // output for 3rd AND

    andGate andA3(i3,s1,andG);
    andGate andB3(andG,s0,andH); // output for 4th AND

    // OR gate to combine the results (input a, b, output c)
    orGate_df or1(andB,andD,orA);
    orGate_df or2(andF,andH,orB);
    orGate_df or3(orA,orB,y); //Output Y
    
endmodule
