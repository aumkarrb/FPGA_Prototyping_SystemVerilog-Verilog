`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 20:29:15
// Design Name: 
// Module Name: reg_file
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


module reg_file
   #(
      parameter B = 8, // umber of bits 
                W = 2 // number of address bits 
    )
    (
    input wire clk,
    input wire wr_en,
    input wire [W-1:0] w_addr, r_addr,
    input wire [B-1:0] w_data,
    output wire [B-1:0] r_data
    );
    
    // signal declaration 
    reg [B-1:0] array_reg [2**W - 1:0];
    
    // body 
    // write operation 
    always @(posedge clk)
     if (wr_en)
        array_reg[w_addr] <= w_data;
    // read operation
    assign r_data = array_reg[r_addr];
    
 endmodule
