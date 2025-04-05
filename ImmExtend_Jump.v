module Sign_Extend_Jump(
    input [11:0] J_imm,
    output [15:0] J_extend
    );
    
    assign J_extend = {{4{J_imm[11]}}, J_imm};
    
endmodule
