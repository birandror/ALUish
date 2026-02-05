`timescale 10 ns / 1 ns
`include "bitwise_gates.v"

module negation_16bit_tb;
    reg [15:0] in;
    wire [15:0] out;

    negation_16bit UUT(in, out);

    initial begin
        $dumpfile("negation_16bit_tb.vcd");
        $dumpvars(0, negation_16bit_tb);

        in = 16'h0000; #80;
        in = 16'h0001; #80;
        in = 16'hffff; #80;
        in = 16'h1f1f; #80;
        in = 16'h1234; #80;
        in = 16'hfedc; #80;
        in = 16'h8888; #80;
        in = 16'h0000; #80;

        $display("negation_16bit tested.");
        $finish;
    end
endmodule