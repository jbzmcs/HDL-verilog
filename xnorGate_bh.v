module xnorGate_bh(input a,b, output reg c);
    always @(*) begin
        if(~(a ^ b))
        c = 1;
        else
        c = 0;
    end
endmodule