module Alu(
  input [31:0] srcA,
  input [31:0] srcB,
  input [2:0] opcode,
  input [31:0] signExtend,
  output reg zero,
  output reg [31:0] result,
  output reg [31:0] HI_reg,
  output reg [31:0] LO_reg
);

	reg [31:0] evenCheck;
	wire [31:0] divi;
	assign divi=32'd2;
  always @(*) begin
    case (opcode)
		3'b010: result = srcA + srcB;
		3'b010: result = srcA + srcB;
		3'b110: result = srcA - srcB;
      3'b010: result = srcA + srcB;
      3'b110: result = srcA - srcB;
      //3'b000: result = srcA & srcB;
		3'b000: begin 
		result=srcA * srcB;
		{HI_reg,LO_reg}=result;
		end
      3'b001: result = srcA | srcB;
      //3'b100: result = srcA ^ srcB;
		//3'b111: result = srcA < srcB? 1:0; 
		3'b111: begin    //// xori instruction
		evenCheck = srcA ^ signExtend;
		result= evenCheck%divi==0? evenCheck: srcB;
		end
		3'b101: result = srcA < signExtend? 1:0;
		3'b011: result = srcA & srcB;
      default: result = srcA;
    endcase

    if (result == 32'd0)
      zero <= 1'b1;
    else
      zero <= 1'b0;
  end

endmodule
