`timescale 1ns / 1ps

module bin_counter_tb();
   localparam  T=20;
   logic clk, reset;
   logic syn_clr, load, en, up;
   logic [2:0] d;
   logic max_tick, min_tick;
   logic [2:0] q;
   
   univ_bin_counter #(.N(3)) uut(.*);
   always
   begin
      clk = 1'b1;
      #(T/2);
      clk = 1'b0;
      #(T/2);
   end
   initial
   begin
     reset = 1'b1;
     #(T/2);
     reset = 1'b0;
   end
   initial
   begin
      syn_clr = 1'b0;
      load = 1'b0;
      en = 1'b0;
      up  = 1'b1;
      d = 3'b000;
      @(negedge reset);
      @(negedge clk);
      load = 1'b1;
      d = 3'b011;
      @(negedge clk);
      load = 1'b0;
      repeat(2) @(negedge clk);
      syn_clr = 1'b1;
      @(negedge clk);
      syn_clr = 1'b0;
      en = 1'b1;
      up = 1'b1;
      repeat(10) @(negedge clk);
      en = 1'b0; 
      repeat(2) @(negedge clk);
      en = 1'b1;
      repeat(2) @(negedge clk);
      up = 1'b0;
      repeat(10) @(negedge clk);
      wait(q==2);
      @(negedge clk);
      up = 1'b1;
      @(negedge clk);
      wait(min_tick);
      @(negedge clk);
      up = 1'b0;
      #(4*T); 
      en = 1'b0;
      #(4*T); 
      $stop;
   end
endmodule