`include "full_adder_df.v"
`include "full_adder_bh.v"
`include "full_adder_st.v"
module full_adder_tb;
    reg a, b, c;  // Inputs
    wire sum_df, carry_df;  // Outputs for dataflow full adder
    wire sum_bh, carry_bh;  // Outputs for behavioral full adder
    wire sum_st, carry_st;  // Outputs for structural full adder
    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);
        $monitor("a=%b, b=%b, c=%b | sum_df=%b, carry_df=%b | sum_bh=%b, carry_bh=%b | sum_st=%b, carry_st=%b", 
                a, b, c, sum_df, carry_df, sum_bh, carry_bh, sum_st, carry_st);
        // Test different input combinations
        a = 0; b = 0; c = 0;
        #5 a = 0; b = 0; c = 1;
        #5 a = 0; b = 1; c = 0;
        #5 a = 0; b = 1; c = 1;
        #5 a = 1; b = 0; c = 0;
        #5 a = 1; b = 0; c = 1;
        #5 a = 1; b = 1; c = 0;
        #5 a = 1; b = 1; c = 1;
        #5 $finish;
    end
    full_adder_df fullAdder1( // Instantiate full_adder_df (dataflow)
        .sum(sum_df),
        .carry(carry_df),
        .a(a),
        .b(b),
        .c(c)
    );
    full_adder_bh fullAdder2( // Instantiate full_adder_bh (behavioral)
        .sum(sum_bh),
        .carry(carry_bh),
        .a(a),
        .b(b),
        .c(c)
    );
    full_adder_st fullAdder3( // Instantiate full_adder_st (structural)
        .sum(sum_st),
        .carry(carry_st),
        .a(a),
        .b(b),
        .c(c)
    );
endmodule
