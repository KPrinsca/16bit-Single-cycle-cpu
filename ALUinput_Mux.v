module ALU_mux(
    input [15:0] Reg_Data,
    input [15:0] Ext_Imm,
    output  [15:0] Mux_Out,
    input ALU_Src
    );
    
    
   assign Mux_Out = (ALU_Src) ? Ext_Imm : Reg_Data;
    
endmodule
