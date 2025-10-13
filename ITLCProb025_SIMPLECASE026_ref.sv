module SIMPLECASE026 (
    output reg F,
    input wire A, B, C
);

    always @ (A, B, C) begin
        case ({A, B, C})
            3'b000, 3'b010, 3'b111: F = 1'b1;
            default: F = 1'b0;
        endcase
    end

endmodule
