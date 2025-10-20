module COUNTUP4 (
    output reg [3:0] CNT,
    input wire Clock, Reset
);

always @ (posedge Clock or negedge Reset)
begin: COUNTER
    if (!Reset)
        CNT <= 0;
    else
        CNT <= CNT + 1;
end

endmodule
