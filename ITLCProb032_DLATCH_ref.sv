module DLATCH (
    output reg Q, Qn,
    input wire C, D
);

always @ (C or D)
  if (C == 1'b1)
  begin
    Q <= D;
    Qn <= ~D;
  end

endmodule
