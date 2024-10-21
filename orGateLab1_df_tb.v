`include "orGateLab1_df.v"
module orGateLab1_df_tb;
    //reg p,q;
    reg a,b;
    wire c;

orGateLab1_df dut(a,b,c);

initial begin
    $dumpfile("orGateLab1_df_tb.vcd");
    $dumpvars(0, orGateLab1_df_tb);

    $monitor("a=%b,b=%b,c=%b",a,b,c);

    a=0;b=0; #10;
    a=0;b=1; #10;
    a=1;b=0; #10;
    a=1;b=1; #10;

    $finish;
end

endmodule