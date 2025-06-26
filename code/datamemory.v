module datamemory(
    input wire writeEn,
    input wire [31:0] writedata,
    input wire [31:0] a,
    output reg [31:0] rd,
    input wire memRead
    );

    reg [31:0] memory [0:31]; // Define a memory array of 32 elements

    // Initialize memory with some values
    initial begin
        memory[0] = 32'd550;
        memory[1] = 32'd550;
        memory[2] = 32'd550;
        memory[3] = 32'd600;
        memory[4] = 32'd432;
        memory[5] = 32'd543;
        memory[6] = 32'd800;
        memory[7] = 32'd210;
        memory[8] = 32'd140;
        memory[9] = 32'd940;
        memory[10] = 32'd1320;
        memory[11] = 32'd160;
        memory[12] = 32'd830;
        memory[13] = 32'd400;
        memory[14] = 32'd340;
        memory[15] = 32'd270;
        memory[16] = 32'd550;
        memory[17] = 32'd1000;
        memory[18] = 32'd220;
        memory[19] = 32'd550;
        memory[20] = 32'd550;
        memory[21] = 32'd550;
        memory[22] = 32'd600;
        memory[23] = 32'd432;
        memory[24] = 32'd543;
        memory[25] = 32'd800;
        memory[26] = 32'd210;
        memory[27] = 32'd140;
        memory[28] = 32'd940;
        memory[29] = 32'd1320;
        memory[30] = 32'd160;
        memory[31] = 32'd830;
    end

    // Memory write operation (synchronous)
    always @(*) begin
        if (writeEn) begin
            memory[a[4:0]] <= writedata; // Use only lower 5 bits of 'a' for addressing
        end
    end

    // Memory read operation (combinational)
    always @(*) begin
        if (memRead) begin
            rd = memory[a[4:0]]; // Use only lower 5 bits of 'a' for addressing
        end else begin
            rd = 32'b0; // Default value when memRead is not asserted
        end
    end

endmodule
