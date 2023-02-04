`timescale 1ns/1ps
module four_bit_adder_subtractor_tb;

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
  reg [3:0] A,B;
  reg subtract;
  wire [3:0]  Result;
  wire Cout;

  integer i,j,k;
  four_bit_adder_subtractor uut(A,B,subtract,Result,Cout);
  initial begin
  $dumpfile("four_bit_adder_subtractor_tb.vcd");
  $dumpvars;
  A=4'b0000;
  B=4'b0000;
  subtract=1'b0;
  /*i=0;
  j=0;
  k=0*/
  #10;
  for (i=0 ;i<16 ;i++ ) begin
      
        for (j=0 ; j<16;j++ ) begin
         
            for (k=0 ;k<2 ;k++ ) begin
                subtract=subtract+1;
                  #10;
 
            end
                B=B+1;
              //#10;
        end
         A=A+1;
    //    #10;


  end
  

  $finish;
  end
endmodule
