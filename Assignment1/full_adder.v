module full_adder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);



    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
    
    assign S= (Cin)^(A^B);
   // xor(S,Cin,(A^B));
    assign Cout=(A&B)|(Cin&A)|(B&Cin);
//    or(Cout,(A&B),(Cin&A),(B&Cin));


endmodule