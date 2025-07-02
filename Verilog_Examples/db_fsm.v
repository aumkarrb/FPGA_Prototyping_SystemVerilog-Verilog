`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2025 13:25:24
// Design Name: 
// Module Name: deboucning
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


module db_fsm (
    input wire clk,
    input wire reset,
    input wire sw,
    output reg db
);

    // Symbolic state declaration
    localparam [2:0]
        zero     = 3'b000,
        wait1_1  = 3'b001,
        wait1_2  = 3'b010,
        wait1_3  = 3'b011,
        one      = 3'b100,
        wait0_1  = 3'b101,
        wait0_2  = 3'b110,
        wait0_3  = 3'b111;

    // Number of counter bits (for ~10ms tick)
    localparam N = 19;

    // Counter declaration for 10ms tick generation
    reg [N-1:0] q_reg;
    wire [N-1:0] q_next;
    wire m_tick;

    // State register
    reg [2:0] state_reg, state_next;

    // 10 ms tick generator
    always @(posedge clk) begin
        q_reg <= q_next;
    end

    assign q_next = q_reg + 1;

    assign m_tick = (q_reg == 0) ? 1'b1 : 1'b0;

    // FSM state register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state_reg <= zero;
        else
            state_reg <= state_next;
    end

    // FSM next-state and output logic
    always @* begin
        state_next = state_reg; // default to stay in current state
        db = 1'b0;              // default output is 0

        case (state_reg)
            zero: begin
                if (sw)
                    state_next = wait1_1;
            end

            wait1_1: begin
                if (!sw)
                    state_next = zero;
                else if (m_tick)
                    state_next = wait1_2;
            end

            wait1_2: begin
                if (!sw)
                    state_next = zero;
                else if (m_tick)
                    state_next = wait1_3;
            end

            wait1_3: begin
                if (!sw)
                    state_next = zero;
                else if (m_tick)
                    state_next = one;
            end

            one: begin
                db = 1'b1;
                if (!sw)
                    state_next = wait0_1;
            end

            wait0_1: begin
                db = 1'b1;
                if (sw)
                    state_next = one;
                else if (m_tick)
                    state_next = wait0_2;
            end

            wait0_2: begin
                db = 1'b1;
                if (sw)
                    state_next = one;
                else if (m_tick)
                    state_next = wait0_3;
            end

            wait0_3: begin
                db = 1'b1;
                if (sw)
                    state_next = one;
                else if (m_tick)
                    state_next = zero;
            end

            default: state_next = zero;
        endcase
    end

endmodule