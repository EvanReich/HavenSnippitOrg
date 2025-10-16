module DFLIPFLOP ( 
    output reg Q, Qn,
    input wire Clock, D
);

always @ (posedge Clock)
begin
    Q <= D;
    Qn <= ~D;
end

endmodule
