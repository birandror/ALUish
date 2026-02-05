`timescale 1ns / 1ns
`include "basic_encoders.v"

module encoder_2to1_tb;
    reg [1:0] in;
    wire out;

    encoder_2to1 UUT(in, out);

    initial begin
        $dumpfile("encoder_2to1_tb.vcd");
        $dumpvars(0, encoder_2to1_tb);

        in = 2'b00; #20;
        in = 2'b01; #20;
        in = 2'b10; #20;

        $display("encoder_2to1 tested.");
        $finish;
    end
endmodule