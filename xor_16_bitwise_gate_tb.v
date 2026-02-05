`timescale 1 ns / 1 ns
`include "bitwise_gates.v"

module xor_16_bitwise_gate_tb;
    reg [15:0] in_0;
    reg [15:0] in_1;
    wire [15:0] out;

    xor_16_bitwise_gate UUT(in_0, in_1, out);

    initial begin
        $dumpfile("xor_16_bitwise_gate_tb.vcd");
        $dumpvars(0, xor_16_bitwise_gate_tb);

        in_0 = 16'h0000; in_1 = 16'h0000; #20;
        in_0 = 16'h0100; in_1 = 16'h0720; #20;
        in_0 = 16'h0ab0; in_1 = 16'h0ba0; #20;
        in_0 = 16'h1010; in_1 = 16'h0101; #20;
        in_0 = 16'hffff; in_1 = 16'h37be; #20;
        in_0 = 16'h0ab1; in_1 = 16'h0ba0; #20;
        in_0 = 16'h1111; in_1 = 16'h3333; #20;
        in_0 = 16'hffff; in_1 = 16'h0000; #20;
        in_0 = 16'h0000; in_1 = 16'h0000; #20;

        $display("xor_16_bitwise_gate tested.");
        $finish;
    end

endmodule