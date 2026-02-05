`timescale 1 ns / 1 ns
`include "basic_decoders.v"

module decoder_4to16_tb;
    reg [3:0] in;
    wire [15:0] out;

    decoder_4to16 UUT(in, out);

    initial begin
        $dumpfile("decoder_4to16_tb.vcd");
        $dumpvars(0, decoder_4to16_tb);

        in = 4'b0000; #30;
        in = 4'b0001; #30;
        in = 4'b0010; #30;
        in = 4'b0011; #30;
        in = 4'b0100; #30;
        in = 4'b0101; #30;
        in = 4'b0110; #30;
        in = 4'b0111; #30;
        in = 4'b1000; #30;
        in = 4'b1001; #30;
        in = 4'b1010; #30;
        in = 4'b1011; #30;
        in = 4'b1100; #30;
        in = 4'b1101; #30;
        in = 4'b1110; #30;
        in = 4'b1111; #30;
        in = 4'b0000; #30;

        $display("decoder_4to16 tested.");
        $finish;
    end
endmodule