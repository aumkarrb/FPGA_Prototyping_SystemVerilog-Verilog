`timescale 1ns / 1ps

module disp_hex_mux(input  logic clk, reset, input  logic [3:0] hex3, hex2, hex1, hex0, input  logic [3:0] dp_in, output logic [3:0] an, output logic [7:0] sseg);
   localparam N = 18;
   logic [N-1:0] q_reg;
   logic [N-1:0] q_next;
   logic [3:0] hex_in;
   logic dp;
   always_ff @(posedge clk, posedge reset)
      if (reset)
         q_reg <= 0;
      else
         q_reg <= q_next;
   assign q_next = q_reg + 1;
   always_comb
      case (q_reg[N-1:N-2])
         2'b00:
            begin
               an =  4'b1110;
               hex_in = hex0;
               dp = dp_in[0];
            end
         2'b01:
            begin
               an =  4'b1101;
               hex_in = hex1;
               dp = dp_in[1];
            end
         2'b10:
            begin
               an =  4'b1011;
               hex_in = hex2;
               dp = dp_in[2];
            end
         default:
            begin
               an =  4'b0111;
               hex_in = hex3;
               dp = dp_in[3];
            end
       endcase
   always_comb
   begin
      case(hex_in)
         4'h0: sseg[6:0] = 7'b1000000;
         4'h1: sseg[6:0] = 7'b1111001;
         4'h2: sseg[6:0] = 7'b0100100;
         4'h3: sseg[6:0] = 7'b0110000;
         4'h4: sseg[6:0] = 7'b0011001;
         4'h5: sseg[6:0] = 7'b0010010;
         4'h6: sseg[6:0] = 7'b0000010;
         4'h7: sseg[6:0] = 7'b1111000;
         4'h8: sseg[6:0] = 7'b0000000;
         4'h9: sseg[6:0] = 7'b0010000;
         4'ha: sseg[6:0] = 7'b0001000;
         4'hb: sseg[6:0] = 7'b0000011;
         4'hc: sseg[6:0] = 7'b1000110;
         4'hd: sseg[6:0] = 7'b0100001;
         4'he: sseg[6:0] = 7'b0000110;
         default: sseg[6:0] = 7'b0001110;
     endcase
     sseg[7] = dp;
   end
endmodule