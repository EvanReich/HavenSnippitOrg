
module DECARR (output wire [7:0] F,
                          input wire [2:0] ABC);

assign F = (ABC == 3'b000) ? 8'b0000_0001 :
           (ABC == 3'b001) ? 8'b0000_0010 :
           (ABC == 3'b010) ? 8'b0000_0100 :
           (ABC == 3'b011) ? 8'b0000_1000 :
           (ABC == 3'b100) ? 8'b0001_0000 :
           (ABC == 3'b101) ? 8'b0010_0000 :
           (ABC == 3'b110) ? 8'b0100_0000 :
           (ABC == 3'b111) ? 8'b1000_0000 : 
                             8'bxxxx_xxxx;
endmodule
