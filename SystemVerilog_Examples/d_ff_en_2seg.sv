`timescale 1ns / 1ps

module d_ff_en_2seg(input  logic clk, reset, input  logic en, input  logic d, output logic q);
   logic r_reg, r_next;
   always_ff @(posedge clk, posedge reset)
      if (reset)
         r_reg <= 1'b0;
      else
         r_reg <= r_next;
   always_comb
      if (en)
         r_next = d;
      else
         r_next = r_reg;
   assign q = r_reg;
endmodule