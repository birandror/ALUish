`timescale 1 ns / 1 ns
`include "basic_adders.v"

module adder_16bit_tb;
    reg [15:0] in_0;
    reg [15:0] in_1;
    reg carry_in;
    wire [15:0] sum;
    wire carry_out;

    adder_16bit UUT(.in_0(in_0), .in_1(in_1), .carry_in(carry_in), .sum(sum), .carry_out(carry_out));

    initial begin
        $dumpfile("adder_16bit_tb.vcd");
        $dumpvars(0, adder_16bit_tb);

        in_0 = 16'b0000000000000000; in_1 = 16'b0000000000000000; carry_in = 0; #50;
        in_0 = 16'b0000000000000000; in_1 = 16'b0000000000000000; carry_in = 1; #50;
        in_0 = 16'b0000000000000010; in_1 = 16'b0000000000000001; carry_in = 0; #50;
        in_0 = 16'b0000000000000010; in_1 = 16'b0000000000000001; carry_in = 1; #50;
        in_0 = 16'b0000100000000010; in_1 = 16'b0000000000000101; carry_in = 0; #50;
        in_0 = 16'b0000100000000010; in_1 = 16'b0000000000000101; carry_in = 1; #50;
        in_0 = 16'b0000000000011010; in_1 = 16'b0000000000010101; carry_in = 0; #50;
        in_0 = 16'b0001000000001010; in_1 = 16'b0001000000000101; carry_in = 1; #50;
        in_0 = 16'b1001000000001010; in_1 = 16'b1001000000000101; carry_in = 0; #50;
        in_0 = 16'b1001000000001010; in_1 = 16'b1001000000000101; carry_in = 1; #50;
        in_0 = 16'b0000000000000000; in_1 = 16'b0000000000000000; carry_in = 0; #50;
        in_0 = 16'b0000000000000000; in_1 = 16'b0000000000000000; carry_in = 1; #50;

        $display("adder_16bit tested.");
        $finish;
    end

endmodule