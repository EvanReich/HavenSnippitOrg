module CLOCKDISABLE (
    output reg CLK,
    input wire EN
);

    initial begin
        CLK = 1'b0;
        forever begin: loop
            if (EN == 1'b1)
                #10 CLK = ~CLK;
            else
                disable loop;
        end
    end

endmodule
