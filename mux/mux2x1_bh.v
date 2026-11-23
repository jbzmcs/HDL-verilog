module mux2x1_bh(input i0,i1,s, output reg y);
    always @(i0,i1) begin
        if(s==0)
        y=i1;
        if(s==1)
        y=i0;
    end
endmodule