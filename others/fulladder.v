`include "halfadder.v"

module  fullader(A,B,cin,sum,c_out);
   input  A,B,cin;
   output sum,c_out;
   wire wire_1,wire_2,wire_3;
   halfadder HA1(A,B,wire_1,wire_2);
   halfadder HA2(  cin,wire_1,sum,wire_3);
    or(c_out,w2,w3);

endmodule