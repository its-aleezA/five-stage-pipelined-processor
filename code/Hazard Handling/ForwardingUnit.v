module ForwardingUnit(
		input EXregwrite,
		input WBregwrite,
		input [4:0] curRs,
		input [4:0] curRt,
		input [4:0] exRd,
		input [4:0] wbRd,
		output [1:0] forwardA,
		output [1:0] forwardB
    );
	 assign forwardA=(EXregwrite && curRs==exRd)?2'b01: (WBregwrite && curRs==wbRd)? 2'b10: 2'b00;
	 assign forwardB=(EXregwrite && curRt==exRd)?2'b01: (WBregwrite && curRt==wbRd)? 2'b10: 2'b00;


endmodule
