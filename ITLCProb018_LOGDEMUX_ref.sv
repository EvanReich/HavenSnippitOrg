module LOGDEMUX (
    output wire W, X, Y, Z,
    input wire A,
    input wire [1:0] Sel
);

assign W = (A & ~Sel[1] & ~Sel[0]);
assign X = (A & ~Sel[1] &  Sel[0]);
assign Y = (A &  Sel[1] & ~Sel[0]);
assign Z = (A &  Sel[1] &  Sel[0]);

endmodule
