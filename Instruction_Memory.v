
 module Instruction_Memory(
  
    input [15:0] Instruct_In,
    output [15:0] Address_Read
    );

      reg [7:0] Memory [0:255];
 

integer i;
    initial begin
     
       for (i = 0; i < 256; i = i + 1) begin
           Memory[i] = 8'b0;
       end
        end
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
       Memory[8] = 8'b0001_0110; //lw
       Memory[9] = 8'b0001_0110;//lw
       Memory[10] = 8'b0000_0100;//add
       Memory[11] = 8'b0001_0000;//add
       Memory[12] = 8'b0010_1010;//sw
       Memory[13] = 8'b0001_0010;//sw
       Memory[14] = 8'b0001_1010;//lw
       Memory[15] = 8'b0010_0101;//lw       
       Memory[14] = 8'b0100_0001;//branch
       Memory[15] = 8'b0001_0010;//branch 
       Memory[20]  = 8'b0011_0110;  //addi rt/rd -1,
       Memory[21]  = 8'b0100_1000;//addi rs-1
       Memory[22]  = 8'b0110_0000;  //jump rt/rd -1,
       Memory[23]  = 8'b0000_0101;//jump rs-1
       Memory[44]  = 8'b0000_0001;  //sub rt/rd -1,
       Memory[45]  = 8'b0100_0001;//sub rs-1

          
    end
    
       assign Address_Read = {Memory[Instruct_In],Memory[Instruct_In+1]};
    
    
    
    
endmodule
