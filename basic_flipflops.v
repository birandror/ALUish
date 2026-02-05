`include "basic_latches.v"

module D_flipflop (D, wr, CLK, Q);
    input D;
    input wr;
    input CLK;
    output Q;
    // Begin test with wr * CLK = 1

    /*always @ (posedge (CLK & wr)) begin
        assign Q <= D;
    end*/

    wire E, mid_Q, not_CLK;

    not_gate NO_not_CLK (.in(CLK), .out(not_CLK));
    and_gate AND_E (.in_0(wr), .in_1(not_CLK), .out(E));
    D_latch master (.D(D), .write(E), .Q(mid_Q));
    D_latch slave (.D(mid_Q), .write(CLK), .Q(Q));
endmodule

module D_flipflop_16bit (D, wr, CLK, Q);
    input [15:0] D;
    input wr;
    input CLK;
    output [15:0] Q;

    D_flipflop D0 (.D(D[0]), .wr(wr), .CLK(CLK), .Q(Q[0]));
    D_flipflop D1 (.D(D[1]), .wr(wr), .CLK(CLK), .Q(Q[1]));
    D_flipflop D2 (.D(D[2]), .wr(wr), .CLK(CLK), .Q(Q[2]));
    D_flipflop D3 (.D(D[3]), .wr(wr), .CLK(CLK), .Q(Q[3]));
    D_flipflop D4 (.D(D[4]), .wr(wr), .CLK(CLK), .Q(Q[4]));
    D_flipflop D5 (.D(D[5]), .wr(wr), .CLK(CLK), .Q(Q[5]));
    D_flipflop D6 (.D(D[6]), .wr(wr), .CLK(CLK), .Q(Q[6]));
    D_flipflop D7 (.D(D[7]), .wr(wr), .CLK(CLK), .Q(Q[7]));
    D_flipflop D8 (.D(D[8]), .wr(wr), .CLK(CLK), .Q(Q[8]));
    D_flipflop D9 (.D(D[9]), .wr(wr), .CLK(CLK), .Q(Q[9]));
    D_flipflop D10 (.D(D[10]), .wr(wr), .CLK(CLK), .Q(Q[10]));
    D_flipflop D11 (.D(D[11]), .wr(wr), .CLK(CLK), .Q(Q[11]));
    D_flipflop D12 (.D(D[12]), .wr(wr), .CLK(CLK), .Q(Q[12]));
    D_flipflop D13 (.D(D[13]), .wr(wr), .CLK(CLK), .Q(Q[13]));
    D_flipflop D14 (.D(D[14]), .wr(wr), .CLK(CLK), .Q(Q[14]));
    D_flipflop D15 (.D(D[15]), .wr(wr), .CLK(CLK), .Q(Q[15]));
endmodule