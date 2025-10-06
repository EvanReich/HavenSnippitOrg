module SystemX (output wire F,
                input wire A, B, C);

  assign F = ((A == 1'b0) && (B == 1'b0) && (C == 1'b0)) ? 1'b1 :
             ((A == 1'b0) && (B == 1'b1) && (C == 1'b0)) ? 1'b1 :
             ((A == 1'b1) && (B == 1'b0) && (C == 1'b0)) ? 1'b1 :
              1'b0;
endmodule
