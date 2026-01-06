module MEMWB(
    input clk,
    input [31:0] readvalue,
    output reg [31:0] readvalueStored,
    input [31:0] aluvalue,
    output reg [31:0] aluvalueStored,
    input [4:0] rsrd,
    output reg [4:0] rsrdStored,
    input memtoreg,
    output reg memtoregStored,
    input regwrite,
    output reg regwriteStored
);
    always @(posedge clk)
    begin 
        readvalueStored <= readvalue;
        aluvalueStored <= aluvalue;
        rsrdStored <= rsrd;
        memtoregStored <= memtoreg;
        regwriteStored <= regwrite;
    end
endmodule
