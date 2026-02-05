`timescale 1 ns / 1 ns
`include "basic_adders.v"

module full_adder_tb;
    reg in_0;
    reg in_1;
    reg carry_in;
    wire sum;
    wire carry_out;

    full_adder UUT(.in_0(in_0), .in_1(in_1), .carry_in(carry_in), .sum(sum), .carry_out(carry_out));

    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);

        in_0 = 0; in_1 = 0; carry_in = 0; #30;
        in_0 = 0; in_1 = 0; carry_in = 1; #30;
        in_0 = 0; in_1 = 1; carry_in = 0; #30;
        in_0 = 0; in_1 = 1; carry_in = 1; #30;
        in_0 = 1; in_1 = 0; carry_in = 0; #30;
        in_0 = 1; in_1 = 0; carry_in = 1; #30;
        in_0 = 1; in_1 = 1; carry_in = 0; #30;
        in_0 = 1; in_1 = 1; carry_in = 1; #30;
        in_0 = 0; in_1 = 0; carry_in = 0; #30;

        $display("full_adder tested.");
        $finish;
    end

endmodule