
module SignExtend_M(
    input [3:0] Imm,
    output  [15:0] Imm_Ex
    );
    
    assign Imm_Ex = {{12{Imm[3]}}, Imm};
    
endmodule
