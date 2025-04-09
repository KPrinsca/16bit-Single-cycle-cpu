

module Instruction_Memory(

    input [15:0] Instruct_In,
    output  [15:0] Address_Read
    );
    

      reg [7:0] Memory [0:255];
 


    initial begin

              // Load instructions
        Memory[0]  = 8'b0011_0001;  //addi rt/rd -1,
         Memory[1]  = 8'b0001_0010;//addi rs-1
        Memory[2]  = 8'b0011_0100; //addi rt/rd-2
        Memory[3]  = 8'b0001_0011; //addi rs-0
        Memory[4]  = 8'b0000_0001;  //add rt/rd-
        Memory[5]  = 8'b0100_0000; //add rs-6 
        Memory[6]  = 8'b0000_0010;//sub 
       Memory[7]  = 8'b0100_0001;//sub  

          
    end
    
       assign Address_Read = {Memory[Instruct_In],Memory[Instruct_In+1]};
    
    
    
    
endmodule
