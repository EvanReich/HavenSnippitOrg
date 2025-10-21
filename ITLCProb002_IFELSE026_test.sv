`timescale 1 ps/1 ps
`define OK 12
`define INCORRECT 13

module stimulus_gen (
    input clk,
    output reg reset,
    output reg A,
    output reg B,
    output reg C,
    input tb_match
);

    initial begin
        reset <= 1;
        @(posedge clk);
        reset <= 0;

        // Exhaustive input testing
        {A,B,C} <= 3'b000; @(posedge clk, negedge clk);
        {A,B,C} <= 3'b001; @(posedge clk, negedge clk);
        {A,B,C} <= 3'b010; @(posedge clk, negedge clk);
        {A,B,C} <= 3'b011; @(posedge clk, negedge clk);
        {A,B,C} <= 3'b100; @(posedge clk, negedge clk);
        {A,B,C} <= 3'b101; @(posedge clk, negedge clk);
        {A,B,C} <= 3'b110; @(posedge clk, negedge clk);
        {A,B,C} <= 3'b111; @(posedge clk, negedge clk);

        // Randomized verification
        repeat(40) @(posedge clk, negedge clk) begin
            {A,B,C} <= $random & 3'b111; // mask to 3 bits
        end

        #1 $finish;
    end

endmodule


module tb();

    typedef struct packed {
        int errors;
        int errortime;
        int errors_F;
        int errortime_F;
        int clocks;
    } stats;

    stats stats1;

    reg clk = 0;
    initial forever #5 clk = ~clk;

    logic reset;
    logic A, B, C;
    logic F_ref;
    logic F_dut;

    wire tb_match;
    wire tb_mismatch = ~tb_match;

    // Connect outputs from stimulus_gen to DUT/reference inputs
    stimulus_gen stim1 (
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .C(C),
        .tb_match(tb_match)
    );

    RefModule good1 (
        .A(A),
        .B(B),
        .C(C),
        .F(F_ref)
    );

    TopModule top_module1 (
        .A(A),
        .B(B),
        .C(C),
        .F(F_dut)
    );

    bit strobe = 0;
    task wait_for_end_of_timestep;
        repeat(5) begin
            strobe <= !strobe; // Try to delay until the very end of the time step
            @(strobe);
        end
    endtask

    final begin
        if (stats1.errors_F)
            $display("Hint: Output '%s' has %0d mismatches. First mismatch occurred at time %0d.", "F", stats1.errors_F, stats1.errortime_F);
        else
            $display("Hint: Output '%s' has no mismatches.", "F");

        $display("Hint: Total mismatched samples is %1d out of %1d samples", stats1.errors, stats1.clocks);
        $display("Simulation finished at %0d ps", $time);
        $display("Mismatches: %1d in %1d samples", stats1.errors, stats1.clocks);
    end

    assign tb_match = ({F_ref} === ({F_ref} ^ {F_dut} ^ {F_ref}));

    always @(posedge clk, negedge clk) begin
        stats1.clocks++;
        if (!tb_match) begin
            if (stats1.errors == 0) stats1.errortime = $time;
            stats1.errors++;
        end
        if (F_ref !== (F_ref ^ F_dut ^ F_ref)) begin
            if (stats1.errors_F == 0) stats1.errortime_F = $time;
            stats1.errors_F = stats1.errors_F + 1'b1;
        end
    end

    // add timeout after 100K cycles
    initial begin
        #1000000;
        $display("TIMEOUT");
        $finish();
    end

endmodule
