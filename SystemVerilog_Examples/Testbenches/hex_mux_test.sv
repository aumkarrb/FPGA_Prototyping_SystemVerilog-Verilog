`timescale 1ns / 1ps

module hex_mux_test(input  logic clk, input  logic [7:0] sw, output logic [3:0] an, output logic [7:0] sseg);
   logic [3:0] a, b;
   logic [7:0] sum;

   disp_hex_mux disp_unit
      (.clk(clk), .reset(1'b0),
       .hex3(sum[7:4]), .hex2(sum[3:0]), .hex1(b), .hex0(a),
       .dp_in(4'b1011), .an(an), .sseg(sseg));
   assign a = sw[3:0];
   assign b = sw[7:4];
   assign sum = {4'b0,a} + {4'b0,b};
endmodule