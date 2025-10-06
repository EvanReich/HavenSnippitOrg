module SIMPLEASSIGN026 (output wire F,
                input wire A, B, C);

    assign F = ( !C && (!A || B) ) ? 1'b1 : 1'b0;

endmodule
