//Dataflow style
module orGate_df(input a, b, output c);
    assign c = a | b;
endmodule