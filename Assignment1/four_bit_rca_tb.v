`timescale 1 ns/10 ps
module four_bit_rca_tb;
  // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
  reg[3:0]  A,B;
  reg Cin;
  wire Cout;
  wire[3:0] S;

  integer i,j,k;
  four_bit_rca uut(A,B,Cin,S,Cout);
  initial begin
  $dumpfile("four_bit_rca_tb.vcd");
  $dumpvars; 


  A=4'b0000;
  B=4'b0000;
  Cin=1'b0;
  i=0;
  j=0;
  k=0;
  #10;
   for (i=0;i<16 ;i++ ) begin
   
        for (j=0 ;j<16 ;j++ ) begin
           
          for ( k =0 ;k<2 ;k++ ) begin
            Cin=Cin+1;
            #10;
          end
             B=B+1;
            
        end
           A=A+1;
    end  

 
  $finish;
  end
endmodule

   /*

     
  A=4'b0000; B=4'b0000; Cin=0;
  #10 A=4'b0000; B=4'b0000; Cin=1;
  #10 A=4'b1100; B=4'b0011; Cin=0;
  #10 A=4'b1100; B=4'b0011; Cin=1;
  #10 A=4'b1110; B=4'b0001; Cin=1;
  #10 A=4'b1100; B=4'b0011; Cin=1;
  #10 A=4'b1111; B=4'b0001; Cin=0;
  #10 A=4'b1111; B=4'b1111; Cin=1;
  #20;


   
 
  */
