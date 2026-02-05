`timescale 1ns / 1ns
`include "basic_gates.v"

module not_gate_tb;

    reg A;
    wire F;

    not_gate UUT (A, F);

    initial begin
        $dumpfile("not_gate_tb.vcd");
        $dumpvars(0, not_gate_tb);

        A = 0; #20;
        A = 1; #20;

        $display("not_gate tested");
    end

endmodule