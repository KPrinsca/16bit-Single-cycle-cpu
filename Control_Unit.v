
module Control_Unit(
  
    input [3:0] opcode,
    input [3:0] Funct_field,
    output  reg[3:0] ALU_op,
    output  reg Mem_Write, Mem_Read,Mem_to_Reg,Reg_Write,Branch,Jump,ALU_Src,Jump_Branch
   
    );
    
      always @(*) 
      begin 


           case(opcode)
            
                  4'b0000: begin //R-type Instruction
                  Reg_Write = 1'b1;
                     case(Funct_field)
                            4'b0000: ALU_op <= 4'b0000; //add
                            4'b0001: ALU_op <= 4'b0001; //sub
                            4'b0010: ALU_op <= 4'b0010; //sll
                            4'b0011: ALU_op <= 4'b0011; //and
                            
                     endcase
                        Mem_Write = 0;
                        Mem_Read = 0;
                        Mem_to_Reg = 0;
                        Reg_Write = 1;
                        Branch = 0;
                        Jump = 0;
                        ALU_Src = 0;
                        Jump_Branch = 0; 
                     
                     end
            
                    
            4'b0001: begin //LW Instruction
                    ALU_op <= 4'b0000;
                    Mem_Write = 0;
                    Mem_Read <= 1'b1;
                    Mem_to_Reg <= 1'b1;
                    Reg_Write <= 1'b1;
                    Branch = 0;
                    Jump = 0;
                    ALU_Src <= 1'b1;
                    Jump_Branch = 0;  
                    end  

            4'b0010: begin //SW Instruction
                    ALU_op <= 4'b0000;
                    Mem_Write <= 1'b1;
                    Mem_Read = 0;
                    Mem_to_Reg = 0;
                    Reg_Write = 0;
                    Branch = 0;
                    Jump = 0;
                    ALU_Src <= 1;
                    Jump_Branch = 0;  
                    end 
 
             4'b0011: begin //addi Instruction
                    ALU_op <= 4'b0000;
                    Mem_Write = 0;
                    Mem_Read = 0;
                    Mem_to_Reg = 0;
                    Reg_Write <= 1'b1;
                    Branch = 0;
                    Jump = 0;
                    ALU_Src <= 1'b1;
                    Jump_Branch = 0;  
                    end 

            4'b0100: begin //beq Instruction
                    ALU_op <= 4'b0001;
                    Mem_Write = 0;
                    Mem_Read = 0;
                    Mem_to_Reg = 0;
                    Reg_Write = 0;
                    Branch <= 1'b1;
                    Jump = 0;
                    ALU_Src = 0;
                    Jump_Branch <= 1'b1;  
                    end  
 
            4'b0101: begin //bne Instruction
                    ALU_op <= 4'b0001;
                    Mem_Write = 0;
                    Mem_Read = 0;
                    Mem_to_Reg = 0;
                    Reg_Write = 0;
                    Branch <= 1'b1;
                    Jump = 0;
                    Reg_Write = 1;ALU_Src = 0;
                    Jump_Branch <= 1'b1;  
                    end           
 
            4'b0110: begin //jump Instruction
                    ALU_op <= 4'bxxxx;
                    Mem_Write = 0;
                    Mem_Read = 0;
                    Mem_to_Reg = 0;
                    Reg_Write = 0;
                    Branch = 0;
                    Jump <= 1'b1;
                    ALU_Src = 0;
                    Jump_Branch <= 1'b1;  
                    end  
            default: begin
                  
      
                    
                    end  

       endcase
      end
endmodule      
      

    
