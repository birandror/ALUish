`timescale 1ns / 1ns
`include "basic_gates.v"

module and_gate_tb;
    reg A;
    reg B;
    wire F;

    and_gate UUT(A, B, F);

    initial begin
        $dumpfile("and_gate_tb.vcd");
        $dumpvars(0, and_gate_tb);

        A = 0; B = 0; #20;
        A = 0; B = 1; #20;
        A = 1; B = 1; #20;
        A = 1; B = 0; #20;
        A = 0; B = 0; #20;
        A = 1; B = 1; #20;

        $display("and_gate tested.");
    end

endmodule