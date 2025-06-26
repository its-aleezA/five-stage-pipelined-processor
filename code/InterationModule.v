module InterationModule(
		input clk,
		input rst,
		
		
		/////pipelining
		output [31:0] pcStoredIF,
		output [31:0] pcStoredID,
		output [31:0] instructionStored,
		output [31:0] mux1Out,
		output [31:0] rsDTStored,
		output [31:0] rtDTStoredID,
		output [31:0] rtDtStoredEX,
		output [31:0] signexStored,
		output [4:0] rsValStored,
		output [4:0] rtValStored,
		output [4:0] rdValStored,
		output [4:0] regMuxOut,
		output [4:0] regMuxOutEX,
		output [4:0] regMuxOutMEM,
		output [31:0] branchAdderOUT,
		output [31:0] branchAddress,
		output ZeroStored,
		output [31:0] AluvalueStoredEX,
		output [31:0] AluValueStoredMEM,
		output PCSRC,
		output [31:0] readValueStored,
		output [31:0] MemRegMUXOut,
		
		///
		output  memtoregID,
		output  memtoregEX,
		output  memtoregWB,
		output memwriteID,
		output memwriteEX,
		output branchID,
		output branchEX,
		output [2:0] aluControlID,
		output aluSrcID,
		output regdstID,
		output regwriteID,
		output regwriteEX,
		output regwriteWB,
		output memReadID,
		output memReadEX,
		
		////forwarding
		output [1:0] ForwardA,
		output [1:0] ForwardB,
		output [31:0] ForwardAluSRCA,
		output [31:0] ForwardAluSRCB,
		
		//// Hazard
		output Hazard,
		
		////branch Hazard
		output branchDetected
		
    );
	 ////pc
	
		
		////inst memory
		/// alu
		//input [3:0] alu_opcode,
		//// data memory
	
		//// reg file
	
		///wires
		///alu
		wire [31:0] alu_result;
		wire alu_zero;
		/// reg file
		wire [31:0] reg_rsData;
		wire [31:0] reg_rtData;
		//// inst mem
		wire [31:0] inst_instruct;
		//// data mem
		wire [31:0] data_rd;
		///pc
		wire [31:0] pc_pcout;
		//decoder 
		wire [4:0] int_shamt;
		wire [5:0] int_func;
		wire [15:0] int_immed;
		wire [25:0] int_target;
		wire [4:0] int_rs;
		wire [4:0] int_rt;
		wire [4:0] int_rd;
		wire [5:0] int_opcode;
		wire [31:0] int_shiftl16;
		//// control signal
		wire int_memtoreg;
		wire int_memwrite;
		wire int_branch;
		wire [2:0] int_aluControl;
		wire int_aluSrc;
		wire int_regdst;
		wire int_regwrite;
		wire [31:0]int_signExtend;
		wire pc_jump;
		wire int_memRead;
		//alu src
		wire [31:0] int_aluSrcSelect;
		//resultSelect
		wire [31:0] int_resultSel;
		//reg select
		wire [4:0] int_rsOrd;
		wire Hazardrst_int;
	
	 mux1 mux1_int ( .branch(PCSRC), .pcvalue(pc_pcout), .branchvalue(branchAddress), .muxOut(mux1Out));
	 
    pc pc_int( .clk(clk), .rst(rst), .pcOut(pc_pcout), .hazard(Hazard), .pcIn(mux1Out), .pcprev(pcStoredIF));
	 inst_mem instmem_int ( .address(pc_pcout), .instruction(inst_instruct));
	 
	 IFID IFID_int( .clk(clk), .pcvalue(pc_pcout), .pcStored(pcStoredIF), .instructionvalue(inst_instruct), .instructionStored(instructionStored));
	 
	 Decoder decode_int ( .instruct(instructionStored), .opcode(int_opcode), .rs(int_rs), .rt(int_rt), .rd(int_rd), .shamt(int_shamt), .func(int_func), .immed(int_immed), .signExtend(int_signExtend), .target(int_target), .slby16(int_shiftl16) );
	 reg_file regfile_int ( .rs(int_rs), .rt(int_rt), .rd(regMuxOutMEM), .rst(rst), .write(regwriteWB), .rsData(reg_rsData), .rtData(reg_rtData), .mem_write(MemRegMUXOut));
	 
	 
	 
	 IDEX IDEX_int ( .clk(clk), .pcvalue(pcStoredIF), .pcvalueStored(pcStoredID), .rsDt(reg_rsData), .rsDtStored(rsDTStored), .rtDt(reg_rtData), .rtDtStored(rtDTStoredID), .signEx(int_signExtend), .signExStored(signexStored), .rtval(int_rt), .rtvalStored(rtValStored), .rdval(int_rd), .rdvalStored(rdValStored), .memtoreg(int_memtoreg), .memtoregStored(memtoregID), .memwrite(int_memwrite), .memwriteStored(memwriteID), .branch(int_branch), .branchStored(branchID), .aluControl(int_aluControl), .aluControlStored(aluControlID), .aluSrc(int_aluSrc), .aluSrcStored(aluSrcID), .regdst(int_regdst), .regdstStored(regdstID), .regwrite(int_regwrite), .regwriteStored(regwriteID), .rsval(int_rs), .rsvalStored(rsValStored), .memRead(int_memRead), .memReadStored(memReadID), .hazard(Hazard), .branchDet(branchDetected));
	 dstRegMux dstRegMux_int ( .regdst(regdstID), .rt(rtValStored), .rd(rdValStored), .regmuxOut(regMuxOut));
	 branchAdder branchAdder_int ( .pc(pcStoredID), .signEx(signexStored), .branchAdderOut(branchAdderOUT));
	 
	 ControlUnit control_int ( .opcode(int_opcode), .func(int_func), .memtoreg(int_memtoreg), .memwrite(int_memwrite), .branch(int_branch), .aluControl(int_aluControl), .aluSrc(int_aluSrc), .regdst(int_regdst), .regwrite(int_regwrite), .jump(pc_jump), .memRead(int_memRead));                    
	 AluSrc src_int ( .Rt(rtDTStoredID), .signExtend(int_signExtend), .alusrc(aluSrcID), .result(int_aluSrcSelect));
	 Alu Alu_int ( .srcA(ForwardAluSRCA), .srcB(ForwardAluSRCB), .opcode(aluControlID), .signExtend(int_signExtend), .zero(alu_zero), .result(alu_result));
	 
	 ////forwarding unit
	 ForwardingUnit ForwardingUnit_int ( .EXregwrite(regwriteEX), .WBregwrite(regwriteWB), .curRs(rsValStored), .curRt(rtValStored), .exRd(regMuxOutEX), .wbRd(regMuxOutMEM), .forwardA(ForwardA), .forwardB(ForwardB));
	 ForwardMux1 ForwardMux1_int ( .forwardA(ForwardA), .curRSdt(rsDTStored), .EXRSdt(AluvalueStoredEX), .MEMRSdt(MemRegMUXOut), .aluSRCA(ForwardAluSRCA));
	 ForwardMux2 ForwardMux2_int ( .forwardB(ForwardB), .curRTdt(int_aluSrcSelect), .EXRTdt(AluvalueStoredEX), .MEMRTdt(MemRegMUXOut), .aluSRCB(ForwardAluSRCB));
	 
	 ///hazards
	 HazardDetection HazardDetection_int ( .exMemRead(memReadEX), .curRs(int_rs), .curRt(int_rt), .exRd(rdValStored), .hazard(Hazard));
	 
	 
	 ///branch Hazards
	 BranchHazard BranchHazard_int ( .branch(PCSRC), .branchDet(branchDetected));
	 
	 EXMEM EXMEM_int ( .clk(clk), .pcvalue(branchAdderOUT), .pcvalueStored(branchAddress), .zero(alu_zero), .zeroStored(ZeroStored), .aluvalue(alu_result), .aluvalueStored(AluvalueStoredEX), .rtDt(rtDTStoredID), .rtDtStored(rtDtStoredEX), .rsrd(regMuxOut), .rsrdStored(regMuxOutEX), .memtoreg(memtoregID), .memtoregStored(memtoregEX), .memwrite(memwriteID), .memwriteStored(memwriteEX), .branch(branchID), .branchStored(branchEX), .regwrite(regwriteID), .regwriteStored(regwriteEX), .memRead(memReadID), .memReadStored(memReadEX), .branchDet(branchDetected));
	 branchCondit branchCondit_int ( .branch(branchEX), .zero(ZeroStored), .pcSRC(PCSRC));
	 
	 
	 datamemory datamemory_int ( .writeEn(memwriteEX), .writedata(rtDtStoredEX), .a(AluvalueStoredEX), .rd(data_rd), .memRead(memReadEX));
	 
	 
	 
	 MEMWB MEMWB_int ( .clk(clk), .readvalue(data_rd), .readvalueStored(readValueStored), .aluvalue(AluvalueStoredEX), .aluvalueStored(AluValueStoredMEM), .rsrd(regMuxOutEX), .rsrdStored(regMuxOutMEM), .memtoreg(memtoregEX), .memtoregStored(memtoregWB), .regwrite(regwriteEX), .regwriteStored(regwriteWB) );
	 memTOregMux memTOregMux_int ( .memtoreg(memtoregWB), .readval(readValueStored), .aluval(AluValueStoredMEM), .MemRegOut(MemRegMUXOut));
	
	

endmodule
