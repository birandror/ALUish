`timescale 1 ns / 1 ns
`include "basic_decoders.v"

module decoder_3to8_tb;
    reg [2:0] in;
    wire [7:0] out;

    decoder_3to8 UUT(in, out);

    initial begin
        $dumpfile("decoder_3to8_tb.vcd");
        $dumpvars(0, decoder_3to8_tb);

        in = 3'b000; #30;
        in = 3'b001; #30;
        in = 3'b010; #30;
        in = 3'b011; #30;
        in = 3'b100; #30;
        in = 3'b101; #30;
        in = 3'b110; #30;
        in = 3'b111; #30;
        in = 3'b000; #30;

        $display("decoder_3to8 tested.");
        $finish;
    end
endmodule