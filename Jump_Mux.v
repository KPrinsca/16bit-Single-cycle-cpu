    module Jump_Mux(
    input [15:0] Jump_Inst,
    input [15:0] Branch_Inst,
    input Jump_sel,
    output [15:0] Jump_Mux_Out 
    );
    
   
		assign Jump_Mux_Out  = (Jump_sel) ? Jump_Inst : Branch_Inst;
	
    
endmodule
