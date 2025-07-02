`timescale 1ns / 1ps

module d_ff_en_1seg(input  logic clk, reset, input  logic en, input  logic d, output logic q);
   always_ff @(posedge clk, posedge reset)
      if (reset)
         q <= 1'b0;
      else if (en)
         q <= d;
endmodule