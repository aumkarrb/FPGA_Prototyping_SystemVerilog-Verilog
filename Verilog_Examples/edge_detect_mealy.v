module edge_detect_mealy (
    input wire clk,
    input wire reset,
    input wire level,
    output reg tick
);

    // Symbolic state declaration
    localparam zero = 1'b0,
               one  = 1'b1;

    // Internal state registers
    reg state_reg, state_next;

    // State register update (sequential)
    always @(posedge clk or posedge reset) begin
        if (reset)
            state_reg <= zero;
        else
            state_reg <= state_next;
    end

    // Next-state logic and Mealy output logic (combinational)
    always @* begin
        // Defaults
        state_next = state_reg;
        tick = 1'b0;

        case (state_reg)
            zero: begin
                if (level) begin
                    tick = 1'b1;       // Rising edge detected
                    state_next = one;  // Move to 'one' state
                end
            end

            one: begin
                if (~level)
                    state_next = zero; // Wait for level to go low again
            end

            default: state_next = zero;
        endcase
    end

endmodule