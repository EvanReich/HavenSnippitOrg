module CLOCK10 (
    output reg CLK
);

    initial begin
        CLK = 1'b0;
        forever
            #10 CLK = ~CLK;
    end

endmodule
