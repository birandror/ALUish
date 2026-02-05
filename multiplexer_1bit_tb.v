`timescale 100 ns / 1 ns
`include "basic_multiplexers.v"

module multiplexer_1bit_tb;
    reg in_0;
    reg in_1;
    reg choice;
    wire out;

    multiplexer_1bit UUT (in_0, in_1, choice, out);

    initial begin
        $dumpfile("multiplexer_1bit_tb.vcd");
        $dumpvars(0, multiplexer_1bit_tb);

        in_0 = 0; in_1 = 0; choice = 0; #5;
        in_0 = 0; in_1 = 0; choice = 1; #5;
        in_0 = 0; in_1 = 1; choice = 0; #5;
        in_0 = 0; in_1 = 1; choice = 1; #5;
        in_0 = 1; in_1 = 1; choice = 0; #5;
        in_0 = 1; in_1 = 1; choice = 1; #5;
        in_0 = 1; in_1 = 0; choice = 0; #5;
        in_0 = 1; in_1 = 0; choice = 1; #5;

        $display("multiplexer_1bit tested.");
        $finish;
    end
endmodule