module counter_jk(input reset, input clk, input mode, output [2:0] count);

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!

    reg [0:2] current_state;
    
    wire A= current_state[0];
    wire B= current_state[1];
    wire C= current_state[2];

    jk_sync_res JK1(.J(((B & ~C & mode) | (B & C & ~mode) )), .K(((~B & ~C & mode) | (B & C & ~mode) )), .clk(clk), .sync_reset(reset), .Q(count[2]));
    jk_sync_res JK2(.J(((~A & C) | (C & ~mode))), .K(((C & ~mode) | (A & C) )), .clk(clk), .sync_reset(reset), .Q(count[1]));
    jk_sync_res JK3(.J(((~A & ~B) | (~mode) | (A & B) )), .K(((~mode) | (~A & B) | (A & ~B) )), .clk(clk), .sync_reset(reset), .Q(count[0]));

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
/*
    
    wire A= current_state[0];
    wire B= current_state[1];
    wire C= current_state[2];

module counter_jk(input reset, input clk, input mode, output [2:0] count);
    reg[0:2] pre_state=3'b000;

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
     
   
     jk_sync_res jk1((( ~pre_state[2] & pre_state[1] &mode) | ( pre_state[2] &pre_state[1] & ~mode))
     ,(( ~pre_state[2] &~pre_state[1] & mode) | (pre_state[1] & pre_state[2] & ~mode))
     ,clk,reset,count[2]);//jk_sync_res(J, K, clk, sync_reset, Q);
     jk_sync_res jk2(((~pre_state[0] & pre_state[2]) | (pre_state[2] & ~mode))
     , ((pre_state[2] & ~mode) | (pre_state[0] & pre_state[2]))
     ,clk,reset,count[1]);//jk_sync_res(J, K, clk, sync_reset, Q);
     jk_sync_res jk3(((~pre_state[0] & ~pre_state[1]) | (~mode) | (pre_state[0] & pre_state[1]))
     ,((~mode) | (~pre_state[0] & pre_state[1]) | (pre_state[0] & ~pre_state[1]))
     ,clk,reset,count[0]);//jk_sync_res(J, K, clk, sync_reset, Q);
     
       
    wire A= pre_state[0];
    wire B= pre_state[1];
    wire C= pre_state[2];

    jk_sync_res JK1(.J(((B & ~C & mode) | (B & C & ~mode) )), .K(((~B & ~C & mode) | (B & C & ~mode) )), .clk(clk), .sync_reset(reset), .Q(count[2]));
    jk_sync_res JK2(.J(((~A & C) | (C & ~mode))), .K(((C & ~mode) | (A & C) )), .clk(clk), .sync_reset(reset), .Q(count[1]));
    jk_sync_res JK3(.J(((~A & ~B) | (~mode) | (A & B) )), .K(((~mode) | (~A & B) | (A & ~B) )), .clk(clk), .sync_reset(reset), .Q(count[0]));

  
    always @(reset or count) 
    begin
        if(reset) begin

            pre_state<= 0;

        end

        else begin
            pre_state<= count;
        end
    end 
endmodule  
*/