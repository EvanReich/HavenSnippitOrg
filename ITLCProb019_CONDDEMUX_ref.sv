module CONDDEMUX (
    output wire W, X, Y, Z,
    input wire A,
    input wire [1:0] Sel
);

assign W = (Sel == 2'b00) ? A : 1'b0;
assign X = (Sel == 2'b01) ? A : 1'b0;
assign Y = (Sel == 2'b10) ? A : 1'b0;
assign Z = (Sel == 2'b11) ? A : 1'b0;

endmodule
