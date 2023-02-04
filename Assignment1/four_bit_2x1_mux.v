module four_bit_2x1_mux(In_1, In_0, Select, Out);
	input  [3:0] In_1;
	input  [3:0] In_0;
	input Select;
	output  [3:0] Out;

	// Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!

	// if select ==0 then In_0 otherwise In_1 resource =https://technobyte.org/verilog-multiplexer-2x1/
		assign Out=(Select)?In_1:In_0;



endmodule
	/*
	always @(In_1 or In_0 or Select)
begin
assign Out[0]=(Select)?In_1[0]:In_0[0];
assign Out[1]=(Select)?In_1[1]:In_0[1];
assign Out[2]=(Select)?In_1[2]:In_0[2];
assign Out[3]=(Select)?In_1[3]:In_0[3];
end
	assign Out[1]=(Select)?In_1[1]:In_0[1];
	assign Out[2]=(Select)?In_1[2]:In_0[2];
	assign Out[3]=(Select)?In_1[3]:In_0[3];

		initial begin
		 if(select=0) 
		Out[0]=In_1[0];
	end
	always @ (*)
	casex (Select)
		1'b0:  Out[0]=In_1[0];
		1'b1: Out=In_0;	 
		
	endcase
	*/