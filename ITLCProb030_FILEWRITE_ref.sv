module FILEWRITE (
    input integer A,
    input real B
);
    integer FILE_1;

    initial begin
        FILE_1 = $fopen("Data_out.txt", "w");
        $fdisplay(FILE_1, "A is %d", A);
        $fdisplay(FILE_1, "B is %f", B);
        $fclose(FILE_1);
    end
endmodule
