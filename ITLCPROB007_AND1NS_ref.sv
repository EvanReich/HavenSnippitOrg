`timescale 1ns/1ps

module AND1NS (output wire F,
                   input wire A, B);

    assign #1 F = A & B;

endmodule
