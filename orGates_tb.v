`include "orGateLab1_df.v"
`include "orGateLab1_bh.v"
`include "orGateLab1_st.v"

module orGates_tb;
    //reg p,q;
    reg a,b;
    wire c_df, c_bh, c_st; // Declare outputs as wire




initial begin
    $dumpfile("orGates_tb.vcd");
    $dumpvars(0,orGates_tb);

    $monitor("a=%b, b=%b, c_df=%b, c_bh=%b, c_st=%b", a, b, c_df, c_bh, c_st);

    a=0;b=0; #10;
    a=0;b=1; #10;
    a=1;b=0; #10;
    a=1;b=1; #10;

    $finish;
end

orGateLab1_df out1(
    .a(a),
    .b(b),
    .c(c_df));
orGateLab1_bh out2(
    .a(a),
    .b(b),
    .c(c_bh));
orGateLab1_st out3(
    .a(a),
    .b(b),
    .c(c_st));


endmodule