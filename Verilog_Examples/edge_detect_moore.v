module edge_detect_moore (
    input wire clk,
    input wire reset,
    input wire level,
    output reg tick
);

    // Symbolic state declaration
    localparam [1:0]
        zero = 2'b00,
        edg  = 2'b01,
        one  = 2'b10;

    // State register and next-state signal
    reg [1:0] state_reg, state_next;

    // State register update
    always @(posedge clk or posedge reset) begin
        if (reset)
            state_reg <= zero;
        else
            state_reg <= state_next;
    end

    // Next-state logic (combinational)
    always @* begin
        state_next = state_reg; // default: stay in current state

        case (state_reg)
            zero: begin
                if (level)
                    state_next = edg;  // rising edge detected
            end

            edg: begin
                if (level)
                    state_next = one;
                else
                    state_next = zero;
            end

            one: begin
                if (~level)
                    state_next = zero;
            end

            default: state_next = zero;
        endcase
    end

    // Moore output logic (only depends on current state)
    always @* begin
        case (state_reg)
            edg: tick = 1'b1;
            default: tick = 1'b0;
        endcase
    end

endmodule