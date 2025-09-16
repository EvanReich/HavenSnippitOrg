
module CASE026
    (output reg F,
    input wire A, B, C);

    always @ (A, B, C)
    begin
        case ({A,B,C})
            3'b000 : F = 1'b1;
            3'b001 : F = 1'b0;
            3'b010 : F = 1'b1;
            3'b011 : F = 1'b0;
            3'b100 : F = 1'b0;
            3'b101 : F = 1'b0;
            3'b110 : F = 1'b0;
            3'b111 : F = 1'b0;
            default: F = 1'bX; 
        endcase
    end
endmodule
