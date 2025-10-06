module ANDOR026 (output wire F,
                input wire A, B, C);

wire An, Bn, Cn;       // internal nets
wire m0, m2, m6;

assign An = ~A;        // Not's
assign Bn = ~B;
assign Cn = ~C;

assign m0 = An & Bn & Cn;  // AND's
assign m2 = An & B & Cn;
assign m6 = A & B & C;

assign F = m0 | m2 | m6;   // OR

endmodule
