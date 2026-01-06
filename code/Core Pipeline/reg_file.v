module reg_file #(parameter N=32,D=32)(
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input rst,
    input write,
    output reg [N-1:0] rsData,
    output reg [N-1:0] rtData,
    input [N-1:0] mem_write
    );
	 reg [N-1:0]memory [D-1:0];
	 initial
	 begin
	 memory[0]=32'd550;
	 memory[1]=32'd600;
	 memory[2]=32'd550;
	 memory[3]=32'd600;
	 memory[4]=32'd432;
	 memory[5]=32'd543;
	 memory[6]=32'd800;
	 memory[7]=32'd210;
	 memory[8]=32'd140;
	 memory[9]=32'd940;
	 memory[10]=32'd1320;
	 memory[11]=32'd160;
	 memory[12]=32'd830;
	 memory[13]=32'd400;
	 memory[14]=32'd340;
	 memory[15]=32'd270;
	 memory[16]=32'd550;
	 memory[17]=32'd1000;
	 memory[18]=32'd220;
	 end
	 always@(*)
	 begin
	 rsData=memory[rs];
	 rtData=memory[rt];
	 end
	 //assign rsData=memory[rs];
	 //assign rtData=memory[rt];
	 always@(*)
	 begin
	 if(write)
	 memory[rd]<=mem_write;
	 end


endmodule
