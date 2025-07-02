`timescale 1ns / 1ps

module d_ff_sync_clr_2seg(input  logic clk, input  logic syn_clr, input  logic d, output logic q);
   logic r_reg, r_next;
   always_ff @(posedge clk)
      r_reg <= r_next;
   always_comb
      if (syn_clr)
         r_next = 1'b0;
      else
         r_next = d;
   assign q = r_reg;    
endmodule