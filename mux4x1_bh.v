module mux4x1_bh(input i0, i1, i2, i3, input S0, S1, output reg Y);
    always @(*) begin
        case ({S1, S0}) // output based on selectors
            2'b00: Y = i0;  // S1=0, S0=0 -> select i0
            2'b01: Y = i1;  // S1=0, S0=1 -> select i1
            2'b10: Y = i2;  // S1=1, S0=0 -> select i2
            2'b11: Y = i3;  // S1=1, S0=1 -> select i3
            default: Y = 1'bx;  // Default case to handle unknown states
        endcase
    end
endmodule
