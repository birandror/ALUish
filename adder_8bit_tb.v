`timescale 1 ns / 1 ns
`include "basic_adders.v"

module adder_8bit_tb;
    reg [7:0] in_0;
    reg [7:0] in_1;
    reg carry_in;
    wire [7:0] sum;
    wire carry_out;

    adder_8bit UUT(.in_0(in_0), .in_1(in_1), .carry_in(carry_in), .sum(sum), .carry_out(carry_out));

    initial begin
        $dumpfile("adder_8bit_tb.vcd");
        $dumpvars(0, adder_8bit_tb);

        in_0 = 8'b00000000; in_1 = 8'b00000000; carry_in = 0; #50;
        in_0 = 8'b00000000; in_1 = 8'b00000000; carry_in = 1; #50;
        in_0 = 8'b00000010; in_1 = 8'b00000001; carry_in = 0; #50;
        in_0 = 8'b00000010; in_1 = 8'b00000001; carry_in = 1; #50;
        in_0 = 8'b00001010; in_1 = 8'b00000101; carry_in = 0; #50;
        in_0 = 8'b00001010; in_1 = 8'b00000101; carry_in = 1; #50;
        in_0 = 8'b00011010; in_1 = 8'b00010101; carry_in = 0; #50;
        in_0 = 8'b00011010; in_1 = 8'b00010101; carry_in = 1; #50;
        in_0 = 8'b10011010; in_1 = 8'b10010101; carry_in = 0; #50;
        in_0 = 8'b10011010; in_1 = 8'b10010101; carry_in = 1; #50;
        in_0 = 8'b00000000; in_1 = 8'b00000000; carry_in = 0; #50;
        in_0 = 8'b00000000; in_1 = 8'b00000000; carry_in = 1; #50;

        $display("adder_8bit tested.");
        $finish;
    end

endmodule