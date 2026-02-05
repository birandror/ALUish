`timescale 1 ns / 1 ns
`include "basic_adders.v"

module half_adder_tb;
    reg in_0;
    reg in_1;
    wire sum;
    wire carry;

    half_adder UUT(.in_0(in_0), .in_1(in_1), .sum(sum), .carry(carry));

    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0, half_adder_tb);

        in_0 = 0; in_1 = 0; #30;
        in_0 = 1; in_1 = 0; #30;
        in_0 = 0; in_1 = 1; #30;
        in_0 = 1; in_1 = 1; #30;
        in_0 = 0; in_1 = 0; #30;

        $display("half_adder tested.");
        $finish;
    end

endmodule