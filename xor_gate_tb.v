`timescale 1 ns / 1 ns
`include "basic_gates.v"

module xor_gate_tb;

    reg in_0;
    reg in_1;
    wire out;

    xor_gate UUT (in_0, in_1, out);

    initial begin
        $dumpfile("xor_gate_tb.vcd");
        $dumpvars(0, xor_gate_tb);

        in_0 = 0; in_1 = 0; #20;
        in_0 = 1; in_1 = 0; #20;
        in_0 = 0; in_1 = 1; #20;
        in_0 = 1; in_1 = 1; #20;
        in_0 = 0; in_1 = 0; #20;

        $display("xor_gate tested.");
        $finish;
    end

endmodule