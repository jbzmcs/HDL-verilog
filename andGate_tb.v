`include "andGate.v"
module andGate_tb();
    reg aIn, bIn;
    wire yOut;

    initial begin
        $dumpfile("andGate.vcd");
        $dumpvars(0,andGate_tb);
        $monitor("%b, %b, %b", aIn, bIn, yOut);

        #5 aIn=0; bIn=0;
        #5 aIn=0; bIn=1;
        #5 aIn=1; bIn=0;
        #5 aIn=1; bIn=1;
        #5
        $finish;
    end
    andGate and1(
        aIn,
        bIn,
        yOut
    );

endmodule