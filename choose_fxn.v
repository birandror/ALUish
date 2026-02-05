`include "basic_decoders.v"
`include "basic_encoders.v"
`include "basic_comparisons.v"
`include "basic_multiplexers.v"
`include "bitwise_gates.v"
`include "basic_flipflops.v"

module choose_fxn (in_0, in_1, choice, out, carry);
    input [15:0] in_0;
    input [15:0] in_1;
    input [2:0] choice;
    output [15:0] out;
    output carry;
    wire [15:0] f_0;
    wire [15:0] f_1;
    wire [15:0] f_2;
    wire [15:0] f_3;
    wire f_4;
    wire f_4_true;
    wire [15:0] f_5;
    wire f_5_carry;
    wire f_5_carry_true;
    wire [3:0] f_6;
    reg [15:0] f_6_buffed;
    wire [15:0] f_7;
    wire [15:0] c_00;
    wire [15:0] c_01;
    wire [15:0] c_02;
    wire [15:0] c_03;
    wire [15:0] c_10;
    wire [15:0] c_11;
    wire [7:0] decoded_choice;
    reg zero = 0;
    reg [15:0] zeroes;

    /* The functions are:
    0. bitwise AND
    1. bitwise OR
    2. bitwise XOR
    3. negation (one's complement of in_0)
    4. integer comparison (i.e. is in_0 < in_1?)
    5. addition (with carry)
    6. 16-to-4 encoder (on in_0)
    7. 4-to-16 decoder (on in_0[3:0])
    */

    and_16_bitwise_gate AND (.in_0(in_0), .in_1(in_1), .out(f_0));
    or_16_bitwise_gate OR (.in_0(in_0), .in_1(in_1), .out(f_1));
    xor_16_bitwise_gate XOR (.in_0(in_0), .in_1(in_1), .out(f_2));
    negation_16bit NO (.in(in_0), .out(f_3));
    compare_16bit COM (.in_0(in_0), .in_1(in_1), .out(f_4));
    adder_16bit ADD (.in_0(in_0), .in_1(in_1), .carry_in(zero), .sum(f_5), .carry_out(f_5_carry));
    encoder_16to4 EN (.in(in_0), .out(f_6));
    decoder_4to16 DEC (.in(in_0[3:0]), .out(f_7));

    integer i;
    always begin
        for (i = 0; i < 4; i = i + 1) begin
            f_6_buffed[i] = f_6[i];
            zeroes[i] = 0;
        end
        for (i = 4; i < 16; i = i + 1) begin
            f_6_buffed[i] = 0;
            zeroes[i] = 0;
        end
        #1;
    end

    multiplexer_16bit MUX_00 (.in_0(f_0), .in_1(f_1), .choice(choice[0]), .out(c_00));
    multiplexer_16bit MUX_01 (.in_0(f_2), .in_1(f_3), .choice(choice[0]), .out(c_01));
    multiplexer_16bit MUX_02 (.in_0(zeroes), .in_1(f_5), .choice(choice[0]), .out(c_02));
    multiplexer_16bit MUX_03 (.in_0(f_6_buffed), .in_1(f_7), .choice(choice[0]), .out(c_03));

    multiplexer_16bit MUX_10 (.in_0(c_00), .in_1(c_01), .choice(choice[1]), .out(c_10));
    multiplexer_16bit MUX_11 (.in_0(c_02), .in_1(c_03), .choice(choice[1]), .out(c_11));
    multiplexer_16bit MUX_2 (.in_0(c_10), .in_1(c_11), .choice(choice[2]), .out(out));

    decoder_3to8 DEC_carry (.in(choice[2:0]), .out(decoded_choice));
    and_gate AND_f_4 (.in_0(f_4), .in_1(decoded_choice[4]), .out(f_4_true));
    and_gate AND_carry (.in_0(f_5_carry), .in_1(decoded_choice[5]), .out(f_5_carry_true));
    or_gate OR_carry (.in_0(f_4_true), .in_1(f_5_carry_true), .out(carry));
endmodule

module choose_fxn_mem (in_0, in_1, choice, CLK, out, carry);
    input [15:0] in_0;
    input [15:0] in_1;
    input [3:0] choice;
    input CLK;
    output [15:0] out;
    output carry;
    wire [15:0] out_internal;
    wire carry_internal;

    choose_fxn F (.in_0(in_0), .in_1(in_1), .choice(choice[2:0]), .out(out_internal), .carry(carry_internal));

    // choice[3] says whether we store or not
    D_flipflop_16bit D_out (.D(out_internal), .wr(choice[3]), .CLK(CLK), .Q(out));
    D_flipflop D_carry (.D(carry_internal), .wr(choice[3]), .CLK(CLK), .Q(carry));
endmodule