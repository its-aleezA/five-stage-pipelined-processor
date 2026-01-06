module MyTestBench;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] pcStoredIF;
	wire [31:0] pcStoredID;
	wire [31:0] instructionStored;
	wire [31:0] mux1Out;
	wire [31:0] rsDTStored;
	wire [31:0] rtDTStoredID;
	wire [31:0] rtDtStoredEX;
	wire [31:0] signexStored;
	wire [4:0] rsValStored;
	wire [4:0] rtValStored;
	wire [4:0] rdValStored;
	wire [4:0] regMuxOut;
	wire [4:0] regMuxOutEX;
	wire [4:0] regMuxOutMEM;
	wire [31:0] branchAdderOUT;
	wire [31:0] branchAddress;
	wire ZeroStored;
	wire [31:0] AluvalueStoredEX;
	wire [31:0] AluValueStoredMEM;
	wire PCSRC;
	wire [31:0] readValueStored;
	wire [31:0] MemRegMUXOut;
	wire memtoregID;
	wire memtoregEX;
	wire memtoregWB;
	wire memwriteID;
	wire memwriteEX;
	wire branchID;
	wire branchEX;
	wire [2:0] aluControlID;
	wire aluSrcID;
	wire regdstID;
	wire regwriteID;
	wire regwriteEX;
	wire regwriteWB;
	wire memReadID;
	wire memReadEX;
	wire [1:0] ForwardA;
	wire [1:0] ForwardB;
	wire [31:0] ForwardAluSRCA;
	wire [31:0] ForwardAluSRCB;
	wire Hazard;
	wire branchDetected;

	// Instantiate the Unit Under Test (UUT)
	InterationModule uut (
		.clk(clk), 
		.rst(rst), 
		.pcStoredIF(pcStoredIF), 
		.pcStoredID(pcStoredID), 
		.instructionStored(instructionStored), 
		.mux1Out(mux1Out), 
		.rsDTStored(rsDTStored), 
		.rtDTStoredID(rtDTStoredID), 
		.rtDtStoredEX(rtDtStoredEX), 
		.signexStored(signexStored), 
		.rsValStored(rsValStored), 
		.rtValStored(rtValStored), 
		.rdValStored(rdValStored), 
		.regMuxOut(regMuxOut), 
		.regMuxOutEX(regMuxOutEX), 
		.regMuxOutMEM(regMuxOutMEM), 
		.branchAdderOUT(branchAdderOUT), 
		.branchAddress(branchAddress), 
		.ZeroStored(ZeroStored), 
		.AluvalueStoredEX(AluvalueStoredEX), 
		.AluValueStoredMEM(AluValueStoredMEM), 
		.PCSRC(PCSRC), 
		.readValueStored(readValueStored), 
		.MemRegMUXOut(MemRegMUXOut), 
		.memtoregID(memtoregID), 
		.memtoregEX(memtoregEX), 
		.memtoregWB(memtoregWB), 
		.memwriteID(memwriteID), 
		.memwriteEX(memwriteEX), 
		.branchID(branchID), 
		.branchEX(branchEX), 
		.aluControlID(aluControlID), 
		.aluSrcID(aluSrcID), 
		.regdstID(regdstID), 
		.regwriteID(regwriteID), 
		.regwriteEX(regwriteEX), 
		.regwriteWB(regwriteWB), 
		.memReadID(memReadID), 
		.memReadEX(memReadEX), 
		.ForwardA(ForwardA), 
		.ForwardB(ForwardB), 
		.ForwardAluSRCA(ForwardAluSRCA), 
		.ForwardAluSRCB(ForwardAluSRCB), 
		.Hazard(Hazard), 
		.branchDetected(branchDetected)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Deassert reset
		rst = 0;
	end
	
	// Clock generation process
	always begin
		#5 clk = ~clk; // Toggle clock every 5 ns (10 ns period)
	end
      
endmodule
