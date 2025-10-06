`timescale 1ns/1ps

module AND2H3L (output wire F,
                   input wire A, B);

  assign #(2,3) F = A & B;

endmodule
