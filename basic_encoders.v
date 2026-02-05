`include "basic_gates.v"

module encoder_2to1 (in, out);
    input [1:0] in;
    output out;
    // assume in[0] AND in[1] == 0

    assign out = in[1];
endmodule

module encoder_4to2 (in, out);
    input [3:0] in;
    output [1:0] out;
    //assume no more than one input is on. If no input is on, output is 0.

    or_gate OR_0 (.in_0(in[1]), .in_1(in[3]), .out(out[0]));
    or_gate OR_1 (.in_0(in[3]), .in_1(in[2]), .out(out[1]));
endmodule

module encoder_8to3 (in, out);
    input [7:0] in;
    output [2:0] out;
    wire [1:0] w_0;
    wire [1:0] w_1;
    wire w_2;
    wire w_3;
    wire w_4;

    encoder_4to2 e4to2_0 (.in(in[3:0]), .out(w_0)); // w_0 = in (mod 4) if in < 4
    encoder_4to2 e4to2_1 (.in(in[7:4]), .out(w_1)); // w_1 = in (mod 4) if in >= 4
    or_gate OR_2 (.in_0(w_1[0]), .in_1(w_1[1]), .out(w_2)); // Is the number greater than 4?
    or_gate OR_3 (.in_0(in[4]), .in_1(w_2), .out(out[2])); // 4s position bit
    or_gate OR_4 (.in_0(w_0[1]), .in_1(w_1[1]), .out(out[1])); // 2s position bit
    or_gate OR_5 (.in_0(w_0[0]), .in_1(w_1[0]), .out(out[0])); // 1s position bit
endmodule

module encoder_16to4 (in, out);
    input [15:0] in;
    output [3:0] out;
    wire [2:0] w_0;
    wire [2:0] w_1;
    wire w_2;
    wire w_3;

    encoder_8to3 e8to3_0 (.in(in[7:0]), .out(w_0)); // w_0 = in (mod 8) if in < 8
    encoder_8to3 e8to3_1 (.in(in[15:8]), .out(w_1)); // w_1 = in (mod 8) if in >= 8
    or_gate OR_2 (.in_0(w_1[0]), .in_1(w_1[1]), .out(w_2));
    or_gate OR_3 (.in_0(w_2), .in_1(w_1[2]), .out(w_3)); // Is the number greater than 8?
    or_gate OR_4 (.in_0(in[8]), .in_1(w_3), .out(out[3])); // 8s position bit
    or_gate OR_5 (.in_0(w_0[2]), .in_1(w_1[2]), .out(out[2])); // 4s position digit
    or_gate OR_6 (.in_0(w_0[1]), .in_1(w_1[1]), .out(out[1])); // 2s position bit
    or_gate OR_7 (.in_0(w_0[0]), .in_1(w_1[0]), .out(out[0])); // 1s position bit
endmodule