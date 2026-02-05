`timescale 1ns / 1ns
`include "basic_gates.v"

module nand_gate_tb;

    reg A;
    reg B;
    wire F;

    nand_gate UUT(A, B, F);

    initial begin
        $dumpfile("nand_gate_tb.vcd");
        $dumpvars(0, nand_gate_tb);

        A = 0; B = 0; #20;
        A = 0; B = 1; #20;
        A = 1; B = 1; #20;
        A = 1; B = 0; #20;

        $display("nand_gate tested.");
    end

endmodule