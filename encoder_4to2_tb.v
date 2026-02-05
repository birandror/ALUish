`timescale 1ns / 1ns
`include "basic_encoders.v"

module encoder_4to2_tb;
    reg [3:0] in;
    wire [1:0] out;

    encoder_4to2 UUT(in, out);

    initial begin
        $dumpfile("encoder_4to2_tb.vcd");
        $dumpvars(0, encoder_4to2_tb);

        in = 4'b0000; #20;
        in = 4'b0001; #20;
        in = 4'b0010; #20;
        in = 4'b0000; #20;
        in = 4'b0100; #20;
        in = 4'b1000; #20;

        $display("encoder_4to2 tested.");
        $finish;
    end
endmodule