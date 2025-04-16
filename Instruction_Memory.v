
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
        {Memory[0],Memory[1]} = 16'hffff;
        Memory[2]  = 8'b0011_0001;  //addi rt/rd -1,
        Memory[3]  = 8'b0001_0010;//addi rs-1
        Memory[4]  = 8'b0011_0100; //addi rt/rd-2
        Memory[5]  = 8'b0001_0011; //addi rs-0
        Memory[6]  = 8'b0000_0001;  //add rt/rd-
        Memory[7]  = 8'b0100_0000; //add rs-6
        Memory[8]  = 8'b0000_0010;//sub
       Memory[9]  = 8'b0100_0001;//sub  
       Memory[10] = 8'b0001_0110; //lw
       Memory[11] = 8'b0001_0110;//lw
       Memory[12] = 8'b0000_0100;//add
       Memory[13] = 8'b0001_0000;//add
       Memory[14] = 8'b0010_0100;//sw
       Memory[15] = 8'b0001_0010;//sw
       Memory[16] = 8'b0001_0111;//lw
       Memory[17] = 8'b0010_0100;//lw      
       Memory[18] = 8'b0100_0001;//beq
       Memory[19] = 8'b0001_0010;//beq
       Memory[20] = 8'b0011_1010; //addi
       Memory[21] = 8'b0011_0101; //addi
       Memory[22] = 8'b0000_0000; //and
       Memory[23] = 8'b0000_0011; //and
       Memory[24]  = 8'b0000_0111;  //sll rt/rd -1,
       Memory[25]  = 8'b0010_0010;//sll rs-1
       Memory[26]  = 8'b0110_0000;  //jump rt/rd -1,
       Memory[27]  = 8'b0000_0101;//jump rs-1
       Memory[38]  = 8'b0000_0001;  //and rt/rd -1,
       Memory[39]  = 8'b0010_0011;//and rs-1
       Memory[40]  = 8'b0101_0000; //bne
       Memory[41]  = 8'b0100_1010; //bne

          
    end
    
       assign Address_Read = {Memory[Instruct_In],Memory[Instruct_In+1]};
    
    
    
    
endmodule
