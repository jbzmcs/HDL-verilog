module xorGate_bh(input a,b, output reg c);
    always @(*) begin
        if ((~a & b) | (a & ~b)) //check if exactly one of the inputs is 1
        c = 1; // if condition is true, output is 1
        else
        c = 0; // if condition is false, output is 0
    end
endmodule