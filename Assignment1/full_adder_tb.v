`timescale 1 ns/10 ps
module full_adder_tb;

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
    reg A,B,Cin;
    wire S,Cout;
    integer i,j;
    full_adder uut(A,B,Cin,S,Cout);
    initial begin
    $dumpfile("full_adder_tb.vcd");
    $dumpvars;
    
    A=4'b0; B=4'b0; Cin=1'b0;
    i=0;
    j=0;
    #10;
    for (i=0;i<2 ;i++ ) begin
        A=A+1;
        for (j=0 ;j<2 ;j++ ) begin
            B=B+1;
            #10;
        end
    end
    A=4'b0; B=4'b0;
    Cin=1'b1;
     #10;
     for (i=0;i<2 ;i++ ) begin
        A=A+1;
        for (j=0 ;j<2 ;j++ ) begin
            B=B+1;
            #10;
        end
    end


    $finish;
    end


endmodule