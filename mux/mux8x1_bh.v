module mux8x1_bh(input I0,I1,I2,I3,I4,I5,I6,I7,input S0,S1,S2, output reg Y);
    always @(*) begin
        if (S2 == 0 && S1 == 0 && S0 == 0)
            Y = I0;    // Select I0 when S2 S1 S0 = 000
        else if (S2 == 0 && S1 == 0 && S0 == 1)
            Y = I1;    // Select I1 when S2 S1 S0 = 001
        else if (S2 == 0 && S1 == 1 && S0 == 0)
            Y = I2;    // Select I2 when S2 S1 S0 = 010
        else if (S2 == 0 && S1 == 1 && S0 == 1)
            Y = I3;    // Select I3 when S2 S1 S0 = 011
        else if (S2 == 1 && S1 == 0 && S0 == 0)
            Y = I4;    // Select I4 when S2 S1 S0 = 100
        else if (S2 == 1 && S1 == 0 && S0 == 1)
            Y = I5;    // Select I5 when S2 S1 S0 = 101
        else if (S2 == 1 && S1 == 1 && S0 == 0)
            Y = I6;    // Select I6 when S2 S1 S0 = 110
        else if (S2 == 1 && S1 == 1 && S0 == 1)
            Y = I7;    // Select I7 when S2 S1 S0 = 111
        else
            Y = 1'b0;  // Default case, though not expected
    end
endmodule

// ? Always block to model the behavior of the 8:1 multiplexer using case statement
//     always @(*) begin
//         case ({S2, S1, S0})      // Concatenate the select signals into one value
//             3'b000: Y = I0;      // If select lines are 000, choose I0
//             3'b001: Y = I1;      // If select lines are 001, choose I1
//             3'b010: Y = I2;      // If select lines are 010, choose I2
//             3'b011: Y = I3;      // If select lines are 011, choose I3
//             3'b100: Y = I4;      // If select lines are 100, choose I4
//             3'b101: Y = I5;      // If select lines are 101, choose I5
//             3'b110: Y = I6;      // If select lines are 110, choose I6
//             3'b111: Y = I7;      // If select lines are 111, choose I7
//             default: Y = 1'b0;   // Default case, although it shouldn't be hit in this design
//         endcase
//     end