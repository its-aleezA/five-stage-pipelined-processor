module branchCondit(
    input wire branch,
    input wire zero,
    output reg pcSRC
);
	always @(*)
	begin
    pcSRC <= (branch && zero) ? 1 : 0;
	 end
endmodule
