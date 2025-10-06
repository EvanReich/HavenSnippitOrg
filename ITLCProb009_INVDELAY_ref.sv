`timescale 1ns/1ps

module INVDELAY (output wire F, input wire A);

    assign #3 F = ~A;

endmodule
