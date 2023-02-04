module four_bit_rca(
    input  [3:0] A,
    input  [3:0] B,
    input Cin,
    output  [3:0] S,
    output Cout
);

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
    
    wire[2:0] Carries;
    full_adder F1(A[0],B[0],Cin, S[0],Carries[0]);
    full_adder F2(A[1],B[1],Carries[0], S[1],Carries[1]);
    full_adder F3(A[2],B[2],Carries[1], S[2],Carries[2]);
    full_adder F4(A[3],B[3],Carries[2], S[3],Cout);
    


endmodule