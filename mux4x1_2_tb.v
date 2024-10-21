`include "mux4x1_2.v"

module mux4x1_2_tb;
    reg i0, i1, i2, i3, S0, S1;  // Inputs
    wire Y;       // Outputs from different implementations

    initial begin
        $dumpfile("mux4x1_2.vcd");
        $dumpvars(0,mux4x1_2_tb);
        $monitor("S1=%b | S0=%b | i0=%b | i1=%b | i2=%b | i3=%b | Y=%b", 
            S1, S0, i0, i1, i2, i3, Y);
        
        // Test different input combinations
        i0 = 1; i1 = 0; i2 = 1; i3 = 0; S1 = 0; S0 = 0; #5;  
        i0 = 1; i1 = 0; i2 = 1; i3 = 0; S1 = 0; S0 = 1; #5;  
        i0 = 1; i1 = 0; i2 = 1; i3 = 0; S1 = 1; S0 = 0; #5;  
        i0 = 1; i1 = 0; i2 = 1; i3 = 0; S1 = 1; S0 = 1; #5;  
        $finish;
    end

    // Instantiate the dataflow MUX
    mux4x1_2 mux(
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .s0(S0),
        .s1(S1),
        .y(Y)
    );

endmodule
