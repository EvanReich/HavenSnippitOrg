module LOADCOUNT (
    output reg [3:0] CNT,
    input wire Clock, Reset, EN, Load,
    input wire [3:0] CNT_in
);

always @ (posedge Clock or negedge Reset)
begin: COUNTER
    if (!Reset)
        CNT <= 0;
    else
        if (EN)
            if (Load)
                CNT <= CNT_in;
            else
                CNT <= CNT + 1;
end

endmodule
