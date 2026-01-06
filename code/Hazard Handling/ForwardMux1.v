module ForwardMux1(
		input [1:0] forwardA,
		input [31:0] curRSdt,
		input [31:0] EXRSdt,
		input [31:0] MEMRSdt,
		output [31:0] aluSRCA
    );
	 assign aluSRCA=(forwardA==2'b01)?EXRSdt: (forwardA==2'b10)?MEMRSdt:curRSdt;


endmodule
