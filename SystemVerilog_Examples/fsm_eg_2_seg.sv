`timescale 1ns / 1ps

module fsm_eg_2_seg(input  logic clk, reset, input  logic a, b, output logic y0, y1);
   typedef enum {s0, s1, s2} state_type;
   state_type state_reg, state_next;
    always_ff @(posedge clk, posedge reset)
       if (reset)
          state_reg <= s0;
       else
          state_reg <= state_next;
   always_comb
   begin
      state_next = state_reg;
      y1 = 1'b0;
      y0 = 1'b0;
      case (state_reg)
         s0: begin
                y1 = 1'b1;
                if (a)
                   if (b)
                      begin
                         state_next = s2;
                         y0 = 1'b1;
                      end
                   else
                      state_next = s1;
             end
         s1: begin
               y1 = 1'b1;
               if (a)
                 state_next = s0;
             end
         s2: state_next = s0;
         default: state_next = s0;
      endcase
   end
endmodule
