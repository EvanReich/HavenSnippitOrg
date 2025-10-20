module SHIFTREG (
    output reg [7:0] Dout0, Dout1, Dout2, Dout3,
    input wire Clock, Reset,
    input wire [7:0] Din
);

always @ (posedge Clock or negedge Reset)
begin: SHIFT_REGISTER
    if (!Reset)
    begin
        Dout0 <= 8'h00; 
        Dout1 <= 8'h00; 
        Dout2 <= 8'h00; 
        Dout3 <= 8'h00;
    end
    else
    begin
        Dout0 <= Din;   
        Dout1 <= Dout0;   
        Dout2 <= Dout1;   
        Dout3 <= Dout2;
    end
end

endmodule
