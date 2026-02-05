`include "basic_gates.v"

module compare_1bit (in_0, in_1, out); // Is in_1 greater than in_0?
    input in_0;
    input in_1;
    output out;
    wire not_in_0;

    not_gate NO (.in(in_0), .out(not_in_0));
    and_gate AND (.in_0(not_in_0), .in_1(in_1), .out(out));
endmodule

module compare_2bit (in_0, in_1, out); // Is in_1 greater than in_0?
    input [1:0] in_0;
    input [1:0] in_1;
    output out;
    wire [1:0] not_0;
    wire a_0;
    wire a_10;
    wire a_11;
    wire a_20;
    wire a_21;
    wire o_0;

    not_gate NO_0 (.in(in_0[0]), .out(not_0[0]));
    not_gate NO_1 (.in(in_0[1]), .out(not_0[1]));
    and_gate AND_0 (.in_0(not_0[1]), .in_1(in_1[1]), .out(a_0));
    and_gate AND_10 (.in_0(not_0[0]), .in_1(not_0[1]), .out(a_10));
    and_gate AND_11 (.in_0(a_10), .in_1(in_1[0]), .out(a_11));
    and_gate AND_20 (.in_0(in_1[0]), .in_1(in_1[1]), .out(a_20));
    and_gate AND_21 (.in_0(not_0[0]), .in_1(a_20), .out(a_21));
    or_gate OR_0 (.in_0(a_0), .in_1(a_11), .out(o_0));
    or_gate OR_1 (.in_0(a_21), .in_1(o_0), .out(out));
endmodule

module compare_4bit (in_0, in_1, out);
    input [3:0] in_0;
    input [3:0] in_1;
    output out;
    wire c_2;
    wire c_2b;
    wire c_0;
    wire not_c_2b;
    wire o_0;

    compare_2bit C2_2 (.in_0(in_0[3:2]), .in_1(in_1[3:2]), .out(c_2));
    compare_2bit C2_2B (.in_0(in_1[3:2]), .in_1(in_0[3:2]), .out(c_2b));
    compare_2bit C2_0 (.in_0(in_0[1:0]), .in_1(in_1[1:0]), .out(c_0));
    not_gate NO_C_2B (.in(c_2b), .out(not_c_2b));
    or_gate OR_0 (.in_0(c_2), .in_1(c_0), .out(o_0));
    and_gate AND_0 (.in_0(not_c_2b), .in_1(o_0), .out(out));
endmodule

module compare_8bit (in_0, in_1, out);
    input [7:0] in_0;
    input [7:0] in_1;
    output out;
    wire c_2;
    wire c_2b;
    wire c_0;
    wire not_c_2b;
    wire o_0;

    compare_4bit C4_2 (.in_0(in_0[7:4]), .in_1(in_1[7:4]), .out(c_2));
    compare_4bit C4_2B (.in_0(in_1[7:4]), .in_1(in_0[7:4]), .out(c_2b));
    compare_4bit C4_0 (.in_0(in_0[3:0]), .in_1(in_1[3:0]), .out(c_0));
    not_gate NO_C_2B (.in(c_2b), .out(not_c_2b));
    or_gate OR_0 (.in_0(c_2), .in_1(c_0), .out(o_0));
    and_gate AND_0 (.in_0(not_c_2b), .in_1(o_0), .out(out));
endmodule

module compare_16bit (in_0, in_1, out);
    input [15:0] in_0;
    input [15:0] in_1;
    output out;
    wire c_2;
    wire c_2b;
    wire c_0;
    wire not_c_2b;
    wire o_0;

    compare_8bit C8_2 (.in_0(in_0[15:8]), .in_1(in_1[15:8]), .out(c_2));
    compare_8bit C8_2B (.in_0(in_1[15:8]), .in_1(in_0[15:8]), .out(c_2b));
    compare_8bit C8_0 (.in_0(in_0[7:0]), .in_1(in_1[7:0]), .out(c_0));
    not_gate NO_C_2B (.in(c_2b), .out(not_c_2b));
    or_gate OR_0 (.in_0(c_2), .in_1(c_0), .out(o_0));
    and_gate AND_0 (.in_0(not_c_2b), .in_1(o_0), .out(out));
endmodule