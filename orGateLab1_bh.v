//Behavioral
module orGateLab1_bh(input wire a,b, output reg c);
    always @(*) begin
        if(a | b)
        c = 1;
        else
        c = 0;
    end
endmodule