`include "xorGate_df.v"
`include "full_adder_df.v"

// 4-bit ripple-carry adder/subtractor.
// cIn = 0: s = a + b.  cIn = 1: s = a - b (b is inverted and cIn adds the 1).
// In subtract mode cOut = 1 means no borrow (a >= b).
module adder_subtractor_4bit(
    output cOut,           // Carry out of the last stage
    output [3:0] s,        // Sum / difference
    input [3:0] a, b,      // 4-bit inputs
    input cIn              // 0 for addition, 1 for subtraction
);

    wire [3:0] xorOut;    // b, or ~b when subtracting
    wire [2:0] carry;     // Internal carries between stages

    // XOR gates invert b when cIn = 1
    xorGate_df xor0(.a(cIn), .b(b[0]), .c(xorOut[0]));
    xorGate_df xor1(.a(cIn), .b(b[1]), .c(xorOut[1]));
    xorGate_df xor2(.a(cIn), .b(b[2]), .c(xorOut[2]));
    xorGate_df xor3(.a(cIn), .b(b[3]), .c(xorOut[3]));

    // Four chained full adders
    full_adder_df fa0(.sum(s[0]), .carry(carry[0]), .a(a[0]), .b(xorOut[0]), .c(cIn));
    full_adder_df fa1(.sum(s[1]), .carry(carry[1]), .a(a[1]), .b(xorOut[1]), .c(carry[0]));
    full_adder_df fa2(.sum(s[2]), .carry(carry[2]), .a(a[2]), .b(xorOut[2]), .c(carry[1]));
    full_adder_df fa3(.sum(s[3]), .carry(cOut),     .a(a[3]), .b(xorOut[3]), .c(carry[2]));

endmodule
