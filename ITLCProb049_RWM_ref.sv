module RWM (
    output reg [3:0] data_out,
    input wire [1:0] address,
    input wire WE,
    input wire [3:0] data_in
);

reg [3:0] RW [0:3];

always @ (address or WE or data_in)
    if (WE)
        RW[address] = data_in;
    else
        data_out = RW[address];

endmodule
