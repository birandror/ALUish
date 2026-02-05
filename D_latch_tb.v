`timescale 1ns / 1ns
`include "basic_latches.v"

module D_latch_tb;

    reg D;
    reg write;
    wire Q;

    D_latch UUT(D, write, Q);

    initial begin
        $dumpfile("D_latch_tb.vcd");
        $dumpvars(0, D_latch_tb);

        D = 0; write = 1; #20;
        D = 0; write = 0; #20;
        D = 1; write = 0; #20;
        D = 1; write = 1; #20;
        D = 0; write = 1; #20;
        D = 0; write = 0; #20;
        D = 1; write = 0; #20;
        D = 1; write = 1; #20;
        D = 0; write = 0; #20;

        $display("D_latch tested.");
    end

endmodule