module norGate_bh(input a,b, output reg c);
    always @(*) begin
        if (a | b)
        c = 0; // if a OR b = 1, output is 0
        else
        c = 1; // if a OR b = 0, output is 1
    end
endmodule