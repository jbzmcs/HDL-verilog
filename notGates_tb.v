`include "notGate_df.v"
`include "notGate_bh.v"
`include "notGate_st.v"

module notGates_tb;
    //reg p,q;
    reg a;
    wire b_df, b_bh, b_st; // Declare outputs as wire




initial begin
    $dumpfile("notGates_tb.vcd");
    $dumpvars(0,notGates_tb);

    $monitor("a=%b, b_df=%b, b_bh=%b, b_st=%b", a, b_df, b_bh, b_st);

    a=0; #10;
    a=1; #10;

    $finish;
end

notGate_df out1(
    .a(a),
    .b(b_df));
notGate_bh out2(
    .a(a),
    .b(b_bh));
notGate_st out3(
    .a(a),
    .b(b_st));


endmodule