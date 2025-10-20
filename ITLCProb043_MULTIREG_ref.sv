module MULTIREG (
    output reg [7:0] A, B, C,
    input wire Clock, Reset,
    input wire [7:0] Data_Bus,
    input wire A_EN, B_EN, C_EN
);

always @ (posedge Clock or negedge Reset)
begin: A_REG
    if (!Reset)
        A <= 8'h00;
    else
        if (A_EN == 1)
            A <= Data_Bus;
end

always @ (posedge Clock or negedge Reset)
begin: B_REG
    if (!Reset)
        B <= 8'h00;
    else
        if (B_EN == 1)
            B <= Data_Bus;
end

always @ (posedge Clock or negedge Reset)
begin: C_REG
    if (!Reset)
        C <= 8'h00;
    else
        if (C_EN == 1)
            C <= Data_Bus;
end

endmodule
``
