module counter_d(input reset, input clk, input mode, output [2:0] count);

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
    
    reg [0:2] current_state;
    
    wire A= current_state[0];
    wire B= current_state[1];
    wire C= current_state[2];

    dff_sync_res d1 (.D(((B & ~C & mode) | (~A & B & C & ~mode) | (A & ~B & ~mode) | (A & C & mode) | (A & ~C & ~mode))), .clk(clk), .sync_reset(reset), .Q(count[2]));

    dff_sync_res d2 (.D(((B & ~C) | (~B & C & ~mode) | (~A & C & mode))), .clk(clk), .sync_reset(reset), .Q(count[1]));

    dff_sync_res d3 (.D(((~A & ~B & mode) | (~C & ~mode) | (A & B & mode))), .clk(clk), .sync_reset(reset), .Q(count[0]));
/*

    dff_sync_res d0( (( ~pre_state[2] & pre_state[1] &mode) 
    | ( pre_state[1] & ~pre_state[0] & pre_state[2] & ~mode) | (~pre_state[1] &pre_state[0] &  ~mode) 
    | (pre_state[0] & pre_state[1] & mode) | (pre_state[0] & ~pre_state[2] & ~mode)),clk,reset,count[2]);//dff_sync_res(D, clk, sync_reset, Q);
    dff_sync_res d1( ( ~pre_state[2]&pre_state[1] ) | ( pre_state[2] &~pre_state[1] & ~mode) 
    | (~pre_state[0] & pre_state[2] & mode),clk,reset,count[1]);
    dff_sync_res d2( ( ~pre_state[1] & mode &~pre_state[0] ) | (~pre_state[2] & ~mode)
     | ( pre_state[1] & mode & pre_state[0] ),clk,reset,count[0]);
*/
    
    always @(reset or count) 
    begin
        if(reset) begin

            current_state<= 0;

        end

        else begin
            current_state<= count;
        end
    end 


endmodule