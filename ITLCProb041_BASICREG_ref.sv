module BASICREG (
    output reg [7:0] Reg_Out,
    input wire Clock, Reset, EN,
    input wire [7:0] Reg_In
);

always @ (posedge Clock or negedge Reset)
begin: REGISTER
    if (!Reset)
        Reg_Out <= 8'h00;
    else
        if (EN)
            Reg_Out <= Reg_In;
end

endmodule
