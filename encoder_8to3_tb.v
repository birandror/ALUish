`timescale 1ns / 1ns
`include "basic_encoders.v"

module encoder_8to3_tb;
    reg [7:0] in;
    wire [2:0] out;

    encoder_8to3 UUT(in, out);

    initial begin
        $dumpfile("encoder_8to3_tb.vcd");
        $dumpvars(0, encoder_8to3_tb);

        in = 8'b00000000; #20;
        in = 8'b00000001; #20;
        in = 8'b00000010; #20;
        in = 8'b00000100; #20;
        in = 8'b00001000; #20;
        in = 8'b00010000; #20;
        in = 8'b00100000; #20;
        in = 8'b01000000; #20;
        in = 8'b10000000; #20;
        in = 8'b00000000; #20;

        $display("encoder_8to3 tested.");
        $finish;
    end
endmodule