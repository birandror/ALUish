`timescale 1 ns / 1 ns
`include "basic_multipliers.v"

module multiplier_2bit_tb;
    reg [1:0] in_0;
    reg [1:0] in_1;
    wire [3:0] prod;

    multiplier_2bit UUT(.in_0(in_0), .in_1(in_1), .prod(prod));

    initial begin
        $dumpfile("multiplier_2bit_tb.vcd");
        $dumpvars(0, multiplier_2bit_tb);

        in_0 = 2'b00; in_1 = 2'b00; #50;
        in_0 = 2'b00; in_1 = 2'b01; #50;
        in_0 = 2'b01; in_1 = 2'b00; #50;
        in_0 = 2'b01; in_1 = 2'b01; #50;
        in_0 = 2'b00; in_1 = 2'b10; #50;
        in_0 = 2'b00; in_1 = 2'b11; #50;
        in_0 = 2'b01; in_1 = 2'b10; #50;
        in_0 = 2'b01; in_1 = 2'b11; #50;
        in_0 = 2'b10; in_1 = 2'b00; #50;
        in_0 = 2'b10; in_1 = 2'b01; #50;
        in_0 = 2'b11; in_1 = 2'b00; #50;
        in_0 = 2'b11; in_1 = 2'b01; #50;
        in_0 = 2'b10; in_1 = 2'b10; #50;
        in_0 = 2'b10; in_1 = 2'b11; #50;
        in_0 = 2'b11; in_1 = 2'b10; #50;
        in_0 = 2'b11; in_1 = 2'b11; #50;
        in_0 = 2'b00; in_1 = 2'b00; #50;

        $display("multiplier_2bit tested.");
        $finish;
    end

endmodule