`include "orGateLab1a.v"
module orGateLab1_bh_tb;
    //reg p,q;
    reg a,b;
    wire c;

orGateLab1a dut(a,b,c);

initial begin
    // $dumpfile("orGateLab1_tb.vcd");
    // $dumpvars(0, orGateLab1_tb);
    $dumpfile("orGateLab1a_tb.vcd");
    $dumpvars(0, orGateLab1a_tb);

    $monitor("a=%b,b=%b,c=%b",a,b,c);

    a=0;b=0; #10;
    a=0;b=1; #10;
    a=1;b=0; #10;
    a=1;b=1; #10;

    $finish;
end

endmodule