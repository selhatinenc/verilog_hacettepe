 

module counter_jk(input reset, input clk, input mode, output [2:0] count);

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!

    reg [0:2]  pre_state;
    // pre state hold previous states.
    // jk ff are used below
    jk_sync_res jk0((( pre_state[1] & ~ pre_state[2] & mode) 
    | ( pre_state[1] &  pre_state[2] & ~mode) ), ((~ pre_state[1] & ~ pre_state[2] & mode)
     | ( pre_state[1] &  pre_state[2] & ~mode) ), clk, (reset), count[2]);
   
    jk_sync_res jk1(((~ pre_state[0] &  pre_state[2]) | ( pre_state[2] & ~mode))
    , (( pre_state[2] & ~mode) | ( pre_state[0] &  pre_state[2]) ), clk, (reset), count[1]);
   
    jk_sync_res jk2(((~ pre_state[0] & ~ pre_state[1]) | (~mode) | ( pre_state[0] &  pre_state[1]) )
    , ((~mode) | (~ pre_state[0] &  pre_state[1]) | ( pre_state[0] & ~ pre_state[1]) )
    , clk, (reset), count[0]);

always @(reset or count) 
    begin
        if(reset==1) begin

            pre_state<= 0;

        end

        else begin
            pre_state<= count;
        end
    end 

endmodule

