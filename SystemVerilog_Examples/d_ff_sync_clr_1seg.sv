`timescale 1ns / 1ps

module d_ff_sync_clr_1seg(input  logic clk, input  logic syn_clr, input  logic d, output logic q);
   always_ff @(posedge clk)
      if (syn_clr)
         q <= 1'b0;
      else
         q <= d;
endmodule