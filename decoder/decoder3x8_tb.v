`include "decoder3x8_df.v"
`include "decoder3x8_bh.v"
`include "decoder3x8_st.v"

module decoder3x8_tb;
    reg [2:0] A;
    reg E;
    wire [7:0] Y_df, Y_bh, Y_st;

    // Instantiate the modules
    decoder3x8_df ddf(A, E, Y_df);  // Dataflow
    decoder3x8_bh dbh(A, E, Y_bh);  // Behavioral
    decoder3x8_st dst(A, E, Y_st);  // Structural

    initial begin
        $dumpfile("decoder3x8_tb.vcd");
        $dumpvars(0, decoder3x8_tb);
        $monitor("A=%b E=%b | Y_DF=%b Y_BH=%b Y_ST=%b", 
                A, E, Y_df, Y_bh, Y_st); 
        // Test different input combinations
        E = 0; A = 3'bx; #10; // Test when enable is zero
        E = 1; A = 3'b000; #10;
        E = 1; A = 3'b001; #10;
        E = 1; A = 3'b010; #10;
        E = 1; A = 3'b011; #10;
        E = 1; A = 3'b100; #10;
        E = 1; A = 3'b101; #10;
        E = 1; A = 3'b110; #10;
        E = 1; A = 3'b111; #10;
        
        
        $finish;
    end
endmodule
