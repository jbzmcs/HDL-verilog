`include "andGate.v"
module andGate_tb1();
    reg aIn, bIn,cIn,dIn;
    wire E,F,G;
    

    initial begin
        $dumpfile("andGate1.vcd");
        $dumpvars(0,andGate_tb1);
        $monitor("%b, %b, %b, %b, %b, %b, %b, %b", aIn, bIn,cIn,dIn, E,F,G);

        #5 aIn=0; bIn=0; cIn=0; dIn=0; //0
        #5 aIn=0; bIn=0; cIn=0; dIn=1; //1
        #5 aIn=0; bIn=0; cIn=1; dIn=0; //2
        #5 aIn=0; bIn=0; cIn=1; dIn=0; //3
        #5 aIn=0; bIn=1; cIn=0; dIn=0; //4
        #5 aIn=0; bIn=1; cIn=0; dIn=1; //5
        #5 aIn=0; bIn=1; cIn=1; dIn=0; //6 
        $finish;
    end
    andGate and1(
        aIn,
        bIn,
        E
    );  
    andGate and2(
        cIn,
        dIn,
        F
    );
    andGate and3(
        E,
        F,
        G
    );

endmodule