module counter_d(input reset, input clk, input mode, output [2:0] count);

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
    reg[0:2] pre_state=3'b000;
   // wire[2:0] next_states;
    // here using dff d0 is A d1 is B d2 is C
    dff_sync_res d0 ((((pre_state[1] & ~pre_state[2] & mode) 
    | (~pre_state[0] & pre_state[1] & pre_state[2] & ~mode) | (pre_state[0] & ~pre_state[1] & ~mode) 
    | (pre_state[0] & pre_state[2] & mode) | (pre_state[0] & ~pre_state[2] & ~mode)))
    , (clk), (reset), (count[2]));

    dff_sync_res d1 ((((pre_state[1] & ~pre_state[2]) | (~pre_state[1] & pre_state[2] & ~mode)
     | (~pre_state[0] & pre_state[2] & mode))), (clk), (reset), (count[1]));

    dff_sync_res d2 ((((~pre_state[0] & ~pre_state[1] & mode) | (~pre_state[2] & ~mode) 
    | (pre_state[0] & pre_state[1] & mode))), (clk), (reset),(count[0]));

    always @(reset or count)begin
        if(reset==1) begin
        pre_state<=3'b000; 
               end

        else begin 
        pre_state <=count;
        end

    end

endmodule