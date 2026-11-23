`include "adder_subtractor_4bit.v"

module adder_subtractor_4bit_tb;
    reg [3:0] a, b;   // Inputs
    reg cIn;          // 0 = add, 1 = subtract
    wire [3:0] s;     // Sum / difference
    wire cOut;        // Carry out

    initial begin
        $dumpfile("adder_subtractor_4bit.vcd");
        $dumpvars(0, adder_subtractor_4bit_tb);
        $monitor("a=%b, b=%b, cIn=%b | cOut=%b, s=%b", a, b, cIn, cOut, s);

        // Expected results in the comments
        a = 4'b0000; b = 4'b0000; cIn = 1'b0;     //  0 +  0: s = 0000, cOut = 0
        #5 a = 4'b0001; b = 4'b0001; cIn = 1'b0;  //  1 +  1: s = 0010, cOut = 0
        #5 a = 4'b0011; b = 4'b0010; cIn = 1'b1;  //  3 -  2: s = 0001, cOut = 1
        #5 a = 4'b0110; b = 4'b0101; cIn = 1'b1;  //  6 -  5: s = 0001, cOut = 1
        #5 a = 4'b1010; b = 4'b1010; cIn = 1'b0;  // 10 + 10: s = 0100, cOut = 1 (overflow)
        #5 a = 4'b0010; b = 4'b0101; cIn = 1'b1;  //  2 -  5: s = 1101 (-3), cOut = 0 (borrow)

        #5 $finish;
    end

    adder_subtractor_4bit dut(
        .cOut(cOut),
        .s(s),
        .a(a),
        .b(b),
        .cIn(cIn)
    );

endmodule
