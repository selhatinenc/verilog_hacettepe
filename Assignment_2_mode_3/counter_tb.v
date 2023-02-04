`timescale 1ns/1ps

module counter_tb;
    reg reset, clk, mode; 
    wire [2:0] count;
    integer i;
	
	//Comment the next line out when testing your JK flip flop implementation.
    //counter_d uut(reset, clk, mode, count);
    // Uncomment the next line to test your JK flip flop implementation.
    counter_jk c1(reset, clk, mode, count);




    initial begin
        // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
        // Make sure to use $finish statement to avoid infinite loops.

        $dumpfile("Testbench_result.vcd");
        $dumpvars;

        #10; 
        mode=0;
        reset= 1;

        #22;
        reset=0;

        #150;
        mode=1;

        #150;
        reset=1;
        
        #22; 



        $display("Test completed..");
        $finish;
    end

////////////////////////////////////////////////////////////////////////////////////////////////////////////
   always @(posedge clk)
    for (i=0;i<30;i++) begin
        #10 clk = !clk;
    end
endmodule


/*



`timescale 1ns/1ps

module counter_tb;
    reg reset, clk, mode; 
    wire [2:0] count;
    integer i;
	
	//Comment the next line out when testing your JK flip flop implementation.
   // counter_d uut(reset, clk, mode, count);
    // Uncomment the next line to test your JK flip flop implementation.
    counter_jk c1(reset, clk, mode, count);

    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars;
     
        mode=0;
        reset=1; #10;// first ten ns reset is 1
        reset=0; #120;// 10 to 90 ns reset is 0
        mode=1; #240;
        reset=1;    #10;
       // mode=1 #80;

        $finish;
        // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
        // Make sure to use $finish statement to avoid infinite loops.
    end
    initial begin
          clk=0;
        
        for ( i = 0; i < 40; i++) begin
            #10 clk = ~clk;
         
        
        end
    end
endmodule





    initial begin
        clk=0;
        forever begin
            #10;
            clk=~clk;

        end
        
        // Generate clock
        // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!

    end
    endmodule
    */