`include "problem1A.v"

module problem1A_tb;
    reg W,X,Y,Z;
    wire E,F;
    
    initial begin
        $dumpfile("problem1A.vcd");
        $dumpvars(0, problem1A_tb);
        $monitor("W=%b | X=%b | Y=%b | Z=%b || E=%b | F=%b", W, X, Y, Z, E, F);
        
        W=0; X=0; Y=0; Z=0; #5; //0
        W=0; X=0; Y=0; Z=1; #5; //1
        W=0; X=0; Y=1; Z=0; #5; //2
        W=0; X=0; Y=1; Z=1; #5; //3
        W=0; X=1; Y=0; Z=0; #5; //4
        W=0; X=1; Y=0; Z=1; #5; //5
        W=0; X=1; Y=1; Z=0; #5; //6
        W=0; X=1; Y=1; Z=1; #5; //7
        W=1; X=0; Y=0; Z=0; #5; //8
        W=1; X=0; Y=0; Z=1; #5; //9
        W=1; X=0; Y=1; Z=0; #5; //10
        W=1; X=0; Y=1; Z=1; #5; //11
        W=1; X=1; Y=0; Z=0; #5; //12
        W=1; X=1; Y=0; Z=1; #5; //13
        W=1; X=1; Y=1; Z=0; #5; //14
        W=1; X=1; Y=1; Z=1; #5; //15
        $finish;
    end

    // instantiate module
problem1A solve(
    .W(W),
    .X(X),
    .Y(Y),
    .Z(Z),
    .E(E),
    .F(F)
);

endmodule