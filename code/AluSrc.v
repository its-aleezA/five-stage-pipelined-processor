module AluSrc(
		input [31:0] Rt,
		input [31:0] signExtend,
		input alusrc,
		output reg [31:0] result
    );
	 always@(alusrc or Rt or signExtend)
	 begin
	 if(alusrc)
	 result<=signExtend;
	 else
	 result<=Rt;
	 end


endmodule
