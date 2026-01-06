module IDEX(
    input clk,
    input [31:0] pcvalue,
    output reg [31:0] pcvalueStored,
    input [31:0] rsDt,
    output reg [31:0] rsDtStored,
    input [31:0] rtDt,
    output reg [31:0] rtDtStored,
    input [31:0] signEx,
    output reg [31:0] signExStored,
    input [4:0] rtval,
    output reg [4:0] rtvalStored,
    input [4:0] rdval,
    output reg [4:0] rdvalStored,
    input memtoreg,
    output reg memtoregStored,
    input memwrite,
    output reg memwriteStored,
    input branch,
    output reg branchStored,
    input [2:0] aluControl,
    output reg [2:0] aluControlStored,
    input aluSrc,
    output reg aluSrcStored,
    input regdst,
    output reg regdstStored,
    input regwrite,
    output reg regwriteStored,
	 input [4:0] rsval,
	 output reg [4:0] rsvalStored,
	 input memRead,
	 output reg memReadStored,
	 input hazard,
	 input branchDet
);

always @(posedge clk)
begin
	if(hazard || branchDet)
	begin
	memwriteStored<=0;
	regwriteStored<=0;
	end
	else begin
    pcvalueStored <= pcvalue;
    rsDtStored <= rsDt;
    rtDtStored <= rtDt;
    signExStored <= signEx;
	 rsvalStored<=rsval;
    rtvalStored <= rtval;
    rdvalStored <= rdval;
    memtoregStored <= memtoreg;
    memwriteStored <= memwrite;
    branchStored <= branch;
    aluControlStored <= aluControl;
    aluSrcStored <= aluSrc;
    regdstStored <= regdst;
    regwriteStored <= regwrite;
	 memReadStored<=memRead; end
end

endmodule
