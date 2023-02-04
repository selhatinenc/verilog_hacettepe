module four_bit_adder_subtractor(A, B, subtract, Result, Cout);
    input  [3:0] A;
    input  [3:0] B;
    input subtract;
    output  [3:0] Result;
    output Cout;
    
    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
    output [3:0] comp_of_b ;
    two_s_complement Two_s_compl_of_B(B,comp_of_b);
    output[3:0] outofmux;
    four_bit_2x1_mux Four_Bit_Mux(comp_of_b,B,subtract,outofmux);
    four_bit_rca F_bit_rca(A,outofmux,1'b0, Result,Cout);

endmodule
