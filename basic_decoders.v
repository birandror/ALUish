`include "basic_gates.v"

module decoder_2to4 (in, out);
    input [1:0] in;
    output [3:0] out;
    wire w_0;
    wire w_1;

    not_gate NOT_0 (.in(in[0]), .out(w_0));
    not_gate NOT_1 (.in(in[1]), .out(w_1));
    and_gate AND_0 (.in_0(w_0), .in_1(w_1), .out(out[0])); // Is it 0?
    and_gate AND_1 (.in_0(in[0]), .in_1(w_1), .out(out[1])); // Is it 1?
    and_gate AND_2 (.in_0(w_0), .in_1(in[1]), .out(out[2])); // Is it 2?
    and_gate AND_3 (.in_0(in[0]), .in_1(in[1]), .out(out[3])); // Is it 3?
endmodule

module decoder_3to8 (in, out);
    input [2:0] in;
    output [7:0] out;
    wire w_2;
    wire [3:0] w_3;

    not_gate NOT_2 (.in(in[2]), .out(w_2));
    decoder_2to4 d2to4_0 (.in(in[1:0]), .out(w_3[3:0])); // Find n (mod 4)
    and_gate AND_0 (.in_0(w_3[0]), .in_1(w_2), .out(out[0])); // Is it 0?
    and_gate AND_1 (.in_0(w_3[1]), .in_1(w_2), .out(out[1])); // Is it 1?
    and_gate AND_2 (.in_0(w_3[2]), .in_1(w_2), .out(out[2])); // Is it 2?
    and_gate AND_3 (.in_0(w_3[3]), .in_1(w_2), .out(out[3])); // Is it 3?
    and_gate AND_4 (.in_0(w_3[0]), .in_1(in[2]), .out(out[4])); // Is it 4?
    and_gate AND_5 (.in_0(w_3[1]), .in_1(in[2]), .out(out[5])); // Is it 5?
    and_gate AND_6 (.in_0(w_3[2]), .in_1(in[2]), .out(out[6])); // Is it 6?
    and_gate AND_7 (.in_0(w_3[3]), .in_1(in[2]), .out(out[7])); // Is it 7?
endmodule

module decoder_4to16 (in, out);
    input [3:0] in;
    output [15:0] out;
    wire [7:0] r_8;
    wire w;

    not_gate NOT_0 (.in(in[3]), .out(w));
    decoder_3to8 d3to8_0 (.in(in[2:0]), .out(r_8)); // n (mod 8)
    and_gate AND_0 (.in_0(r_8[0]), .in_1(w), .out(out[0])); // Is it 0?
    and_gate AND_1 (.in_0(r_8[1]), .in_1(w), .out(out[1])); // Is it 1?
    and_gate AND_2 (.in_0(r_8[2]), .in_1(w), .out(out[2])); // Is it 2?
    and_gate AND_3 (.in_0(r_8[3]), .in_1(w), .out(out[3])); // Is it 3?
    and_gate AND_4 (.in_0(r_8[4]), .in_1(w), .out(out[4])); // Is it 4?
    and_gate AND_5 (.in_0(r_8[5]), .in_1(w), .out(out[5])); // Is it 5?
    and_gate AND_6 (.in_0(r_8[6]), .in_1(w), .out(out[6])); // Is it 6?
    and_gate AND_7 (.in_0(r_8[7]), .in_1(w), .out(out[7])); // Is it 7?
    and_gate AND_8 (.in_0(r_8[0]), .in_1(in[3]), .out(out[8])); // Is it 8?
    and_gate AND_9 (.in_0(r_8[1]), .in_1(in[3]), .out(out[9])); // Is it 9?
    and_gate AND_10 (.in_0(r_8[2]), .in_1(in[3]), .out(out[10])); // Is it 10?
    and_gate AND_11 (.in_0(r_8[3]), .in_1(in[3]), .out(out[11])); // Is it 11?
    and_gate AND_12 (.in_0(r_8[4]), .in_1(in[3]), .out(out[12])); // Is it 12?
    and_gate AND_13 (.in_0(r_8[5]), .in_1(in[3]), .out(out[13])); // Is it 13?
    and_gate AND_14 (.in_0(r_8[6]), .in_1(in[3]), .out(out[14])); // Is it 14?
    and_gate AND_15 (.in_0(r_8[7]), .in_1(in[3]), .out(out[15])); // Is it 15?
endmodule