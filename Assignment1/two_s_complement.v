module two_s_complement(In,Out);
    input  [3:0] In;
    output  [3:0] Out;
    // first reverse then add one
    assign  Out=~In+1;
 /* 
  //   reg[3:0] Not_In;
   // wire [3:0] Add_out;

    //wire stackoverflow;

    
 
   
    
  Not_In[0]=In[0];
    Not_In[1]=In[1];
    Not_In[2]=In[2];
    Not_In[3]=In[3];
  //  not(Out[3:0],In[3:0]);
    //Out[3:0]=not In[3:0];
    // My code
    
  //  not(Out[0],In[0]);
 
 
   
  
   
      assign Out[0] =  In[0];
    assign Out[1] = In[1];
    assign Out[2] = In[2];
    assign Out[3] = In[3];
    
    
    integer  i;
    always @(*) begin
        for (i=0  ;i<4 ;i=i+1 ) begin
         not(Out[i],In[i]);
          end
    end
    */

      
 
    
    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!

endmodule  
