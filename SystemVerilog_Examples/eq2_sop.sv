`timescale 1ns / 1ps

module eq2_sop(input logic [1:0] a, b, output logic aeqb);
  logic p0, p1, p2, p3;
  assign p0 = (~a[1] & ~b[1]) & (~a[0] & ~b[0]);
  assign p1 = (~a[1] & ~b[1]) & (a[0] & b[0]);
  assign p2 = (a[1] & b[1]) & (~a[0] & ~b[0]);
  assign p3 = (a[1] & b[1]) & (a[0] & b[0]);
  assign aeqb = p0 | p1 | p2 | p3;
endmodule