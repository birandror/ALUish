`timescale 1 ns / 1 ns
`include "basic_decoders.v"

module decoder_2to4_tb;
    reg [1:0] in;
    wire [3:0] out;

    decoder_2to4 UUT(in, out);

    initial begin
        $dumpfile("decoder_2to4_tb.vcd");
        $dumpvars(0, decoder_2to4_tb);

        in = 2'b00; #20;
        in = 2'b01; #20;
        in = 2'b10; #20;
        in = 2'b11; #20;
        in = 2'b00; #20;

        $display("decoder_2to4 tested.");
        $finish;
    end
endmodule