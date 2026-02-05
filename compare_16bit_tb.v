`timescale 100 ns / 1 ns
`include "basic_comparisons.v"

module compare_16bit_tb;
    reg [15:0] in_0;
    reg [15:0] in_1;
    wire out;

    compare_16bit UUT (in_0, in_1, out);

    initial begin
        $dumpfile("compare_16bit_tb.vcd");
        $dumpvars(0, compare_16bit_tb);

        in_0 = 16'h0000; in_1 = 16'h0000; #1;
        in_0 = 16'h0001; in_1 = 16'h0000; #1;
        in_0 = 16'h0000; in_1 = 16'h0001; #1;
        in_0 = 16'h00a2; in_1 = 16'h002a; #1;
        in_0 = 16'h002a; in_1 = 16'h00a2; #1;
        in_0 = 16'h3400; in_1 = 16'h4300; #1;
        in_0 = 16'h4300; in_1 = 16'h3400; #1;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;

        $display("compare_16bit tested.");
        $finish;
    end
endmodule