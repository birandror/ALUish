`include "basic_gates.v"

module SR_latch (S, R, Q_1, Q_0);

    input S;
    input R;
    output Q_1;
    output Q_0;
    // Must begin with SR != 11.

    wire W_S;
    wire W_R;

    nand_gate NA_S (.in_0(S), .in_1(W_S), .out(W_R));
    nand_gate NA_R (.in_0(R), .in_1(W_R), .out(W_S));

    assign Q_1 = W_S;
    assign Q_0 = W_R;

endmodule

module D_latch (D, write, Q);
    input D;
    input write;
    output Q;
    // Must begin with write = 1

    wire not_D;
    wire S;
    wire R;
    wire not_Q;

    not_gate NO (.in(D), .out(not_D));
    nand_gate NA_S (.in_0(not_D), .in_1(write), .out(S));
    nand_gate NA_R (.in_0(D), .in_1(write), .out(R));
    SR_latch L (.S(S), .R(R), .Q_1(Q), .Q_0(not_Q));
endmodule