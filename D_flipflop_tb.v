`timescale 1ns / 1ns
`include "basic_flipflops.v"

module D_flipflop_tb;
    reg D = 1;
    reg wr = 1;
    reg CLK = 1;
    wire Q;

    D_flipflop UUT (.D(D), .wr(wr), .CLK(CLK), .Q(Q));

    always begin
        $display("Time: %0t | CLK: %b", $time, CLK);
        #1;
        CLK = ~CLK;
        #9;
    end

    initial begin
        CLK = 1; D = 0; wr = 1;
        $dumpfile("D_flipflop_tb.vcd");
        $dumpvars(0, D_flipflop_tb);
        
        #20;
        D = 0; wr = 0; #20;
        D = 1; wr = 0; #20;
        D = 0; wr = 1; #20;
        D = 1; wr = 1; #20;
        D = 1; wr = 0; #20;
        D = 0; wr = 0; #20;
        D = 0; wr = 1; #20;
        D = 1; wr = 0; #20;
        D = 0; wr = 0; #20;

        $display("D_flipflop tested.");
        $finish;
    end
endmodule