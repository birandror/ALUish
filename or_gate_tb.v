`timescale 1ns / 1ns
`include "basic_gates.v"

module or_gate_tb;

    reg A;
    reg B;
    wire F;

    or_gate UUT(A, B, F);

    initial begin
        $dumpfile("or_gate_tb.vcd");
        $dumpvars(0, or_gate_tb);

        A = 0; B = 0; #20;
        A = 0; B = 1; #20;
        A = 1; B = 1; #20;
        A = 1; B = 0; #20;

        $display("or_gate tested");
    end

endmodule