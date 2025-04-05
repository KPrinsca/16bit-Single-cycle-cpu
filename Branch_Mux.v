module Branch_Mux(
    input [15:0] Branch_Inst,
    output [15:0] B_Mux_Out,
    input Branch_Sel
        );
    
    
		assign B_Mux_Out = (Branch_Sel) ? Branch_Inst : 16'b0;
	

endmodule
