module mux1(
    input wire branch,
    input wire [31:0] pcvalue,
    input wire [31:0] branchvalue,
    output wire [31:0] muxOut
);
    assign muxOut = branch ? branchvalue : pcvalue;
endmodule
