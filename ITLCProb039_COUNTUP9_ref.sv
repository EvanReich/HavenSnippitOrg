module COUNTUP9 (
    output reg [3:0] CNT,
    input wire Clock, Reset
);

always @ (posedge Clock or negedge Reset)
begin: COUNTER
    if (!Reset)
        CNT <= 0;
    else
        if (CNT == 10)
            CNT <= 0;
        else
            CNT <= CNT + 1;
end

endmodule
