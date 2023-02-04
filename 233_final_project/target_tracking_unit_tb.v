`timescale 1us/1ns

module target_tracking_unit_tb;
    reg rst;
    reg track_target_command;
    reg clk;
    reg echo;
    wire trigger_radar_transmitter;
    wire [13:0] distance_to_target;
    wire target_locked;
    wire [1:0] TTU_state;

    target_tracking_unit uut(rst, track_target_command, clk, echo, trigger_radar_transmitter, distance_to_target, target_locked, TTU_state);

    initial begin

        // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!,
        // Please inspect the provided waveforms very carefully and try to produce the same results.
        // Make sure to use $finish statement to avoid infinite loops.
        $dumpfile("target_tracking_unit.vcd");
        $dumpvars;

        rst = 1;
        track_target_command = 0;
        clk = 0;
        echo = 0;
        #10 rst = 0;
        #20 track_target_command =1;
  
        #10 track_target_command =0;
        #70 echo = 1;
        #1 echo = 0;
        #350;

        track_target_command = 1;
        #10 track_target_command = 0;

        #190 track_target_command = 1;
        #10 track_target_command = 0;
        
        #70 echo = 1;
        #1 echo = 0;
        #30;
        track_target_command =1;
    
        #20;track_target_command =0;
        #40;
         echo = 1;
          #1;
        echo = 0;

           #150;
        $finish;
                
    end

    initial begin
        clk = 0;
        forever begin
            #5;
            clk = ~clk;
        end
    end

endmodule

