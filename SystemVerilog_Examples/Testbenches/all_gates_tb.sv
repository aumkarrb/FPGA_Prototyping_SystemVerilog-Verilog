`timescale 1ns / 1ps

module all_gates_tb();
logic a, b;
logic y_and, y_or, y_not_a, y_not_b, y_xor, y_nand, y_nor, y_xnor;

all_gates uut(.a(a), .b(b), .y_and(y_and), .y_or(y_or), .y_not_a(y_not_a), .y_not_b(y_not_b), .y_xor(y_xor), .y_nand(y_nand), .y_nor(y_nor), .y_xnor(y_xnor));
    initial begin
        a = 0;
        b = 0;
        #100;
        a = 0;
        b = 1;
        #100;
        a = 1;
        b = 0;
        #100;
        a = 1;
        b = 1;
        #100;
        $finish;
    end
endmodule
