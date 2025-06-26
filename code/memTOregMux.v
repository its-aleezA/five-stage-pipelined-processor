module memTOregMux(
    input wire memtoreg,
    input wire [31:0] readval,
    input wire [31:0] aluval,
    output wire [31:0] MemRegOut
);
    assign MemRegOut = memtoreg ? readval : aluval;
endmodule
