module ForwardMux2(
		input [1:0] forwardB,
		input [31:0] curRTdt,
		input [31:0] EXRTdt,
		input [31:0] MEMRTdt,
		output [31:0] aluSRCB
    );
	  assign aluSRCB=(forwardB==2'b01)?EXRTdt: (forwardB==2'b10)?MEMRTdt:curRTdt;

endmodule
