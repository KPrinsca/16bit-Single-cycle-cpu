module PC_Mux(
    input [15:0] JB_Inst,
    input [15:0] PC2_Inst,
    input JBP_enable,
    output [15:0] PC_Mux_Out
    );
    
    
		assign PC_Mux_Out  = (JBP_enable) ? JB_Inst : PC2_Inst;
	
    
endmodule
