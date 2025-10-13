module AND3_ALWAYS (
    output reg F,
    input wire A, B, C
);

    always @ (A, B, C) begin
        F = A & B & C;
    end

endmodule
