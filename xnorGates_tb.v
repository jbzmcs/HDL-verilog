`include "xnorGate_df.v"
`include "xnorGate_bh.v"
`include "xnorGate_st.v"
module xnorGates_tb;
    reg a,b;
    wire c_df, c_bh, c_st; // Declare outputs as wire

initial begin
    
    $dumpfile("xnorGates_tb.vcd");
    
    
    $dumpvars(0,xnorGates_tb);
    
    $monitor("a=%b, b=%b, c_df=%b, c_bh=%b, c_st=%b", a, b, c_df, c_bh, c_st);
    a=0;b=0; #10;
    a=0;b=1; #10;
    a=1;b=0; #10;
    a=1;b=1; #10;
    $finish;
end

xnorGate_df out1(
    .a(a),
    .b(b),
    .c(c_df));

xnorGate_bh out2(
    .a(a),
    .b(b),
    .c(c_bh));

xnorGate_st out3(
    .a(a),
    .b(b),
    .c(c_st));

endmodule
