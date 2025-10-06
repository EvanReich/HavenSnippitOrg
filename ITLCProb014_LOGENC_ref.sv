module LOGENC (
    output wire [1:0] YZ,
    input wire [3:0] ABCD
);

assign YZ[1] = ABCD[3] | ABCD[2];
assign YZ[0] = ABCD[3] | ABCD[1];

endmodule
