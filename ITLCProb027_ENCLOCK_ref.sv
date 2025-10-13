module ENCLOCK (
    output reg CLK,
    input wire EN
);

    initial begin
        CLK = 1'b0;
        while (EN == 1'b1)
            #10 CLK = ~CLK;
    end

endmodule
