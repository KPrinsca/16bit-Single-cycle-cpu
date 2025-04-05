//////////////////////////////////////////////////////////////////////////////////

module program_counter(
    input clk,
    input reset,
    input [15:0] PC_In,
    output reg[15:0] PC_output
    );
    
    initial begin 
    PC_output = 0;
    end
    always @ (posedge clk ) 
     
    begin
   
     if(reset) 
     
         PC_output <= 0;
         
         
     else 
        PC_output <= PC_In; 
    
        
    end
    
  endmodule
