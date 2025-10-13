module BLOCKANDOR (
    output reg Y, Z,
    input wire A, B, C
);

always @ (A, B, C)
begin
    Y = A & B;
    Z = B | C;
end

endmodule
