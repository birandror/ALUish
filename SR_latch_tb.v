`timescale 1ns / 1ns
`include "basic_latches.v"

module SR_latch_tb;

    reg A;
    reg B;
    wire Q_1;
    wire Q_0;

    SR_latch UUT (A, B, Q_1, Q_0);

    initial begin
        $dumpfile("SR_latch_tb.vcd");
        $dumpvars(0, SR_latch_tb);

        A = 0; B = 0; #20;
        A = 0; B = 1; #20;
        A = 1; B = 1; #20;
        A = 1; B = 0; #40;
        A = 1; B = 1; #20;
        A = 0; B = 1; #20;
        A = 0; B = 0; #20;

        $display("SR_latch tested");
    end

endmodule