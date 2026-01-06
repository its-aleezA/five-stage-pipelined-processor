module IFID(
		input clk,
		input [31:0] pcvalue,
		output reg [31:0] pcStored,
		input [31:0] instructionvalue,
		output reg [31:0] instructionStored
    );
	 always @(posedge clk)
	 begin 
	 pcStored<=pcvalue;
	 instructionStored<=instructionvalue;
	 end


endmodule
