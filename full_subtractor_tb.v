`include "full_subtractor_df.v"
`include "full_subtractor_bh.v"
`include "full_subtractor_st.v"
module full_subtractor_tb;
    reg a, b, c;  // Inputs
    wire diff_df, borr_df; // Outputs for dataflow full subtractor
    wire diff_bh, borr_bh; // Outputs for behavioral full subtractor
    wire diff_st, borr_st; // Outputs for structural full subtractor
    initial begin
        $dumpfile("full_subtractor.vcd");
        $dumpvars(0, full_subtractor_tb);
        $monitor("a=%b, b=%b, c=%b | diff_df=%b, borr_df=%b | diff_bh=%b, borr_bh=%b | diff_st=%b, borr_st=%b", 
        a, b, c, diff_df, borr_df, diff_bh, borr_bh, diff_st, borr_st);
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
    full_subtractor_df fullsubtractor1( // Instantiate full_subtractor_df (dataflow)
        .diff(diff_df),
        .borr(borr_df),
        .a(a),
        .b(b),
        .c(c)
    );
    full_subtractor_bh fullsubtractor2( // Instantiate full_subtractor_bh (behavioral)
        .diff(diff_bh),
        .borr(borr_bh),
        .a(a),
        .b(b),
        .c(c)
    );
    full_subtractor_st fullsubtractor3( // Instantiate full_subtractor_st (structural)
        .diff(diff_st),
        .borr(borr_st),
        .a(a),
        .b(b),
        .c(c)
    );
endmodule
