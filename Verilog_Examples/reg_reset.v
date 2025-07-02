`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 20:13:27
// Design Name: 
// Module Name: reg_reset
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
module reg_reset
   (
   input wire clk, reset, 
   input wire [7:0] d, 
   output reg [7:0] q
    );
  
  // body 
  always @(posedge clk, posedge reset)
  if (reset)
   q<=0;
   else 
   q<=d;
endmodule
