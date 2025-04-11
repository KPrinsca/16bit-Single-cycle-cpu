

module Instruction_Memory(

    input [15:0] Instruct_In,
    output  [15:0] Address_Read
    );
    

      reg [7:0] Memory [0:255];
 


    initial begin

              
        Memory[0]  = 8'b0011_0001;  
         Memory[1]  = 8'b0001_0010;
        Memory[2]  = 8'b0011_0100; 
        Memory[3]  = 8'b0001_0011; 
        Memory[4]  = 8'b0000_0001;  
        Memory[5]  = 8'b0100_0000; 
        Memory[6]  = 8'b0000_0010; 
       Memory[7]  = 8'b0100_0001; 

          
    end
    
       assign Address_Read = {Memory[Instruct_In],Memory[Instruct_In+1]};
    
    
    
    
endmodule
