module hazardrst(
		input clk,
		input hazard,
		output reg hazarD
    );
	 always @(posedge clk)
	 begin
	 if(hazard)
	 hazarD<=1'b1;
	 else
	 hazarD<=1'b0;
	 end

endmodule
