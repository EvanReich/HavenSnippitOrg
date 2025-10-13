module REPEATCLOCK (
    output reg CLK
);

    initial begin
        CLK = 1'b0;
        repeat (10)
            #10 CLK = ~CLK;
    end

endmodule
