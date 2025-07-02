`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 20:08:31
// Design Name: 
// Module Name: d_ff_en_2seg
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


module d_ff_en_2seg
   (
   input wire clk, reset,
   input wire en, 
   input wire d, 
   output reg q
   );
   
   // signal declalration 
   reg r_reg , r_next;
   // body 
   // DFF 
   always @(posedge clk, posedge reset)
   if (reset)
     r_reg <= 1'b0;
   else
     r_reg <= r_next;
     
   // next-state logic
   always @*
   if (en)
        r_next = d; 
   else 
   r_next = r_reg;
   
   // output logic 
   always @*
    q = r_reg;    
endmodule
