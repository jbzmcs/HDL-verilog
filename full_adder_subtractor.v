`include "xorGate_df.v"
`include "full_adder_df.v"

module full_adder_subtractor(
    output [4:0] cOut,     // carry output
    output [3:0] s,        // Sum output
    input [3:0] a, b,      // 4-bit inputs
    input cIn              // Carry input (0 for addition, 1 for subtraction)
);

    wire [3:0] xorOut;    // Intermediate XOR outputs for subtraction
    wire [3:0] carry;     // Internal carry signals between adders

    // Instantiate XOR gates for subtraction (if cIn=1, negate b)
    xorGate_df xor0(.a(cIn), .b(b[0]), .c(xorOut[0]));
    xorGate_df xor1(.a(cIn), .b(b[1]), .c(xorOut[1]));
    xorGate_df xor2(.a(cIn), .b(b[2]), .c(xorOut[2]));
    xorGate_df xor3(.a(cIn), .b(b[3]), .c(xorOut[3]));

    // Instantiate 4 full adders for the 4-bit adder-subtractor
    full_adder_df fa0(.sum(s[0]), .carry(carry[0]), .a(a[0]), .b(xorOut[0]), .c(cIn));
    full_adder_df fa1(.sum(s[1]), .carry(carry[1]), .a(a[1]), .b(xorOut[1]), .c(carry[0]));
    full_adder_df fa2(.sum(s[2]), .carry(carry[2]), .a(a[2]), .b(xorOut[2]), .c(carry[1]));
    full_adder_df fa3(.sum(s[3]), .carry(cOut[3]), .a(a[3]), .b(xorOut[3]), .c(carry[2]));

    // Final carry out
    assign cOut[4] = cOut[3];  // Carry out from the last full adder

endmodule
