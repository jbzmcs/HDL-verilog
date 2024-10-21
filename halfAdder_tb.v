`include "halfAdder_df.v"
`include "halfAdder_bh.v"
`include "halfAdder_st.v"

module halfAdder_tb;
    reg a, b;                     // Inputs
    wire sum_df, carry_df;       // Outputs for halfAdder_df
    wire sum_bh, carry_bh;       // Outputs for halfAdder_bh
    wire sum_st, carry_st;       // Outputs for halfAdder_st

    initial begin
        $dumpfile("halfAdder.vcd");
        $dumpvars(0, halfAdder_tb);
        $monitor("a=%b, b=%b | sum_df=%b, carry_df=%b | sum_bh=%b, carry_bh=%b | sum_st=%b, carry_st=%b", 
                a, b, sum_df, carry_df, sum_bh, carry_bh, sum_st, carry_st);
        // Test different input combinations
        a = 0; b = 0;
        #5 a = 0; b = 1;
        #5 a = 1; b = 0;
        #5 a = 1; b = 1;
        #5 $finish;
    end
    // Instantiate halfAdder_df (dataflow)
    halfAdder_df hf_df(
        .sum(sum_df),
        .carry(carry_df),
        .a(a),
        .b(b)
    );
    // Instantiate halfAdder_bh (behavioral)
    halfAdder_bh hf_bh(
        .sum(sum_bh),
        .carry(carry_bh),
        .a(a),
        .b(b)
    );
    // Instantiate halfAdder_st (structural)
    halfAdder_st hf_st(
        .sum(sum_st),
        .carry(carry_st),
        .a(a),
        .b(b)
    );
endmodule
