`include "full_adder_subtractor.v"

module full_adder_subtractor_tb;
    reg [0:3] a, b;          // Input registers for the testbench
    reg cIn;                 // Input carry for the testbench
    wire [0:3] s;            // Sum output from the full_adder_subtractor
    wire [0:4] cOut;         // Carry output from the full_adder_subtractor

    initial begin
        // Initialize waveform file generation
        $dumpfile("full_adder_subtractor.vcd");
        $dumpvars(0, full_adder_subtractor_tb);
        $monitor("a=%b, b=%b, cIn=%b |cOut=%b, s=%b", a, b, cIn, s, cOut);

        // Test various combinations of inputs with expected results

        a = 4'b0000; b = 4'b0000; cIn = 1'b0;  // s = 0000, cOut = 00000 -> 0
        #5 a = 4'b0001; b = 4'b0001; cIn = 1'b0;  // s = 0010, cOut = 00000 -> 2
        #5 a = 4'b0011; b = 4'b0010; cIn = 1'b1;  // s = 0110, cOut = 00001 -> 6
        #5 a = 4'b0110; b = 4'b0101; cIn = 1'b1;  // s = 1011, cOut = 00001 -> 11
        #5 a = 4'b1010; b = 4'b1010; cIn = 1'b0;  // s = 0100, cOut = 00011 -> 4
        #5 a = 4'b1111; b = 4'b1111; cIn = 1'b1;  // s = 1111, cOut = 00011 -> 15

        #5 $finish;
    end

    // Instantiate the full_adder_subtractor module
    full_adder_subtractor fa_sub(
        .cOut(cOut),
        .s(s),
        .a(a),
        .b(b),
        .cIn(cIn)
    );

endmodule
