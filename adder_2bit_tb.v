`timescale 1 ns / 1 ns
`include "basic_adders.v"

module adder_2bit_tb;
    reg [1:0] in_0;
    reg [1:0] in_1;
    reg carry_in;
    wire [1:0] sum;
    wire carry_out;

    adder_2bit UUT(.in_0(in_0), .in_1(in_1), .carry_in(carry_in), .sum(sum), .carry_out(carry_out));

    initial begin
        $dumpfile("adder_2bit_tb.vcd");
        $dumpvars(0, adder_2bit_tb);

        in_0 = 2'b00; in_1 = 2'b00; carry_in = 0; #30;
        in_0 = 2'b00; in_1 = 2'b00; carry_in = 1; #30;
        in_0 = 2'b00; in_1 = 2'b01; carry_in = 0; #30;
        in_0 = 2'b00; in_1 = 2'b01; carry_in = 1; #30;
        in_0 = 2'b00; in_1 = 2'b10; carry_in = 0; #30;
        in_0 = 2'b00; in_1 = 2'b10; carry_in = 1; #30;
        in_0 = 2'b00; in_1 = 2'b11; carry_in = 0; #30;
        in_0 = 2'b00; in_1 = 2'b11; carry_in = 1; #30;
        in_0 = 2'b01; in_1 = 2'b00; carry_in = 0; #30;
        in_0 = 2'b01; in_1 = 2'b00; carry_in = 1; #30;
        in_0 = 2'b01; in_1 = 2'b01; carry_in = 0; #30;
        in_0 = 2'b01; in_1 = 2'b01; carry_in = 1; #30;
        in_0 = 2'b01; in_1 = 2'b10; carry_in = 0; #30;
        in_0 = 2'b01; in_1 = 2'b10; carry_in = 1; #30;
        in_0 = 2'b01; in_1 = 2'b11; carry_in = 0; #30;
        in_0 = 2'b01; in_1 = 2'b11; carry_in = 1; #30;
        in_0 = 2'b10; in_1 = 2'b00; carry_in = 0; #30;
        in_0 = 2'b10; in_1 = 2'b00; carry_in = 1; #30;
        in_0 = 2'b10; in_1 = 2'b01; carry_in = 0; #30;
        in_0 = 2'b10; in_1 = 2'b01; carry_in = 1; #30;
        in_0 = 2'b10; in_1 = 2'b10; carry_in = 0; #30;
        in_0 = 2'b10; in_1 = 2'b10; carry_in = 1; #30;
        in_0 = 2'b10; in_1 = 2'b11; carry_in = 0; #30;
        in_0 = 2'b10; in_1 = 2'b11; carry_in = 1; #30;
        in_0 = 2'b11; in_1 = 2'b00; carry_in = 0; #30;
        in_0 = 2'b11; in_1 = 2'b00; carry_in = 1; #30;
        in_0 = 2'b11; in_1 = 2'b01; carry_in = 0; #30;
        in_0 = 2'b11; in_1 = 2'b01; carry_in = 1; #30;
        in_0 = 2'b11; in_1 = 2'b10; carry_in = 0; #30;
        in_0 = 2'b11; in_1 = 2'b10; carry_in = 1; #30;
        in_0 = 2'b11; in_1 = 2'b11; carry_in = 0; #30;
        in_0 = 2'b11; in_1 = 2'b11; carry_in = 1; #30;
        in_0 = 2'b00; in_1 = 2'b00; carry_in = 0; #30;

        $display("adder_2bit tested.");
        $finish;
    end

endmodule