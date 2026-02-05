`include "basic_adders.v"

module multiplier_2bit (in_0, in_1, prod);
    input [1:0] in_0;
    input [1:0] in_1;
    output [3:0] prod;
    wire w_01;
    wire w_10;
    wire c_2;
    wire w_11;

    and_gate AND_00 (.in_0(in_0[0]), .in_1(in_1[0]), .out(prod[0]));

    and_gate AND_01 (.in_0(in_0[0]), .in_1(in_1[1]), .out(w_01));
    and_gate AND_10 (.in_0(in_0[1]), .in_1(in_1[0]), .out(w_10));
    half_adder HA_1 (.in_0(w_01), .in_1(w_10), .sum(prod[1]), .carry(c_2));

    and_gate AND_11 (.in_0(in_0[1]), .in_1(in_1[1]), .out(w_11));
    half_adder HA_2 (.in_0(w_11), .in_1(c_2), .sum(prod[2]), .carry(prod[3]));
endmodule

module multiplier_4bit (in_0, in_1, prod);
    input [3:0] in_0;
    input [3:0] in_1;
    output [7:0] prod;
    wire [3:0] p_00;
    wire [3:0] p_01;
    wire [3:0] p_10;
    wire [3:0] s_0;
    wire c_0;
    wire [3:0] s_1;
    wire c_1;
    wire [3:0] p_11;
    wire [3:0] s_2;
    wire c_s;
    wire w;
    reg zero = 0;

    multiplier_2bit M2_00 (.in_0(in_0[1:0]), .in_1(in_1[1:0]), .prod(p_00));
    prod[0] = p_00[0];
    prod[1] = p_00[1];

    s_1[0] = p_00[2];
    s_1[1] = p_00[3];
    s_1[2] = zero;
    s_1[3] = zero;
    multiplier_2bit M2_01 (.in_0(in_0[1:0]), .in_1(in_1[3:2]), .prod(p_01));
    multiplier_2bit M2_10 (.in_0(in_0[3:2]), .in_1(in_1[1:0]), .prod(p_10));
    adder_4bit ADD4_0 (.in_0(p_01), .in_1(p_10), .carry_in(zero), .sum(s_0), .carry_out(c_0));
    adder_4bit ADD4_1 (.in_0(s_0), .in_1(s_1), .carry_in(zero), .sum(p_2), .carry_out(c_1));
    prod[2] = p_2[0];
    prod[3] = p_2[1];
    
    s_2[0] = p_2[2];
    s_2[1] = p_2[3];
    s_2[2] = zero;
    s_2[3] = zero;
    multiplier_2bit M2_11 (.in_0(in_0[3:2]), .in_1(in_1[3:2]), .prod(p_11));
    or_gate OR_0 (.in_0(c_0), .in_1(c_1), .out(c_s));
    adder_4bit ADD4_2 (.in_0(p_11), .in_1(s_2), .carry_in(c_s), .sum(prod[7:4]), .carry_out(w));
endmodule