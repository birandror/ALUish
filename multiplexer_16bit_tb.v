`timescale 10 ns / 1 ns
`include "basic_multiplexers.v"

module multiplexer_16bit_tb;
    reg [15:0] in_0;
    reg [15:0] in_1;
    reg choice;
    wire [15:0] out;

    multiplexer_16bit UUT (in_0, in_1, choice, out);

    initial begin
        $dumpfile("multiplexer_16bit_tb.vcd");
        $dumpvars(0, multiplexer_16bit_tb);

        in_0 = 16'h0000; in_1 = 16'hffff; choice = 0; #5;
        in_0 = 16'h0000; in_1 = 16'hffff; choice = 1; #5;
        in_0 = 16'h1234; in_1 = 16'hfedc; choice = 0; #5;
        in_0 = 16'h1234; in_1 = 16'hfedc; choice = 1; #5;
        in_0 = 16'h9879; in_1 = 16'h8a43; choice = 0; #5;
        in_0 = 16'h9879; in_1 = 16'h8a43; choice = 1; #5;
        in_0 = 16'hbbc3; in_1 = 16'hcbc2; choice = 0; #5;
        in_0 = 16'hbbc3; in_1 = 16'hcbc2; choice = 1; #5;
        in_0 = 16'hffff; in_1 = 16'h0000; choice = 0; #5;
        in_0 = 16'hffff; in_1 = 16'h0000; choice = 1; #5;

        $display("multiplexer_16bit tested.");
        $finish;
    end
endmodule