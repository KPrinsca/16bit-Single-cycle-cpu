// 
//////////////////////////////////////////////////////////////////////////////////

module Data_Memory(
    input [15:0] DMem_In, // ALU Output
    input [15:0] Data_Write, //From Register file
    input Mem_Write,
    input Mem_Read,
    input clk,
    output reg[15:0] DataM_out
    );
    
//    reg 	[15:0] 	Memory[63:0];
 reg 	[7:0] 	Memory[255:0];
 
    integer i;

wire [7 : 0] Mem_addr = DMem_In[7:0]; 

initial begin
  
  for (i = 0; i < 256; i = i + 1) begin
    Memory[i] = 8'b0;
  end
end

always@(*) begin
      if(Mem_Read) begin
 DataM_out = {Memory[Mem_addr],Memory[Mem_addr+1]};
      end 
      else begin
            DataM_out = 16'b0; 
        end

end
    always 	@(negedge  clk)		   //Memory write
   		begin
   		 if (Mem_Write) begin
    Memory[Mem_addr] <= Data_Write[15:8];
      Memory[Mem_addr+1] <= Data_Write[7:0];
    end
  end
  
  // Memory read operation (handling byte addressing)
    // Memory read operation (handling byte addressing)

    
endmodule
