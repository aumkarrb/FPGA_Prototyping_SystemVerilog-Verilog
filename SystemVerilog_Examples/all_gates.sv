`timescale 1ns / 1ps

module all_gates(input logic a, b, output logic y_and, y_or, y_not_a, y_not_b, y_xor, y_nand, y_nor, y_xnor);
  assign y_and = a & b;
  assign y_or = a | b;
  assign y_not_a = ~a;
  assign y_not_b = ~b;
  assign y_xor = a ^ b;
  assign y_nand = ~(a & b);
  assign y_nor = ~(a | b);
  assign y_xnor = ~(a ^ b);
endmodule
