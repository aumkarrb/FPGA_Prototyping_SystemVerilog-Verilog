`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2025 07:09:14
// Design Name: 
// Module Name: free_run_bin_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module free_run_bin_counter
#(parameter N=8)
(
 input wire clk, reset, 
 output wire max_tick,
 output wire [N-1:0] q
 );
 
 // signal declaration 
 reg [N-1:0] r_reg;
 wire [N-1:0] r_next;
 
 // body
 // register 
 always @(posedge clk, posedge reset)
 if(reset)
  r_reg <= 0; // {N(1b'0)}
  else
  r_reg <= r_next;
  
  // next-state logic 
  assign r_next = r_reg + 1;
  // output logic 
  assign q = r_reg;
  assign max_tick = (r_reg==2**N-1) ? 1'b1 : 1'b0;
  // can also use (r_reg == {N{1'b1]})
  endmodule

