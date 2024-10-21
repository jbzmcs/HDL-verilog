module notGate_bh(input a, output reg b);
    always @(*) begin
        if(a == 1)
        b=0;
        else
        b=1;
    end
endmodule
