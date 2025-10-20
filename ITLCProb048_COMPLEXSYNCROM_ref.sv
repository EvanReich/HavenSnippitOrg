module COMPLEXSYNCROM (
    output reg [3:0] data_out,
    input wire [1:0] address,
    input wire Clock
);

reg [3:0] ROM [0:3];

initial
begin
    ROM[0] = 4'b1110;
    ROM[1] = 4'b0010;
    ROM[2] = 4'b1111;
    ROM[3] = 4'b0100;
end

always @ (posedge Clock)
    data_out = ROM[address];

endmodule
