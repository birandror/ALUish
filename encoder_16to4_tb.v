`timescale 1ns / 1ns
`include "basic_encoders.v"

module encoder_16to4_tb;
    reg [15:0] in;
    wire [3:0] out;

    encoder_16to4 UUT(in, out);

    initial begin
        $dumpfile("encoder_16to4_tb.vcd");
        $dumpvars(0, encoder_16to4_tb);

        in = 16'b0000000000000000; #20;
        in = 16'b0000000000000001; #20;
        in = 16'b0000000000000010; #20;
        in = 16'b0000000000000100; #20;
        in = 16'b0000000000001000; #20;
        in = 16'b0000000000010000; #20;
        in = 16'b0000000000100000; #20;
        in = 16'b0000000001000000; #20;
        in = 16'b0000000010000000; #20;
        in = 16'b0000000100000000; #20;
        in = 16'b0000001000000000; #20;
        in = 16'b0000010000000000; #20;
        in = 16'b0000100000000000; #20;
        in = 16'b0001000000000000; #20;
        in = 16'b0010000000000000; #20;
        in = 16'b0100000000000000; #20;
        in = 16'b1000000000000000; #20;
        in = 16'b0000000000000000; #20;

        $display("encoder_16to4 tested.");
        $finish;
    end
endmodule