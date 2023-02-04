`timescale 1ns/ 10ps
`include "fullader.v"

module bcd_to_7_seg_7448_decoder_tb;
reg  A_in,B_in,C_in;
wire sum_out,c_out;

bcd_to_7_seg_7448_decoder uut(A_in,B_in,C_in,sum_out,c_out);
initial begin
   $dumpfile("halfadder_tb.vcd");
   $dumpvars;
  A_in=0;
  B_in=0;
  C_in=0;
  #100
  
    A_in=0;  B_in=0;    C_in=0; #100
    A_in=0;  B_in=0;    C_in=1; #100
    A_in=0;  B_in=1;    C_in=0; #100
    A_in=0;  B_in=1;    C_in=1; #100
    A_in=1;  B_in=0;    C_in=0; #100
     A_in=1;  B_in=0;    C_in=1; #100
    A_in=1;  B_in=1;    C_in=1; 
     $display("Test complete");
    $finish;
   
end
endmodule