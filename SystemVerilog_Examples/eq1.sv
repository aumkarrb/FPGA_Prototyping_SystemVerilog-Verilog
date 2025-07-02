`timescale 1ns / 1ps

module eq1(input logic i0, i1, output logic eq);
   logic p0, p1;
   assign p0 = ~i0 & ~i1;
   assign p1 = i0 & i1;
   assign eq = p0 | p1;
endmodule