module problem1A (input W, X,Y,Z, output E,F);
    assign E = W | (X&Y) | ((~X)&Z);
    assign F = ((~X)&Y) | (X&(~Y)&Z);
endmodule