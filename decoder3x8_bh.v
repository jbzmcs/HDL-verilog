module decoder3x8_bh(input [2:0]A, input E, output reg [7:0] Y);
    always @ (A or E) begin
        if (E) begin
            case (A)
                3'b000: Y = 8'b00000001;
                3'b001: Y = 8'b00000010;
                3'b010: Y = 8'b00000100;
                3'b011: Y = 8'b00001000;
                3'b100: Y = 8'b00010000;
                3'b101: Y = 8'b00100000;
                3'b110: Y = 8'b01000000;
                3'b111: Y = 8'b10000000;
            endcase
        end else begin
            Y = 8'b00000000;
        end
    end
endmodule
