module DEC3TO8 (
    output wire F0, F1, F2, F3, F4, F5, F6, F7,
    input wire A, B, C
);

assign F0 = ~A & ~B & ~C;
assign F1 = ~A & ~B & C;
assign F2 = ~A & B & ~C;
assign F3 = ~A & B & C;
assign F4 = A & ~B & ~C;
assign F5 = A & ~B & C;
assign F6 = A & B & ~C;
assign F7 = A & B & C;

endmodule
