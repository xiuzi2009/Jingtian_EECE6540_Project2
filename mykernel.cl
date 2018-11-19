/* widthA=heightB for valid matrix multiplication */
__kernel void simpleMultiply(
    //__global float *global_result
        __global float *outputC,
    int widthA,
    int heightA,
    int widthB,
    int heightB,
 
    __global float *inputA,
    __global float *inputB,
    int widthX,
    int heightX, 
    __global float *inputX
)
{
	 int row = get_global_id (1);
	 int col = get_global_id (0);
	 float sum = 0.0f;
	 int i=0;
	 int j=0;
	 for (j=0; j<150; j++) 
	 	{
	 		if (j%2==0)
			{		
	 		
				 for (i=0; i<widthA; i++) 
		 		{		if(i==2)
		 					{
		 						sum += 1/(inputA[row*widthA + i]+10*j) ;
		 					}
						else
							{
								sum += 1/(inputA[row*widthA + i]+10*j) - 1/(inputB[i*widthB + col]+10*j);
							}
				 }

			}		
	
  		   		
			else
			{
		 		 for (i=0; i<widthA; i++) 
		 		{		
						if(i==2)
		 					{
		 						sum += -1/(inputA[row*widthA + i]+10*j) ;
		 					}
						else
							{
								sum += -1/(inputA[row*widthA + i]+10*j) + 1/(inputB[i*widthB + col]+10*j);
							}
				 } 

			}
		}
		outputC[row*widthB + col] = sum;
		

    /* get global position in Y direction */
   // int even = get_global_id (1);
    /* get global position in X direction */
   // int odd = get_global_id (0);

 
	//barrier(CLK_LOCAL_MEM_FENCE);
	//float sum = 0.0f;

    /* calculate result of one element of Matrix C */
    //for (int i=0; i<100; i++) 
		//{
       // global_result = 1/(odd+2*i+1) - 1/(even+2*i+1);
     
    	//}
      //barrier(CLK_GLOBAL_MEM_FENCE);
	 // *global_result=odd;
}
