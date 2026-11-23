`include "half_subtractor_df.v"
`include "half_subtractor_bh.v"
`include "half_subtractor_st.v"

module half_subtractor_tb;
    reg a,b; // inputs
    wire diff_df, borr_df;  // Outputs for dataflow full adder
    wire diff_bh, borr_bh;  // Outputs for behavioral full adder
    wire diff_st, borr_st;  // Outputs for structural full adder

initial begin
        $dumpfile("halfsubtractor.vcd");
        $dumpvars(0, half_subtractor_tb);
        $monitor("a=%b, b=%b | diff_df=%b, borr_df=%b | diff_bh=%b, borr_bh=%b | diff_st=%b, borr_st=%b", 
                a, b, diff_df, borr_df, diff_bh, borr_bh, diff_st, borr_st);

        // Test different input combinations
        a = 0; b = 0;
        #5 a = 0; b = 1;
        #5 a = 1; b = 0;
        #5 a = 1; b = 1;
        #5 $finish;
    end

half_subtractor_df halfsub1(
    .diff(diff_df),
    .borr(borr_df),
    .a(a),
    .b(b)
);
half_subtractor_bh halfsub2(
    .diff(diff_bh),
    .borr(borr_bh),
    .a(a),
    .b(b)
);
half_subtractor_st halfsub3(
    .diff(diff_st),
    .borr(borr_st),
    .a(a),
    .b(b)
);
endmodule