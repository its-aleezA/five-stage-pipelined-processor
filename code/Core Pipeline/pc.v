module pc #(parameter N=32)(
    input clk,
    input rst,
    output reg [N-1:0] pcOut,
    input hazard,
    input [N-1:0] pcIn,
    input [31:0] pcprev
);
