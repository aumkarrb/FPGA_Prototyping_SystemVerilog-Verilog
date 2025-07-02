`timescale 1ns / 1ps

module d_ff(input  logic clk, input  logic d, output logic q);
   always_ff @(posedge clk)
      q <= d;
endmodule