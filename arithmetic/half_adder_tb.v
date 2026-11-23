`include "half_adder_df.v"
`include "half_adder_bh.v"
`include "half_adder_st.v"

module half_adder_tb;
    reg a, b;                     // Inputs
    wire sum_df, carry_df;       // Outputs for half_adder_df
    wire sum_bh, carry_bh;       // Outputs for half_adder_bh
    wire sum_st, carry_st;       // Outputs for half_adder_st

    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_tb);
        $monitor("a=%b, b=%b | sum_df=%b, carry_df=%b | sum_bh=%b, carry_bh=%b | sum_st=%b, carry_st=%b", 
                a, b, sum_df, carry_df, sum_bh, carry_bh, sum_st, carry_st);
        // Test different input combinations
        a = 0; b = 0;
        #5 a = 0; b = 1;
        #5 a = 1; b = 0;
        #5 a = 1; b = 1;
        #5 $finish;
    end
    // Instantiate half_adder_df (dataflow)
    half_adder_df hf_df(
        .sum(sum_df),
        .carry(carry_df),
        .a(a),
        .b(b)
    );
    // Instantiate half_adder_bh (behavioral)
    half_adder_bh hf_bh(
        .sum(sum_bh),
        .carry(carry_bh),
        .a(a),
        .b(b)
    );
    // Instantiate half_adder_st (structural)
    half_adder_st hf_st(
        .sum(sum_st),
        .carry(carry_st),
        .a(a),
        .b(b)
    );
endmodule
