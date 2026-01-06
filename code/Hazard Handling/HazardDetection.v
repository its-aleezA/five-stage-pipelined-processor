module HazardDetection(
    input exMemRead,
    input [4:0] curRs,
    input [4:0] curRt,
    input [4:0] exRd,
    output reg hazard
);
	always @(*)
	begin
	hazard<=1'b0;
	hazard <=(exMemRead && ((curRs == exRd) || (curRt == exRd))) ? 1'b1: 1'b0;
	end

endmodule
