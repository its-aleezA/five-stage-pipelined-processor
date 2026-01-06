module Decoder(
    input [31:0] instruct,
    output reg [5:0] opcode,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg [4:0] shamt,
    output reg [5:0] func,
    output reg [15:0] immed,
	 output reg [31:0] signExtend,
    output reg [25:0] target,
	 output reg [31:0] slby16
    );
	 always@(*)
	 begin
	 opcode<=instruct[31:26];
	 rs<=instruct[25:21];
	 rt<=instruct[20:16];
	 rd<=instruct[15:11];
	 shamt<=instruct[10:6];
	 func<=instruct[5:0];
	 immed<=instruct[15:0];
	 slby16<=immed << 16;
	 signExtend<={ {16{immed[15]}}, immed };
	 target<=instruct[25:0];
	 end


endmodule
