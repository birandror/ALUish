`timescale 1 ns / 1 ns
`include "basic_adders.v"

module adder_4bit_tb;
    reg [3:0] in_0;
    reg [3:0] in_1;
    reg carry_in;
    wire [3:0] sum;
    wire carry_out;

    adder_4bit UUT(.in_0(in_0), .in_1(in_1), .carry_in(carry_in), .sum(sum), .carry_out(carry_out));

    initial begin
        $dumpfile("adder_4bit_tb.vcd");
        $dumpvars(0, adder_4bit_tb);

        in_0 = 4'b0000; in_1 = 4'b0000; carry_in = 0; #50;
        in_0 = 4'b0000; in_1 = 4'b0000; carry_in = 1; #50;
        in_0 = 4'b0000; in_1 = 4'b0001; carry_in = 0; #50;
        in_0 = 4'b0000; in_1 = 4'b0001; carry_in = 1; #50;
        in_0 = 4'b0001; in_1 = 4'b0000; carry_in = 0; #50;
        in_0 = 4'b0001; in_1 = 4'b0000; carry_in = 1; #50;
        in_0 = 4'b0001; in_1 = 4'b0010; carry_in = 0; #50;
        in_0 = 4'b0001; in_1 = 4'b0010; carry_in = 1; #50;
        in_0 = 4'b0100; in_1 = 4'b0010; carry_in = 0; #50;
        in_0 = 4'b0100; in_1 = 4'b0010; carry_in = 1; #50;
        in_0 = 4'b1000; in_1 = 4'b1000; carry_in = 0; #50;
        in_0 = 4'b1000; in_1 = 4'b1000; carry_in = 1; #50;
        in_0 = 4'b0000; in_1 = 4'b0000; carry_in = 0; #50;
        in_0 = 4'b0000; in_1 = 4'b0000; carry_in = 1; #50;

        $display("adder_4bit tested.");
        $finish;
    end

endmodule