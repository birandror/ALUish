`include "basic_gates.v"

module half_adder (in_0, in_1, sum, carry);
    input in_0;
    input in_1;
    output sum;
    output carry;

    xor_gate XOR_sum (.in_0(in_0), .in_1(in_1), .out(sum));
    and_gate AND_carry (.in_0(in_0), .in_1(in_1), .out(carry));
endmodule

module full_adder (in_0, in_1, carry_in, sum, carry_out);
    input in_0;
    input in_1;
    input carry_in;
    output sum;
    output carry_out;
    wire w_0;
    wire w_1;
    wire w_2;

    half_adder HA_0 (.in_0(in_0), .in_1(in_1), .sum(w_0), .carry(w_1));
    half_adder HA_1 (.in_0(w_0), .in_1(carry_in), .sum(sum), .carry(w_2));
    or_gate OR_2 (.in_0(w_1), .in_1(w_2), .out(carry_out));
endmodule

module adder_2bit (in_0, in_1, carry_in, sum, carry_out);
    input [1:0] in_0;
    input [1:0] in_1;
    input carry_in;
    output [1:0] sum;
    output carry_out;
    wire w_0;

    full_adder FA_0 (.in_0(in_0[0]), .in_1(in_1[0]), .carry_in(carry_in), .sum(sum[0]), .carry_out(w_0));
    full_adder FA_1 (.in_0(in_0[1]), .in_1(in_1[1]), .carry_in(w_0), .sum(sum[1]), .carry_out(carry_out));
endmodule

module adder_4bit (in_0, in_1, carry_in, sum, carry_out);
    input [3:0] in_0;
    input [3:0] in_1;
    input carry_in;
    output [3:0] sum;
    output carry_out;
    wire w_0;

    adder_2bit A2_0 (.in_0(in_0[1:0]), .in_1(in_1[1:0]), .carry_in(carry_in), .sum(sum[1:0]), .carry_out(w_0));
    adder_2bit A2_1 (.in_0(in_0[3:2]), .in_1(in_1[3:2]), .carry_in(w_0), .sum(sum[3:2]), .carry_out(carry_out));
endmodule

module adder_8bit (in_0, in_1, carry_in, sum, carry_out);
    input [7:0] in_0;
    input [7:0] in_1;
    input carry_in;
    output [7:0] sum;
    output carry_out;
    wire w_0;

    adder_4bit A2_0 (.in_0(in_0[3:0]), .in_1(in_1[3:0]), .carry_in(carry_in), .sum(sum[3:0]), .carry_out(w_0));
    adder_4bit A2_1 (.in_0(in_0[7:4]), .in_1(in_1[7:4]), .carry_in(w_0), .sum(sum[7:4]), .carry_out(carry_out));
endmodule

module adder_16bit (in_0, in_1, carry_in, sum, carry_out);
    input [15:0] in_0;
    input [15:0] in_1;
    input carry_in;
    output [15:0] sum;
    output carry_out;
    wire w_0;

    adder_8bit A2_0 (.in_0(in_0[7:0]), .in_1(in_1[7:0]), .carry_in(carry_in), .sum(sum[7:0]), .carry_out(w_0));
    adder_8bit A2_1 (.in_0(in_0[15:8]), .in_1(in_1[15:8]), .carry_in(w_0), .sum(sum[15:8]), .carry_out(carry_out));
endmodule