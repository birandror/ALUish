`timescale 100 ns / 1 ns
`include "choose_fxn.v"

module choose_fxn_tb;
    reg [15:0] in_0;
    reg [15:0] in_1;
    reg [2:0] choice;
    wire [15:0] out;
    wire carry;

    choose_fxn UUT (in_0, in_1, choice, out, carry);

    initial begin
        $dumpfile("choose_fxn_tb.vcd");
        $dumpvars(0, choose_fxn_tb);

        // 0. bitwise AND
        choice = 3'b000;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;
        in_0 = 16'hffff; in_1 = 16'hffff; #1;
        in_0 = 16'h0099; in_1 = 16'h0088; #1;
        in_0 = 16'h2060; in_1 = 16'h01ad; #1;
        in_0 = 16'h0123; in_1 = 16'habcd; #1;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;

        // 1. bitwise OR
        choice = 3'b001;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;
        in_0 = 16'hffff; in_1 = 16'hffff; #1;
        in_0 = 16'h0099; in_1 = 16'h0088; #1;
        in_0 = 16'h2060; in_1 = 16'h01ad; #1;
        in_0 = 16'h0123; in_1 = 16'habcd; #1;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;

        // 2. bitwise XOR
        choice = 3'b010;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;
        in_0 = 16'hffff; in_1 = 16'hffff; #1;
        in_0 = 16'h0099; in_1 = 16'h0088; #1;
        in_0 = 16'h2060; in_1 = 16'h01ad; #1;
        in_0 = 16'h0123; in_1 = 16'habcd; #1;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;

        // 3. negation (one's complement of in_0)
        choice = 3'b011;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;
        in_0 = 16'hffff; in_1 = 16'hffff; #1;
        in_0 = 16'h0099; in_1 = 16'h0088; #1;
        in_0 = 16'h2060; in_1 = 16'h01ad; #1;
        in_0 = 16'h0123; in_1 = 16'habcd; #1;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;

        // 4. integer comparison (i.e. is in_0 < in_1?)
        choice = 3'b100;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;
        in_0 = 16'hffff; in_1 = 16'hffff; #1;
        in_0 = 16'h0099; in_1 = 16'h0088; #1;
        in_0 = 16'h2060; in_1 = 16'h01ad; #1;
        in_0 = 16'h0123; in_1 = 16'habcd; #1;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;

        // 5. addition (with carry)
        choice = 3'b101;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;
        in_0 = 16'hffff; in_1 = 16'hffff; #1;
        in_0 = 16'h0099; in_1 = 16'h0088; #1;
        in_0 = 16'h2060; in_1 = 16'h01ad; #1;
        in_0 = 16'h0123; in_1 = 16'habcd; #1;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;

        // 6. 16-to-4 encoder (on in_0)
        choice = 3'b110;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;
        in_0 = 16'hffff; in_1 = 16'hffff; #1;
        in_0 = 16'h0099; in_1 = 16'h0088; #1;
        in_0 = 16'h2060; in_1 = 16'h01ad; #1;
        in_0 = 16'h0123; in_1 = 16'habcd; #1;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;

        // 7. 4-to-16 decoder (on in_0[3:0])
        choice = 3'b111;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;
        in_0 = 16'hffff; in_1 = 16'hffff; #1;
        in_0 = 16'h0099; in_1 = 16'h0088; #1;
        in_0 = 16'h2060; in_1 = 16'h01ad; #1;
        in_0 = 16'h0123; in_1 = 16'habcd; #1;
        in_0 = 16'h0000; in_1 = 16'h0000; #1;

        $display("choose_fxn tested.");
        $finish;
    end
endmodule