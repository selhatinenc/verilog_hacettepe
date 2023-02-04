`timescale 1ns/10ps

module four_bit_2x1_mux_tb;
	
	// Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
	   // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
  reg[3:0] A,B;
  reg Select;
  wire[3:0] Out;

  integer j;
  integer k;
  integer i;
  four_bit_2x1_mux uut(A,B,Select,Out);
  initial begin
  $dumpfile("four_bit_2x1_mux_tb.vcd");
  $dumpvars;
    
    
	// there are two choice  select 0 and select 1

  	A=4'b0000; B=4'b1111; Select=1'b0; #10;
    Select=1'b1; #10;



  $finish;
 
  end
 
  


endmodule
/*
 i=0;
    j=0;
    k=0;
 	  #10;
 	for (int j=0 ; j<16; j++) begin
      for (k=0 ; k<16; k++) begin
        for (i =0 ;i<2 ;i++ ) begin
          Select=Select+1;
            #10;
        end
          B=B+1;
        
      end
      A=A+1;
  end
  A=4'b0000; B=4'b0000; Select=1'b1;
 	#10;
 	for (int j=0 ; j<16; j++) begin
      for (k=0 ; k<16; k++) begin
          B=B+1;
          #10;
      end
      A=A+1;
  end
  */
/*
  always #40 A=A+1;
  always #20 B=B+1;
  always #10 Select=~Select;


 #10 A=4'b0000; B=4'b0000; Cin=1;
  #10 A=4'b1100; B=4'b0011; Cin=0;
  #10 A=4'b1100; B=4'b0011; Cin=1;
  #10 A=4'b1110; B=4'b0001; Cin=1;
  #10 A=4'b1100; B=4'b0011; Cin=1;
  #10 A=4'b1111; B=4'b0001; Cin=0;
  #10 A=4'b1111; B=4'b1111; Cin=1;
  #20;
  */