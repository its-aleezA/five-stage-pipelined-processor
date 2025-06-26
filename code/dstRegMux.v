module dstRegMux(
    input wire regdst,
    input wire [4:0] rt,
    input wire [4:0] rd,
    output wire [4:0] regmuxOut
);
    assign regmuxOut = regdst ? rd : rt;
endmodule
