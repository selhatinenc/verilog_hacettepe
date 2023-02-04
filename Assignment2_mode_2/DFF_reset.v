module DFF_reset (
    input d,
    input clk,
    input reset,
    output q,
    output not_q
);
    reg q_reg;
    assign not_q = ~q_reg;

    always @(posedge clk) begin
        if (reset) q_reg <= 1'b0;
        else q_reg <= d;
    end
endmodule