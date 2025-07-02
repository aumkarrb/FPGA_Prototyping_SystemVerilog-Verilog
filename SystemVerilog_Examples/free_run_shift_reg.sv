`timescale 1ns / 1ps

module free_run_shift_reg #(parameter N=8)(input  logic clk, reset, input  logic s_in, output logic s_out);
   logic [N-1:0] r_reg;
   logic [N-1:0] r_next;
   always_ff @(posedge clk, posedge reset)
      if (reset)
         r_reg <= 0;
      else
         r_reg <= r_next;
   assign r_next = {s_in, r_reg[N-1:1]};
   assign s_out = r_reg[0];
endmodule