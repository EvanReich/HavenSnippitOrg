module SIMPLEROM (
    output reg [3:0] data_out,
    input wire [1:0] address
);

always @ (address)
    case (address)
        0       : data_out = 4'b1110;
        1       : data_out = 4'b0010;
        2       : data_out = 4'b1111;
        3       : data_out = 4'b0100;
        default : data_out = 4'bXXXX;
    endcase

endmodule
