module Mem_Mux(
    input [15:0] Mem_Out,
    input [15:0] ALU_out,
    input Mem_to_Reg,
    output [15:0] Mem_Mux_Out 
    
    );
   
	assign Mem_Mux_Out  = (Mem_to_Reg) ? Mem_Out : ALU_out;
   
endmodule
