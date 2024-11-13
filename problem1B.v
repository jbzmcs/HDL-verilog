`include "norGate_df.v"
`include "notGate_df.v"
`include "And.v"

module problem1B (input A, B, output Y);
    wire not1, not2;
    wire and1, and2;
    
// instantiate not gate (input a, output b)
notGate_df notA(A,not1);
notGate_df notB(B,not2);
// instantiate and gate (input a,b, ouput c)
And andA(A,not1,and1);
And andB(B,not2,and2);
// instantiate or gate  (input a, b, output c)
norGate_df out(and1,and2,Y); 

endmodule
