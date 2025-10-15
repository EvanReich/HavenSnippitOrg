module MEMORYREAD (
    input  [8*20:1] FILENAME,
    output reg [2:0] memory [7:0]
);

    initial begin: Read_Block
        $readmemb(FILENAME, memory);
    end

    initial begin: Print_Block
        $display("printing memory %b", memory[0]);
        $display("printing memory %b", memory[1]);
        $display("printing memory %b", memory[2]);
        $display("printing memory %b", memory[3]);
        $display("printing memory %b", memory[4]);
        $display("printing memory %b", memory[5]);
        $display("printing memory %b", memory[6]);
        $display("printing memory %b", memory[7]);
    end
endmodule

