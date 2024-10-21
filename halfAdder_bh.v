module halfAdder_bh(sum,carry,a,b);
    output reg sum,carry;
    input a,b;

    always @(a,b) begin
        sum = a ^ b;
        carry = a&b;
    end
endmodule