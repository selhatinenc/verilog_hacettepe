module counter_tb;
    // Inputs
    reg clk;
    reg reset;
    reg mode;
    // Outputs
    wire [2:0] count;

    // Instantiate the counter under test
    counter uut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .count(count)
    );

    // Test case 1: Count in binary mode from 0 to 7
    initial begin
        $dumpfile("counter_tb_mode_2.vcd");
        $dumpvars;
        reset = 1;
        #1 reset = 0;
        mode = 0;
        for (integer i = 0; i < 8; i++) begin
            #1 clk = 1;
            #1 clk = 0;
        end
    end

    // Test case 2: Count in gray code mode from 0 to 7
    initial begin
        reset = 1;
        #1 reset = 0;
        mode = 1;
        for (integer i = 0; i < 8; i++) begin
            #1 clk = 1;
            #1 clk = 0;
        end
    end
endmodule