module ALU_Unit(
    input [15:0] ALU_InA,
    input [15:0] ALU_InB,
    input [3:0] ALU_cont,
    output reg[15:0] ALU_output,
    output  ALU_zero
    );
    
    always @(*)
    begin
         case(ALU_cont)
         4'b0000: ALU_output <= ALU_InA + ALU_InB;  
         4'b0001:  ALU_output <= ALU_InA - ALU_InB; 
         4'b0010:  ALU_output <= ALU_InB << ALU_InA;  
         4'b0011:  ALU_output <= ALU_InA & ALU_InB;   
         default:  ALU_output <= 16'b0000000000000000;              
         endcase
         
    end
    
  assign ALU_zero = (ALU_output ==16'b0) ? 1'b1 : 1'b0;
   

   
    
endmodule
