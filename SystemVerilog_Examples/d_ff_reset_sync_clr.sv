`timescale 1ns / 1ps

module d_ff_reset_sync_clr(input  logic clk, reset, input  logic syn_clr, input  logic d, output logic q);
   always_ff @(posedge clk, posedge reset)
      if (reset)
         q <= 1'b0;
      else if (syn_clr)
         q <= 1'b0;
      else
         q <= d;
endmodule