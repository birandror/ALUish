`timescale 100 ns / 1 ns
`include "choose_fxn.v"

module choose_fxn_mem_tb;
    reg [15:0] in_0;
    reg [15:0] in_1;
    reg [3:0] choice;
    reg CLK = 1;
    wire [15:0] out;
    wire carry;

    choose_fxn_mem UUT (in_0, in_1, choice, CLK, out, carry);

    always begin
        //$display("Time: %0t | CLK: %b", $time, CLK);
        CLK = ~CLK;
        #2;
    end

    initial begin
        $dumpfile("choose_fxn_mem_tb.vcd");
        $dumpvars(0, choose_fxn_mem_tb);

        // 0. bitwise AND
        choice = 4'b1000;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;
        in_0 = 16'hffff; in_1 = 16'hffff; #5;
        in_0 = 16'h0099; in_1 = 16'h0088; #5;
        choice = 4'b0000;
        in_0 = 16'h2060; in_1 = 16'h01ad; #5;
        choice = 4'b1000;
        in_0 = 16'h0123; in_1 = 16'habcd; #5;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;

        // 1. bitwise OR
        choice = 4'b1001;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;
        choice = 4'b0001;
        in_0 = 16'hffff; in_1 = 16'hffff; #5;
        in_0 = 16'h0099; in_1 = 16'h0088; #5;
        choice = 4'b1001;
        in_0 = 16'h2060; in_1 = 16'h01ad; #5;
        in_0 = 16'h0123; in_1 = 16'habcd; #5;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;

        // 2. bitwise XOR
        choice = 4'b0010;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;
        in_0 = 16'hffff; in_1 = 16'hffff; #5;
        choice = 4'b1010;
        in_0 = 16'h0099; in_1 = 16'h0088; #5;
        in_0 = 16'h2060; in_1 = 16'h01ad; #5;
        in_0 = 16'h0123; in_1 = 16'habcd; #5;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;

        // 3. negation (one's complement of in_0)
        choice = 4'b1011;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;
        in_0 = 16'hffff; in_1 = 16'hffff; #5;
        in_0 = 16'h0099; in_1 = 16'h0088; #5;
        in_0 = 16'h2060; in_1 = 16'h01ad; #5;
        choice = 4'b0011;
        in_0 = 16'h0123; in_1 = 16'habcd; #5;
        choice = 4'b1011;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;

        // 4. integer comparison (i.e. is in_0 < in_1?)
        choice = 4'b0100;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;
        in_0 = 16'hffff; in_1 = 16'hffff; #5;
        choice = 4'b1100;
        in_0 = 16'h0099; in_1 = 16'h0088; #5;
        in_0 = 16'h2060; in_1 = 16'h01ad; #5;
        in_0 = 16'h0123; in_1 = 16'habcd; #5;
        choice = 4'b0100;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;

        // 5. addition (with carry)
        choice = 4'b0101;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;
        choice = 4'b1101;
        in_0 = 16'hffff; in_1 = 16'hffff; #5;
        in_0 = 16'h0099; in_1 = 16'h0088; #5;
        in_0 = 16'h2060; in_1 = 16'h01ad; #5;
        choice = 4'b0101;
        in_0 = 16'h0123; in_1 = 16'habcd; #5;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;

        // 6. 16-to-4 encoder (on in_0)
        choice = 4'b1110;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;
        in_0 = 16'hffff; in_1 = 16'hffff; #5;
        in_0 = 16'h0099; in_1 = 16'h0088; #5;
        choice = 4'b0110;
        in_0 = 16'h2060; in_1 = 16'h01ad; #5;
        in_0 = 16'h0123; in_1 = 16'habcd; #5;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;

        // 7. 4-to-16 decoder (on in_0[3:0])
        choice = 4'b0111;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;
        in_0 = 16'hffff; in_1 = 16'hffff; #5;
        choice = 4'b1111;
        in_0 = 16'h0099; in_1 = 16'h0088; #5;
        in_0 = 16'h2060; in_1 = 16'h01ad; #5;
        in_0 = 16'h0123; in_1 = 16'habcd; #5;
        in_0 = 16'h0000; in_1 = 16'h0000; #5;
        choice = 4'b0000;

        $display("choose_fxn_mem tested.");
        $finish;
    end
endmodule