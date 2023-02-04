`timescale 1us/1ns



    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
    // You should implement the target_tracking_unit module HERE using behavioral design approach. 
    // You should read the instructions first and make sure you understand the problem completely.
    // Please inspect the provided waveforms very carefully and try to produce the same results.
    
module target_tracking_unit(
    input rst,
    input track_target_command,
    input clk,
    input echo,
    output reg trigger_radar_transmitter,
    output reg [13:0] distance_to_target,
    output reg target_locked,
    output [1:0] TTU_state
);

    reg [13:0] time_between_locked;// it hold time in order to calc distance
    reg [1:0] curr_state,next_state;
    reg [32:0] time_of_start,time_of_end;// for any two state we may need time.


    always@(posedge clk,negedge track_target_command,trigger_radar_transmitter,rst,echo,TTU_state,curr_state) begin
        
         if (rst==1'b1) begin
            // reset is high state reset all variables
            trigger_radar_transmitter <= 0;
            curr_state <= 0;
            target_locked <= 0;
                distance_to_target <= 0;

            
        end
        else begin
            curr_state <= next_state;
            if(curr_state == 0) begin
                if(track_target_command == 1) begin
                    next_state = 2'b01;
                    trigger_radar_transmitter <= 1'b1;
                end

                else
                begin
                     next_state = 2'b00;
               end
            end
            if(curr_state == 2'b01) begin
            
                    if(distance_to_target==1'b0)begin
                   
                    trigger_radar_transmitter <= 1;  #50;
                    trigger_radar_transmitter <= 0;
                    end
                    else
                    begin
                          
                          trigger_radar_transmitter <= 1;
                    #40;
                    trigger_radar_transmitter <= 0;
                    end
                     curr_state = 2'b10;
                    next_state = curr_state;
                    time_of_start = $time;
                   
                
                
            end
            if(curr_state == 2'b10) begin
            

            time_of_end = $time;    
            if(time_of_end -time_of_start > 90)
            begin

             next_state = 2'b00;
                
            end
            else if(echo==1)begin
                    

            distance_to_target <= ((time_of_end-time_of_start)*( 3/2 * 100));             target_locked <= 1;

                    
                end



            trigger_radar_transmitter <= 0;

            if(target_locked ==1)begin
                    time_of_start = $time;

                    next_state = 2'b11;
                      if(echo==1)begin
                        curr_state = next_state;
                    end

                     
                end
                

                
            end
            // track state here
            if(curr_state == 2'b11) 
            
            begin

                time_of_end = $time;
            // track target when is high
                if(track_target_command == 1) begin
                    curr_state = 2'b01;
                    next_state = curr_state;
                    target_locked <= 0;
                    trigger_radar_transmitter <= 1;
                    
                    
                end

                // if time elapsed did not passed 300np
                else if(time_of_end - time_of_start >= 300) 
                
                begin
                curr_state = 0;
                next_state = curr_state;

                    trigger_radar_transmitter <= 0;
                    distance_to_target <= 0;
                    target_locked <= 0;
                end


                else begin

                
                end
            
            end

       
        end
    end
    

    assign TTU_state = curr_state;
endmodule

