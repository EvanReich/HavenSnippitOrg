module CONDENC (
    output wire [1:0] YZ,
    input wire [3:0] ABCD
);

assign YZ = (ABCD == 4'b0001) ? 2'b00 :
            (ABCD == 4'b0010) ? 2'b01 :
            (ABCD == 4'b0100) ? 2'b10 :
            (ABCD == 4'b1000) ? 2'b11 :
                               2'bxx;

endmodule
