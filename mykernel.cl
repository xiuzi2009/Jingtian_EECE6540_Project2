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
	 int i=0;                     // i is counter for elements of matrix A and B
	 int j=0;                     // j is counter for loop
	 for (j=0; j<150; j++)  
	 	{
	 		if (j%2==0)           // Use j to mux the operation of elements in matrix
			{		
	 		
				 for (i=0; i<widthA; i++) 
		 		{		if(i==2)  //the third elements in matrix B is 0, 1 can't be divided by it. 
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

}
