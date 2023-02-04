module counter (
    input clk,
    input reset,
    input mode,
    output [2:0] count
);
    // Instantiate three D flip-flop modules
    DFF_reset dff1 (
        .d(carry_out),
        .clk(clk),
        .reset(reset),
        .q(count[0]),
        .not_q(not_q1)
    );
    DFF_reset dff2 (
        .d(mode ? not_q1 : carry_out),
        .clk(clk),
        .reset(reset),
        .q(count[1]),
        .not_q(not_q2)
    );
    DFF_reset dff3 (
        .d(mode ? not_q2 : carry_out),
        .clk(clk),
        .reset(reset),
        .q(count[2]),
        .not_q(not_q3)
    );
    // Output carry_o   ut is the inverse of the 3-bit count value
    assign carry_out = ~count;
endmodule