`timescale 1ns / 1ps

module edge_detect_gate(input  logic clk, reset, input  logic level, output logic tick);
   logic delay_reg;
    always_ff @(posedge clk, posedge reset)
       if (reset)
          delay_reg <= 1'b0;
       else
          delay_reg <= level;
   assign tick = ~delay_reg & level;
endmodule