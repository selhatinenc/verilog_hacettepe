`timescale 1ns/ 10ps
`include "halfadder.v"

module halfadder_tb;
reg  A_in,B_in,C_in,D_in;
wire sum_out,c_out;

halfadder_tb uut(A_in,B_in,sum_out,c_out);
initial begin
   $dumpfile("halfadder_tb.vcd");
   $dumpvars;
    A_in=0;
    B_in=0;
    #100
    A_in=0;
    B_in=1;
    #100
    A_in=1;
    B_in=0;
    #100
    A_in=1;
    B_in=1;
    
  
     $display("Test complete");
    $finish;
   
end
endmodule