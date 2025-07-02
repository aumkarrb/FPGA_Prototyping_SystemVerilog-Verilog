`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 20:00:04
// Design Name: 
// Module Name: d_ff_reset
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


module d_ff_reset
(
input wire clk, reset,
input wire d,
output reg q    
 );
 
 // body 
 always @(posedge clk, posedge reset)
  if (reset)
   q<= 1'b0;
  else
   q <= d;
endmodule
