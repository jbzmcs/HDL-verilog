`include "problem1B.v"
module problem1B_tb;
    reg A,B;
    wire Y;

    initial begin
        $dumpfile("problem1B.vcd");
        $dumpvars(0, problem1B_tb);
        $monitor("A=%b | B=%b || Y=%b", A,B,Y);

    A=0; B=0; #5; //0
    A=0; B=1; #5; //1
    A=1; B=0; #5; //2
    A=1; B=1; #5; //3
    $finish;
    end

// instantiate module
problem1B des(
    .A(A),
    .B(B),
    .Y(Y)
);

endmodule