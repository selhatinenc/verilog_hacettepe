module  four_bit_rca(input[3:0] A,inB,sum,c_out);
   input  A,B;
   output sum,c_out;
   xor(sum,A,B);
   and(c_out,A,B);

   

endmodule