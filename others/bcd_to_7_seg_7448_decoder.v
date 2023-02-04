module  bcd_to_7_seg_7448_decoder(A,B,C,D,a,b,c,d,e,f,g);
   input  A,B,C,D;
   output  a,b,c,d,e,f,g;

    assign a = (~B&~D)|(B&D) |A|(~B&C);
    assign b=~B|(~C&~D)|(C&D);
    assign c=~C|D|B;
    assign d=(~B&~D)|(~B&C)|(B&~C&D)|(C&~D);
    assign e=(~B&~D)|(C&~D);
    assign f=(~C&~D)|(B&~C)|(B&~D)|A;
    assign g=(~B&C)|(B&~C)|A|(C&~D);

endmodule