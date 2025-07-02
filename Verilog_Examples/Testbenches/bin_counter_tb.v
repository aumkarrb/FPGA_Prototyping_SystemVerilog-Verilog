`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2025 08:34:31
// Design Name: 
// Module Name: bin_counter_tb
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


module bin_counter_tb();

// declaration
localparam T=20; //clock period 
reg clk, reset; 
reg syn_clr, load, en, up; 
reg [2:0] d; 
wire max_tick, min_tick;
wire [2:0] q; 

// uut initialization 
univ_bin_counter #(.N(3)) uut 
(.clk(clk), .reset(reset), .syn_clr(syn_clr), 
.load(load), .en(en), .up(up), .d(d), 
.max_tick(max_tick), min_tick(min_tick), .q(q));

//clock
// 20 ns clock running forever 
always 
begin 
 clk = 1'b1; 
 #(T/2);
 clk = 1'b0;
 #(T/2); 
end

// reset for the first half cycle 
initial 
begin 
reset = 1'b1; 

 #(T/2); 
 reset = 1'b0; 
end

// other stimulus
initial 
begin 
// ==== initial input ====
 syn_clr = 1'b0;
 load = 1'b0; 
 en = 1'b0;
 up = 1'b1; // count up
 d = 3'b000;
 @(negedge reset); // wall reset to deassert)
 load = 1'b0; 
 repeat(2) @(negedge clk);
 // ==== test syn_clear ====
 @(negedge clk); 
 syn_clr = 1'b0;
 //===== test up counter and pause ==== 
 en = 1'b1;  //count 
 up = 1'b1; 
 repeat(10) @(negedge clk);
 en = 1'b0; // pause 
 repeat(2) @(negedge clk);
 en = 1'b1; 
 repeat(2) @(negedge clk)
 // ==== test down counter ====
 up = 1'b0;
 repeat(10) @(negedge clk);
 // ==== wait statement ===
 // continue until q = 2
 wait (q==2);
 @(negedge clk);
 up = 1'b1;
 // continue until q = 2
 wait(q==2);
 @(negedge clk);
 up = 1'b1;
 // continue until min_tick becomes 1 
 @(negedge clk);
 wait(min_tick);
 @(negedge clk);
 up = 1'b0;
 // ==== absolute delay ====
 #(4*T); // wait for 80ns
 en = 1'b0; // pause
 #(4*T); // wait for 80 ns
 // ==== stop simulation ====
 // return to interative simulation mode 
 $stop; 
 
 end
 endmodule