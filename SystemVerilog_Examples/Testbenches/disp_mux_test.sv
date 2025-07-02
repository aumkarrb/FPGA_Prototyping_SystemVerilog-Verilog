`timescale 1ns / 1ps

module disp_mux_test(input  logic clk, input  logic [3:0] btn, input  logic [7:0] sw, output logic [3:0] an, output logic [7:0] sseg);
   logic [7:0] d3_reg, d2_reg, d1_reg, d0_reg;
   
   disp_mux disp_unit
      (.clk(clk), .reset(1'b0), .in0(d0_reg), .in1(d1_reg),
       .in2(d2_reg), .in3(d3_reg), .an(an), .sseg(sseg));
   always_ff @(posedge clk)
   begin
      if (btn[3])
         d3_reg <= sw;
      if (btn[2])
         d2_reg <= sw;
      if (btn[1])
         d1_reg <= sw;
      if (btn[0])
         d0_reg <= sw;
    end
endmodule