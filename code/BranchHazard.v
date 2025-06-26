module BranchHazard(
		input branch,
		output reg branchDet
    );
	 always@(*)
	 begin
	 if(branch)
	 branchDet<=1'b1;
	 else 
	 branchDet<=1'b0;
	 end


endmodule
