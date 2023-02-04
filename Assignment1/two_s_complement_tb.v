`timescale 1ns/10ps
module two_s_complement_tb;

   // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!

//input[3:0] In_test;
wire[3:0 ] outputtest;
reg[3:0]  In_test;
integer i=0;
two_s_complement uut(In_test,outputtest);
initial begin
   $dumpfile("two_s_complement_tb.vcd");
   $dumpvars;
         In_test=4'b0000;
          #10;
      for (i=1; i<16;i++ ) begin
         In_test=In_test+1;
          #10;
      end

         
         /* 
         for (j=0 ;j<15 ;j=j+1 ){
            In_test=In_test+1;
             #100
         
         } 
         */
          $finish;
   
end
endmodule      
        
        
  
   




