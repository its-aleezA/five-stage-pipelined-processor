module EXMEM(
    input clk,
    input [31:0] pcvalue,
    output reg [31:0] pcvalueStored,
    input zero,
    output reg zeroStored,
    input [31:0] aluvalue,
    output reg [31:0] aluvalueStored,
    input [31:0] rtDt,
    output reg [31:0] rtDtStored,
    input [4:0] rsrd,
    output reg [4:0] rsrdStored,
    input memtoreg,
    output reg memtoregStored,
    input memwrite,
    output reg memwriteStored,
    input branch,
    output reg branchStored,
    input regwrite,
    output reg regwriteStored,
	 input memRead,
	 output reg memReadStored,
	 input branchDet
);
    always @(posedge clk)
    begin
	 if(branchDet)
	 begin
	 memwriteStored<=1'b0;
	 regwriteStored<=1'b0;
	 zeroStored <= 1'b0;
	 end
	 else
	 begin
        pcvalueStored <= pcvalue;
        zeroStored <= zero;
        aluvalueStored <= aluvalue;
        rtDtStored <= rtDt;
        rsrdStored <= rsrd;
        memtoregStored <= memtoreg;
        memwriteStored <= memwrite;
        branchStored <= branch;
        regwriteStored <= regwrite;
		  memReadStored<=memRead;
		  end
    end
endmodule
