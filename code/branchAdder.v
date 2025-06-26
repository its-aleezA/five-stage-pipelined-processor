module branchAdder(
		input [31:0] pc,
		input [31:0] signEx,
		output reg [31:0] branchAdderOut
    );
	 reg [31:0] branch;
	 reg [4:0] brancH;
	 always @(*)
	 begin
	 branch<=signEx <<2;
	 brancH<=branch[4:0];
	 branchAdderOut=pc + brancH;
	 end

endmodule
