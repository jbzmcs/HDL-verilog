module mux2x1_bh(input i0,i1,s, output reg y);
    always @(*) begin
        if (s == 0)
            y = i0; // s=0 selects i0, matching the dataflow and structural versions
        else
            y = i1;
    end
endmodule
