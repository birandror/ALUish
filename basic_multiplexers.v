`include "basic_gates.v"

module multiplexer_1bit (in_0, in_1, choice, out);
    input in_0;
    input in_1;
    input choice;
    output out;
    wire not_choice;
    wire chosen_0;
    wire chosen_1;

    not_gate NO (.in(choice), .out(not_choice));
    and_gate AND_0 (.in_0(in_0), .in_1(not_choice), .out(chosen_0));
    and_gate AND_1 (.in_0(in_1), .in_1(choice), .out(chosen_1));
    or_gate OR (.in_0(chosen_0), .in_1(chosen_1), .out(out));
endmodule

module multiplexer_2bit (in_0, in_1, choice, out);
    input [1:0] in_0;
    input [1:0] in_1;
    input choice;
    output [1:0] out;

    multiplexer_1bit MUX_0 (.in_0(in_0[0]), .in_1(in_1[0]), .choice(choice), .out(out[0]));
    multiplexer_1bit MUX_1 (.in_0(in_0[1]), .in_1(in_1[1]), .choice(choice), .out(out[1]));
endmodule

module multiplexer_4bit (in_0, in_1, choice, out);
    input [3:0] in_0;
    input [3:0] in_1;
    input choice;
    output [3:0] out;

    multiplexer_2bit MUX_0 (.in_0(in_0[1:0]), .in_1(in_1[1:0]), .choice(choice), .out(out[1:0]));
    multiplexer_2bit MUX_1 (.in_0(in_0[3:2]), .in_1(in_1[3:2]), .choice(choice), .out(out[3:2]));
endmodule

module multiplexer_8bit (in_0, in_1, choice, out);
    input [7:0] in_0;
    input [7:0] in_1;
    input choice;
    output [7:0] out;

    multiplexer_4bit MUX_0 (.in_0(in_0[3:0]), .in_1(in_1[3:0]), .choice(choice), .out(out[3:0]));
    multiplexer_4bit MUX_1 (.in_0(in_0[7:4]), .in_1(in_1[7:4]), .choice(choice), .out(out[7:4]));
endmodule

module multiplexer_16bit (in_0, in_1, choice, out);
    input [15:0] in_0;
    input [15:0] in_1;
    input choice;
    output [15:0] out;

    multiplexer_8bit MUX_0 (.in_0(in_0[7:0]), .in_1(in_1[7:0]), .choice(choice), .out(out[7:0]));
    multiplexer_8bit MUX_1 (.in_0(in_0[15:8]), .in_1(in_1[15:8]), .choice(choice), .out(out[15:8]));
endmodule