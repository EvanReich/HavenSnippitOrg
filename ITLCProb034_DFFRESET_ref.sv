module DFFRESET (
    output reg Q, Qn,
    input wire Clock, Reset, D
);

always @ (posedge Clock or negedge Reset)
    if (!Reset)
    begin
        Q <= 1'b0;
        Qn <= 1'b1;
    end
    else
    begin
        Q <= D;
        Qn <= ~D;
    end

endmodule
