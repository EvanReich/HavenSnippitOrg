module ARR7SEG (
    output wire [6:0] F,
    input wire [2:0] ABC
);

assign F = (ABC == 3'b000) ? 7'b111_1110 :
           (ABC == 3'b001) ? 7'b011_0000 :
           (ABC == 3'b010) ? 7'b110_1101 :
           (ABC == 3'b011) ? 7'b111_1001 :
           (ABC == 3'b100) ? 7'b011_0011 :
           (ABC == 3'b101) ? 7'b101_1011 :
           (ABC == 3'b110) ? 7'b101_1111 :
           (ABC == 3'b111) ? 7'b111_0000 : 
                            7'bxxxx_xxx;

endmodule
