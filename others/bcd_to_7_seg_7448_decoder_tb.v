`timescale 1ns/ 10ps
//`include "bcd_to_7_seg_7448_decoder.v"

module bcd_to_7_seg_7448_decoder_tb;
reg  A_in,B_in,C_in,D_in;
wire a_out,b_out,c_out,d_out,e_out,f_out,g_out;

bcd_to_7_seg_7448_decoder uut(A_in,B_in,C_in,D_in,a_out,b_out,c_out,d_out,e_out,f_out,g_out);
initial begin
   $dumpfile("bcd_to_7_seg_7448_decoder_tb.vcd");
   $dumpvars;
    A_in=0;
    B_in=0;
    C_in=0;
    D_in=0;
    #100;
    D_in=1;
    #100;
     A_in=0;
    B_in=0;
    C_in=1;
    D_in=0;
    #100;
    A_in=0;
    B_in=0;
    C_in=1;
    D_in=1;
    #100;
    A_in=0;
    B_in=1;
    C_in=0;
    D_in=0;
    #100;
    A_in=0;
    B_in=1;
    C_in=0;
    D_in=1;
    #100;
    A_in=0;
    B_in=1;
    C_in=1;
    D_in=0;
    #100;
    A_in=0;
    B_in=1;
    C_in=1;
    D_in=1;
    #100;
     A_in=1;
    B_in=0;
    C_in=0;
    D_in=0;
    #100;
     A_in=1;
    B_in=0;
    C_in=0;
    D_in=1;
    #100;
  
     $display("Test complete");
    $finish;
   
end
endmodule