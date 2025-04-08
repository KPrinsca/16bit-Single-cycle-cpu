// 
//////////////////////////////////////////////////////////////////////////////////


module Data_Memory(
    input [15:0] DMem_In, // ALU Output
    input [15:0] Data_Write, //From Register file
    input Mem_Write,
    input Mem_Read,
    input clk,
    output [15:0] DataM_out
    );
    

 reg 	[7:0] 	Memory[0:255];
 
   // Memory read operation (handling byte addressing)
    // Memory read operation (handling byte addressing)
    	    assign DataM_out = (Mem_Read) ? {Memory[DMem_In],Memory[DMem_In+1]} : 16'b0;
    always 	@(posedge clk)		   //Memory write
   		begin
   		 if (Mem_Write) begin
    Memory[DMem_In] <= Data_Write[15:8];
      Memory[DMem_In+1] <= Data_Write[7:0];
    end
  end
  
 

  

   		
    
endmodule
