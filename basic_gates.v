`ifndef BASIC_GATES_V
`define BASIC_GATES_V

module nand_gate (in_0, in_1, out);

    input in_0;
    input in_1;
    output out;

    assign #0.01 out = ~(in_0 & in_1);

endmodule

module not_gate (in, out);

    input in;
    output out;

    nand_gate N0 (.in_0(in), .in_1(in), .out(out));

endmodule

module and_gate (in_0, in_1, out);

    input in_0;
    input in_1;
    output out;
    wire W;

    nand_gate NA (.in_0(in_0), .in_1(in_1), .out(W));
    not_gate NO (.in(W), .out(out));

endmodule

module or_gate (in_0, in_1, out);

    input in_0;
    input in_1;
    output out;
    wire W_0;
    wire W_1;
    
    not_gate NO_0 (.in(in_0), .out(W_0));
    not_gate NO_1 (.in(in_1), .out(W_1));
    nand_gate NA (.in_0(W_0), .in_1(W_1), .out(out));
    
endmodule

module xor_gate (in_0, in_1, out);

    input in_0;
    input in_1;
    output out;
    wire W_0;
    wire W_1;
    wire W_2;
    wire W_3;

    nand_gate NAND_0 (.in_0(in_0), .in_1(in_1), .out(W_0));
    or_gate OR_1 (.in_0(in_0), .in_1(in_1), .out(W_1));
    and_gate AND_2 (.in_0(W_0), .in_1(W_1), .out(out));

endmodule

`endif