`include "basic_gates.v"
`include "basic_adders.v"

module and_16_bitwise_gate (in_0, in_1, out);
    input [15:0] in_0;
    input [15:0] in_1;
    output [15:0] out;

    and_gate AND_0 (.in_0(in_0[0]), .in_1(in_1[0]), .out(out[0]));
    and_gate AND_1 (.in_0(in_0[1]), .in_1(in_1[1]), .out(out[1]));
    and_gate AND_2 (.in_0(in_0[2]), .in_1(in_1[2]), .out(out[2]));
    and_gate AND_3 (.in_0(in_0[3]), .in_1(in_1[3]), .out(out[3]));
    and_gate AND_4 (.in_0(in_0[4]), .in_1(in_1[4]), .out(out[4]));
    and_gate AND_5 (.in_0(in_0[5]), .in_1(in_1[5]), .out(out[5]));
    and_gate AND_6 (.in_0(in_0[6]), .in_1(in_1[6]), .out(out[6]));
    and_gate AND_7 (.in_0(in_0[7]), .in_1(in_1[7]), .out(out[7]));
    and_gate AND_8 (.in_0(in_0[8]), .in_1(in_1[8]), .out(out[8]));
    and_gate AND_9 (.in_0(in_0[9]), .in_1(in_1[9]), .out(out[9]));
    and_gate AND_10 (.in_0(in_0[10]), .in_1(in_1[10]), .out(out[10]));
    and_gate AND_11 (.in_0(in_0[11]), .in_1(in_1[11]), .out(out[11]));
    and_gate AND_12 (.in_0(in_0[12]), .in_1(in_1[12]), .out(out[12]));
    and_gate AND_13 (.in_0(in_0[13]), .in_1(in_1[13]), .out(out[13]));
    and_gate AND_14 (.in_0(in_0[14]), .in_1(in_1[14]), .out(out[14]));
    and_gate AND_15 (.in_0(in_0[15]), .in_1(in_1[15]), .out(out[15]));
endmodule

module or_16_bitwise_gate (in_0, in_1, out);
    input [15:0] in_0;
    input [15:0] in_1;
    output [15:0] out;

    or_gate OR_0 (.in_0(in_0[0]), .in_1(in_1[0]), .out(out[0]));
    or_gate OR_1 (.in_0(in_0[1]), .in_1(in_1[1]), .out(out[1]));
    or_gate OR_2 (.in_0(in_0[2]), .in_1(in_1[2]), .out(out[2]));
    or_gate OR_3 (.in_0(in_0[3]), .in_1(in_1[3]), .out(out[3]));
    or_gate OR_4 (.in_0(in_0[4]), .in_1(in_1[4]), .out(out[4]));
    or_gate OR_5 (.in_0(in_0[5]), .in_1(in_1[5]), .out(out[5]));
    or_gate OR_6 (.in_0(in_0[6]), .in_1(in_1[6]), .out(out[6]));
    or_gate OR_7 (.in_0(in_0[7]), .in_1(in_1[7]), .out(out[7]));
    or_gate OR_8 (.in_0(in_0[8]), .in_1(in_1[8]), .out(out[8]));
    or_gate OR_9 (.in_0(in_0[9]), .in_1(in_1[9]), .out(out[9]));
    or_gate OR_10 (.in_0(in_0[10]), .in_1(in_1[10]), .out(out[10]));
    or_gate OR_11 (.in_0(in_0[11]), .in_1(in_1[11]), .out(out[11]));
    or_gate OR_12 (.in_0(in_0[12]), .in_1(in_1[12]), .out(out[12]));
    or_gate OR_13 (.in_0(in_0[13]), .in_1(in_1[13]), .out(out[13]));
    or_gate OR_14 (.in_0(in_0[14]), .in_1(in_1[14]), .out(out[14]));
    or_gate OR_15 (.in_0(in_0[15]), .in_1(in_1[15]), .out(out[15]));
endmodule

module xor_16_bitwise_gate (in_0, in_1, out);
    input [15:0] in_0;
    input [15:0] in_1;
    output [15:0] out;

    xor_gate OR_0 (.in_0(in_0[0]), .in_1(in_1[0]), .out(out[0]));
    xor_gate OR_1 (.in_0(in_0[1]), .in_1(in_1[1]), .out(out[1]));
    xor_gate OR_2 (.in_0(in_0[2]), .in_1(in_1[2]), .out(out[2]));
    xor_gate OR_3 (.in_0(in_0[3]), .in_1(in_1[3]), .out(out[3]));
    xor_gate OR_4 (.in_0(in_0[4]), .in_1(in_1[4]), .out(out[4]));
    xor_gate OR_5 (.in_0(in_0[5]), .in_1(in_1[5]), .out(out[5]));
    xor_gate OR_6 (.in_0(in_0[6]), .in_1(in_1[6]), .out(out[6]));
    xor_gate OR_7 (.in_0(in_0[7]), .in_1(in_1[7]), .out(out[7]));
    xor_gate OR_8 (.in_0(in_0[8]), .in_1(in_1[8]), .out(out[8]));
    xor_gate OR_9 (.in_0(in_0[9]), .in_1(in_1[9]), .out(out[9]));
    xor_gate OR_10 (.in_0(in_0[10]), .in_1(in_1[10]), .out(out[10]));
    xor_gate OR_11 (.in_0(in_0[11]), .in_1(in_1[11]), .out(out[11]));
    xor_gate OR_12 (.in_0(in_0[12]), .in_1(in_1[12]), .out(out[12]));
    xor_gate OR_13 (.in_0(in_0[13]), .in_1(in_1[13]), .out(out[13]));
    xor_gate OR_14 (.in_0(in_0[14]), .in_1(in_1[14]), .out(out[14]));
    xor_gate OR_15 (.in_0(in_0[15]), .in_1(in_1[15]), .out(out[15]));
endmodule

module not_16_bitwise_gate (in, out);
    input [15:0] in;
    output [15:0] out;

    not_gate NO_0 (.in(in[0]), .out(out[0]));
    not_gate NO_1 (.in(in[1]), .out(out[1]));
    not_gate NO_2 (.in(in[2]), .out(out[2]));
    not_gate NO_3 (.in(in[3]), .out(out[3]));
    not_gate NO_4 (.in(in[4]), .out(out[4]));
    not_gate NO_5 (.in(in[5]), .out(out[5]));
    not_gate NO_6 (.in(in[6]), .out(out[6]));
    not_gate NO_7 (.in(in[7]), .out(out[7]));
    not_gate NO_8 (.in(in[8]), .out(out[8]));
    not_gate NO_9 (.in(in[9]), .out(out[9]));
    not_gate NO_10 (.in(in[10]), .out(out[10]));
    not_gate NO_11 (.in(in[11]), .out(out[11]));
    not_gate NO_12 (.in(in[12]), .out(out[12]));
    not_gate NO_13 (.in(in[13]), .out(out[13]));
    not_gate NO_14 (.in(in[14]), .out(out[14]));
    not_gate NO_15 (.in(in[15]), .out(out[15]));
endmodule

module negation_16bit (in, out); // unsigned negation
    input [15:0] in;
    output [15:0] out;
    wire [15:0] flip;
    wire co;
    reg zero = 0;

    not_16_bitwise_gate NO (.in(in), .out(flip));
    adder_16bit ADD (.in_0(16'h0001), .in_1(flip), .carry_in(zero), .sum(out), .carry_out(co));
endmodule