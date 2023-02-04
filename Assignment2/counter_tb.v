

`timescale 1ns/1ps

module counter_tb;
    reg reset, clk, mode; 
    wire [2:0] count;
    integer i;
	
	//Comment the next line out when testing your JK flip flop implementation.
     counter_d uut(reset, clk, mode, count);
    // Uncomment the next line to test your JK flip flop implementation.
   // counter_jk c1(reset, clk, mode, count);




    initial begin
        // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
        // Make sure to use $finish statement to avoid infinite loops.

        $dumpfile("counter_tb.vcd");
        $dumpvars;
        i=0;
        clk=0;
        mode=0;   
        reset= 1;
        // first 15 reset 0 then 1
        #30;
        reset=0;

        #195;
        mode=1;
        #200;
        reset=1;
        #30; 



        $finish;
    end

   initial begin
          clk=0;
        
        for ( i = 0; i < 50; i++) begin
            #10 clk = ~clk;
         
        
        end
    end
endmodule
